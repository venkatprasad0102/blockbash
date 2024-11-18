pragma solidity ^0.8.0;

contract Voting {
    mapping(string => uint256) public votes;
    string[] public parties;

    constructor() {
        parties = ["PartyA", "PartyB", "PartyC", "PartyD"];
        for (uint256 i = 0; i < parties.length; i++) {
            votes[parties[i]] = 0;
        }
    }

    function voteForParty(string memory party) public {
        require(validParty(party), "Invalid party");
        votes[party]++;
    }

    function getVotesForParty(string memory party) public view returns (uint256) {
        require(validParty(party), "Invalid party");
        return votes[party];
    }

    function getTotalVotes() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < parties.length; i++) {
            total += votes[parties[i]];
        }
        return total;
    }

    function validParty(string memory party) internal view returns (bool) {
        for (uint256 i = 0; i < parties.length; i++) {
            if (keccak256(abi.encodePacked(parties[i])) == keccak256(abi.encodePacked(party))) {
                return true;
            }
        }
        return false;
    }
}