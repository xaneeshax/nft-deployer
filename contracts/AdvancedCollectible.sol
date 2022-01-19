
// SPDX-License-Identifier: MIT

pragma solidity 0.6.6;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract AdvancedCollectible is ERC721, VRFConsumerBase {

    uint256 public tokenCounter;
    bytes32 public keyhash;
    uint256 public fee;
    enum Breed{PUG, SHIBA_INU, ST_BERNARD};
    mapping(uint256 => Breed) tokenIdToBreed;

    constructor(address _vrfCoordinator, address _linkToken, bytes32 _keyHash, uint256 fee) public {
        VRFConsumerBase(_vrfCoordinator, _linkToken);
        ERC721("Dogie", "DOG") {
            tokenCounter = 0;
            keyhash = _keyhash;
            fee = _fee;
        }
    }

    function createCollectible(string memory tokenURI) public return(bytes32) {
        bytes32 requestId = requestRandomness(keyhash, fee) 
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomNumber) internal override {
        Breed breed = Breed(randomNumber % 3);
        uint256 newTokenId = tokenCounter;
        tokenIdtoBreed[] = breed;
    }


}