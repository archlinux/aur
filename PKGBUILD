# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.11.2
pkgrel=1
arch=('x86_64')
url="https://www.collaboraonline.com/code/"
license=('MPL-2.0')
makedepends=(curl fontconfig libcap)
# ↑ excluding base (bzip2 coreutils gawk grep gzip sed systemd tar util-linux xz)

optdepends=(
  'hunspell: Use with language-specific hunspell dictionaries for LibreOffice spell-check'
  'hyphen: Use with language-specific hyphen rules for LibreOffice hyphenation'
)

depends=()

source=(
  'https://www.collaboraonline.com/repos/CollaboraOnline/CODE/Packages'
  install
  mkcert_example.sh
  sysusers
  tmpfiles
)
b2sums=('39035e5bc45a6d6d0799942ba9367fdcb7a4820566030f2516be5777ea6653d3e444eaca8e6c07a43a746bcfc5ef7099a7472341243796056b0ff6f7799ec43e'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'b8f38c8f0063032fc037bbd93cc23a0de235b066f109a4ba2fbe5ee8d58553c0f1e240be12baba03b929924d1acb51f12ad219dbaaa7a73a4491ceefae1229d7'
        '8ea2d5e9a3d9e18a5536bb4ea9a8c466ea686407c249cf03898a023c889b20f21264c9f63cbe7f509fc25365683bdc99afe7f434470de820c7159b5f6edfdf6c'
        '9da90749157673618f7887c33b6c7c943e00b0f93416ed93d1360e61042921c30887abb56ef3a0a3df556948668803a186ac728ee5e15be9c03539e17a3fd744'
        'be98a96ad6ef48a66c56bbe34a07aa1955380d828940f3cd420e6b95d8977e7c4d6b568bf19db265842d6a75c078fbfb10c1641bfbfe3061bc87f73efaea6505'
        '70f5261d2bc5352284662a0d02b1e130a53696037afe30cfc88301dafa7ed87e1a1645fa95895d634dba4e437d8898bfa536f4980939124818e23dda87fca487'
        'c7e063be9dc2cdfe0f06c3d4b59853fbec6b7f645d81da71de552aa73991ccaea9c91082d515a9d66b78e50e15caef7755b0de64ba73b372a3c67ab966c01a94'
        '0b8ae31c5c65438d393a16319b46b09daecb7683177d7b20e21eabc0afe548e4f6764ce386a65b3abd2eff5e438d5807781f45fcce9013050b6a7c102968744b'
        '9b2113f8076bf7f09fb398f7b60fd318c11048cc76e4f05176da84ef7a5b643a47a12cddbb41137db5da5ff7eca1415150a5068d468a5d8c6ad225c94323ec41'
        '69d5160ac3c8bf179a5b6d581537ba9f97edb9ba65c71e9f4ad957614c8f4cb7a65827f346f069d992b2bd132041f0cf85904d67c17bc55b7aa024b0687098c9'
        '43fcd593a0a1c15a4e19d19bac2baa9ff6680910d9870ac551a93188edd762ec6184b226bce5a1df4472b464f67c1862a9f69bb41c781162d2f9f46dc176be8b'
        'db92001bc031a47dbcd5d64f4b9381d55c74e681d66e563e092de1a94f62cc4d43b4e490c108f41ec728b80f357a4bdd88498bd3642211171f7e07270b4efd62'
        'd10070dad2fc0fe0849c2c2943730e67dfec01611b73b165b56b72b0bacda6f2d76c9924e1d69dddb5178d8a6feeb2f22e117acfc0860f3363cdd8d3d68a1cd5'
        '24289ce202cc4d9bcc3a4ac3ddbab5c3093c67702b6b9cfe123b795db28d047509d7bb490d3db75275c897f9ec1b2039ce3f05c35a8d62c70165709424f33655'
        '268f3848a10c18ab469b3d7f48d47c6720bb30474e44458ab9e725aeaf95915db7073f2207374aa4145983eb946c05203d59025e6578a7a48a8733a37886807c'
        '0b87d7fd4a02ad131a55143f5459c837eb967f0388fcceb06d0b0c8999bf4cd228b6c35660489e58710b56fd138ac2e264454c659b033828d10ec0329f4ac89d'
        '6c4799d9b0f29ca45bd99ca47defc4adff10e6493129bd6bd4457ff77b65f9809e972db1e2d1bd04df5aafa7e3dc81fb8a521e621828edabe48e9c05b100a51a'
        '195263f2e436e06d23392572d395699246437b81a394fab4c4efd5ea75e44f5e38197412ec054fdff4519f492aa74aedcadcd4180ded836dd1547cab86977c98'
        'ebcf7c58aa0567823eb9a5f9e63d47a128c24df75b0a60e93c83146d6d3c1084e82ce24286539a459d71c7130d06a7c63d409fcc6267364afd5f616a16ed742d'
        '4be2f413d6618397fec7135557b1039788fb8b91144a03a9710c6ad96cd44c05d733b6859aa22ab325eaf1e9df9636c616d66562b1198c68e164bb9a96535186'
        '8a12ab19dbf9c66eeb6e9038faa35ddf8a6ae314472459c74462160708ec1c23194a91ffbe5eded402dbe36c5f632e2a5c3d4cfcd81e151bf33f08b45a2444bd'
        'fbe35be8bc6e369928d07a74141aacc70d61d130aaff21d85a8a0f6cf3c32789d9479aef574559b1da4f00719a1c95b01566ce929d9f0f74c44c2d7a90411828'
        'a0d05c0a655e2b6f26b403b55b350b35bdbc4aeda67f26a57dbc77ee98b9b224532c5c9c9056dc61857c8a68f89b5549c15614e12ce353068b649cc53b5cca47'
        '649aa781792cd003d1bd7995a10ee6efa22534e10d4b9d1b9c9058d681dce41283e265d499ded3ed22458576411f0415c4eaea3718ac52bbaa22d16b847b29d0'
        'e8fd475d74255c36c93347c777541a3dfce44d4f5c448277be66f4b32db0af6ea83d64f0116d93825cee110b353edb9d6ec5cec175034002b86c0eb16cde15c2'
        '9fddef48c361c7cdf72dcc41965a341867b503951a3078192506176a08eba3baad1dd72e15e3bdfee84975b0bfac8d5a1e04cb9b85567943adae276725d52c70'
        'ea5ac180fd98c9b8f5ba68bd8efe41301dc2647a9a603706d5174b2a8805489ceb9629384028f6cabb5aa64775c228c323aed825ebd57e340db384299584245d'
        '0e839c57f69dc0cb416a2dc2383d0f18a3d8f0c16113dee9d10f7ea34f688cca0299dc04a9ddc7933fccf22b7c0f15b7652e4084ab6ae910be2afc4860f69bfe'
        '507dd79258ca752b01e95f16a0e9d1b2c1f6e3cee631b6133a48bdfa568fdbe7913d2b0b0b5356ad62651d005ff8aa95033fbe87b55d69cdbda8a7c671782c68'
        'c1c6e1899de767f17f846f721537d99faa84e55395b3c97d5393385022a0b45dfea8bf477785d37bded95e44305bf3437bc7d5548cad4a453f2e597d0bef7d4d'
        'f9fcc417a9bcd8a83aca7f1c811101bb889fe9ddaeef99be32896b95672d91d6f2ba4e2fadd8f51ec76c2f2385c2f6752240471e2af8c316eaf6572133266415'
        '60b1c8cec6b62577d4b65e90bcd04a49f639d31d4879afcd1864adf67e3b346f301fd5743790fb7ad40c1ffea1b6aae3e93265b7c30631db36756304de6c48b3'
        'b41e0071e5b76ee6671320f512e2a0a9222025c44ea3f6905b893ef473973c85b1d0d48bad31d965e7c01ebb7004098113f657d1c8a6870d58a94b1464cf1941'
        '72ff309217dc975cc3b41ba1b5f795c519314c1cab98f2c46c3df30affbfb1b3e8edb08e0617959a8f503b6d17f8aa1322b5585a4a55abcec050935a95f68923'
        'bcfa09febff219ae61cefb8f6e38f54450e02fde123a7b3f348aec7a2ce06e89431db12bd52ad9647c6b4a722e5fec3197a8a361093ec2e6ab50a468d6f85439'
        '40cdb290f84176213f24e3ff287201ccb4e48c49797cc2bc2e41b162973b92b63815ae386f74ac18892c1240ce2ee69a5a3f1f07324d41eefbfdd645079e788c'
        '67fd9e9efa199bb0190ce045232a3ad04b5c7c54fd27e8db972d9c187a720586f79fe6ea4857049a0c47c6f6f1c7305d87c72256059e8e5e2b83aab539816d75'
        '1581f6981d31bc3313f26beb7d23699373f5be84c850f619b54e1286b1b7e588a583b77ecc1e5b596b54afc740c08d8ebc5787b1a8c0d7791fc8808914bd858a'
        '8e22ee5c6609701038de7f8de241d8713fed40d13e9765fd2f48789896e72c07b5bbf84af7d041272ecbc3c3c09df628cfe67ac1cf9a1ad4c45961e43a7ff5be'
        '5f6816c3ac6458153ace8406497fb4b2f33ae423b8426dccaed583cd56684c07dc6c65ed12b68fa0e3e4517c62e1b8135d166208eb0634119685c81f49d19776'
        '89ca3e74b7db7b4fb022fc69a0ed1c7109c843713939dee6a11075bc6d86e0e309ed146918f2111533e06bb20a7c50b6febcde7f0223cbd297f210cc7898b401'
        'b663e269598cb06ac95ea6f1b56a9cb5c1e1fecbc610540b56b38d8bac620700d584510f1931495044017d35a96e4db759732fb1c712ea86f0c6c4db7ced6be3'
        'ac66dd01eb857a4e0944dc6b49ba9b9625d44abbccc92d02082239f0591f8299d3755c9a6503b42f84757646e7d785374909a72de652e27d0f9376e9a813329d'
        'b4fc7809fd0becf15fc0b871c0947b6b7243334699901365528f6c6b500f585ed0684d4a3212c3ab8f37470938e3e8d3bb8e16a997735a05a4fbe193d83536c9'
        '9c286846a56fdf6c255ca0d759ed4828f22dd53b5fa091e03e6c0be2a956bebbd0f15850f17eda25ffa42d0870a77bee93d21b7ee7e938dbd8303b7efb582b1d'
        '4a224e459d96573484284799a51cb4656eb52df95576ee8e31783ed99847787585e21ab0856eef98742e86b975fefc23d1831a6d673cefb9ca7a73a77e322996'
        'aa22494d6a0efdd936ad23edac2838da05941ff42cba3cd10ecd3b517a649ad3ae40ff43b47466a0e6714a1db39c8887b1c1f51cd815f58ce6863a6d90247b56'
        'f78364c198882d93660559c3fe584b7d5fd22fecb1514c4e43f91beebdf72b58c09d8f28fde7c5678476da8fcbb98a57718fe46e62406418070a381d748473ac'
        'da265aabd22f5d701ded8899c928130e73e76f2fa6f899e40434968122aacbdb5e0e58eb9cc336bd2cc1c3474bf215c2ba5ef607e728c57137b9afee89c1b5de'
        '5d76346543208dfafd87da454234b11b010402ebce8a44aed4042fdd87854a88edeae1d44bc18aa17701db81c4cf2d50e98f72808d2887dd82066674d76b15ee'
        '67b917e0f3bd3d59107c3df61e910e240347ecd834b6271d739285dcc0fac6ccfe74db8599a34656627e8a41a633a2f432883d03f5fb072814e00b864ee439e1'
        'ef00c60e6f99a90ae86a17d99a4bffa06145045ce919015d281b2724bd353c93674c68f984ebf6601d85d5d9a3bb93d0420cdf541c74b244b2a0296fa350128b'
        '7ff10247a79bf7c118cd21b5dc1d016bf46f141577b8c2b791b85f65dcf6a498f3df1da26d99b1d1aa857f70a76e236cfd627e280e6cefe480ac43b9417d68bd'
        '53058ab57a4ccc78efb61ffeb6ada4e488efde088ac60346662b1f33c3ec15524059d970703a0c5147653ab124c7ef89ef3e1c12f51d73aeb8b3020b4cbe300c'
        'c333f59174876f4ea003305348f835731d172afbe139dceeb00ad8e89291614a1aa5efae0d4eeca2bfe8cb99b2045ca238027bc4e567e8432b895bf3fdfb995b'
        '2cd8f0094d4b658c0d4a595e0b33d2723e0e64bcd225e6d459f2ef26e0734d20549f9b2f2b9102027824ddb870f652a273424a674182201a221843d1e08b906d'
        '66a8394d2c21a5e02e63665c78c0940d298a743d14acaec90f80cc30c3983d602a1ad0d5886f3ce1a116f97c723b5bf38dd84495bd5c8eea39372efa735e029c'
        '1a079d0bfa90c4baf71af4c6f68189a18413e891a62cb3a2ee52f405033b496f1bdffe1fb68c342869ad4909ed5d12266086958f6d6b7793ee35f2cdc6ccc5cd'
        '3f6e48b2651d6fbf6e3e40f4f5f6d4a10fc0b3d0bfa13cb839140dd905c5bc5e84ab6999c4c87d1cb49b7020ef7855a16f21a923bfa7fc55e492e817eca0ace2'
        'bbf8e0fe8f678672a99f99eb0fe1d65e9cac5b794f867b3cf948d9b9bdb5266a6f4ca09941fb2a9368d999c75b39ade3a6b8ea3d6a5941720e9371765a13f19a'
        '9a115eb6e7776b3693467b58dda2b34ac4a958978d0c17ecd2b7427ca820883ae54bb60b0875589c790b93f400083c68e21d84c747a40e6dcfc5a870b5216c52'
        'cb336ef1943f069b5f20401bece677076b9c1dda2112799f359b53b6e8aae9793e710db3c7e5a06787cb3bef6af9c2f4ea4a82efcc20cee8f13774c060c7c2c4'
        '791934331479a3b3c8aa377e461ccab5c654261b93a4345435365115a7780db2602e6374cfb54674a698cd79950c983f61b26c234bc15b7f31b441d1ae96ceee'
        'e367ed6e42735d7c4fc5f248f9d391ba7233b27a28e047563b8b564250bd77465b80dbfafe9e0ced365650c549bd8b57be258d694a3acbc767ae375fe98739b7'
        '69a10b586081933b343cf5ebc429dc9444492f5f38d5c051fb885196cb30382ccc7fca99dcd48ecefab1bc99ccf1d51a5e075667b0b3d002478c47b14a67da97'
        '64d9b5428828844b075ef27c5487f08e929a82d65ee1aa056bc7d4df011c7d3c0ee6894ec7605a60bdf2fb1b9f3586b5d165da8da88df000f481cb06cce12c09'
        '51ccb0ea3a4f00415e972c018bcc69efa6287f62d3223ab5fdcede52685c3befa6235da8d7d07058c65838a6ccf25e3c67c0b5c9ae47d98a484b5cb35866ba5f'
        '3a0782f3aeeabd4f6985b2a9766e6525e51bb16f83c0459385d9567b770d25bfee979988bbdffaa4f472e4c1b0f4fcdee086b219c3a66855a993c0cff46d7bc4'
        '867e68615a52b4ef802ff060c11439e351fcc103bb3118d5e253023c52ff979e1b334b582c6d90480ad6a4a84595ad93c776aef20573a34a38311980e507cdca'
        'b9e06b01f5740ca9a092e1bfa7571a65f07218f127ed188907e38241fbdd66772243991b1b45f058c83a99e7102a3e3a0fae3f6c2962da3fccaf249d7057408f'
        'efc5a3fb2bb8e3dc4ba4daa97280147891b927fa289e72c596fdc305fa3a3a644a84e88c42fb7275dabbd93807e9ecf0c9bfd09138481ba14ac78b6830267133'
        '7b118b13b4bf07db8be881e237b585816638d8b7f4be77b008bedd4c43fd7dfdd3fec33a2edb3c65d8366cdbbe06461def6c701af62066de367d816a46eca028'
        'c221f6ab0b909caeca12b4e64810e1d08fe076da65a29ea32c279f86a25a13c4d8cdd23444ded97934686a33016b56a2c7b741d70c064e257437919f52a52c63'
        '97b3d66b79058432d38411f26e52e6961f2fcc095c2bed1a18798d105c2a98b94fc4687e5ae413a8fe5802f0e51f9be6b1b99f1f722962d63a90612549b22e03'
        'bea359c10b42914551fe299eabcdd0140d9c5d3bbc6247ec04bbceb831dbe403e7150c11f7ce96e5a37cc3989f493562e0d5d15deb38705bb9b06c44e0f52a92'
        'eaa955d77f810d4e6ea2293186525cd63cabc313406b9352712ecc36d83d99019d2a6017c44816c9911bf26f79168e16fc8fc07309a5c82d1d823e72085e245e'
        '656b5e197785b85b1ba579d5969b86a0ca570daa2be1137065986617879f16403514d2c1d906fd32a94f2776c5f4ddd6a6a2e1e33ec45f3bb3a2bed242c06719'
        '762ab3c38b3285755323c5613fe622b8c5994ab47ce5812048a9d27676e182dccd459fd8a2d6d4c914e1946a148d4201c410398ec06730c09042a6ea61c81510'
        '18bf0e505cae30a42c6080d575902efd6d92990276b08dc9395bec2cef31eb45efbc7f302193e9e2f548e1ce6956fff8d2c1a8a1e6b0d2752fcf2e4403cdbae0'
        'c6a21b7d7e5117bdf02d7898c9df021071104e33fa06048dd10b7f7f7696a1523598af8445dc346aa9393936b67ca9c516091d072076a0ac18d0c75b68a9bd6e'
        'c485f8ddb9aac413c9ae2ae2e8dd19c658afac88c627997c741bdf3d383556a95fff7405b411ed883e41dc020029da32c9b27cd3a34d083d6820c4578412f857'
        'd2b6319bb514385c2b5a5649f1e27cd3dd8dafb3e71f91b106659075d5f0b9f161622f76e6526f628d01de4a9bb0238d97b2651e7f450150b69123e8eb5a7647'
        'd9846ef42a93bd08ef77e7e7dd57622e0eddfa479b052c080fcfdcf75f5e33a8dcbbd4e2b159b4ef05224bc9d2412a7902d122961d0a153f4530bbcc3d369520'
        '3dd51681146370a12993bd7ffec903af5e06d32b9ddfeaaa5009e73b73cb97b9178bc88f1a0e390f6e11ad0152ba04c2e346b8115e8b4ba2ccf4c8162ab5b710'
        'bfbe6696581984e1f37ddda5a98f6c84f5f0de6897897c9a57bf39ec45bd88d52aff7ae890778f234cd8b5f391b29a3b4d772f58f47d311a5ae4e5b3406676fc'
        '03ce42d608f3bac2d3fe4a2964545d419f7bf18f5fd1a50dfef15a3f482dcfa4f78b0e271bc15a6a42de652f6f9e30cd78b5716936608b087aeb93b865eb0556'
        'd700c8c6094ae4401846ff7ffe51b976c2a6352569061da8b3555875960fbe848e3c07c53e3529bf7426a246062d93f73354414fe6dca357d2b30bbf077196a5'
        'eac7bbcba065784d034f57267a14b571969398ac6daeaa6d82ca6edde3601d489d5aaaec9f279ef577f8caa39277b1c1ed3d4cd87e09a54711bfc93c1cb1494a'
        'e54f652a7382b250022594526cb2af425032a6e82c570dfb8d378c7559fa644717861be6ec65fe9d40c4c50337ca326c33cf2fa94b9b50b58b8b421f1dca47dd'
        '3aab893d88a653b3f8b18b442fff84111052dc6bf1939de95e261c803bb3644c5d9a3c1a0bef2f17e5c3c3325aadf68141373390649edef069ee738bd22f8e31')

# From deb’s conffiles
backup=(
  # new:
  etc/apache2/conf-available/coolwsd.conf
  etc/coolwsd/coolkitconfig.xcu
  etc/coolwsd/coolwsd.xml
  etc/nginx/snippets/coolwsd.conf
  # old:
  etc/apache2/conf-available/loolwsd.conf
  etc/loolwsd/loolkitconfig.xcu
  etc/loolwsd/loolwsd.xml
  etc/nginx/snippets/loolwsd.conf

  etc/sysconfig/loolwsd
)

# From deb’s pre/post scripts
install=install

# From Dockerfile (https://github.com/CollaboraOnline/online/tree/master/docker), minus i18n files
_upstream_deps=(coolwsd code-brand)

# DEBIAN–ARCHLINUX EQUIVALENCES
#
# In case of a new upstream release:
#
# 1. Move all lines from $_upstream_equiv to $_upstream_equiv_OLD.
#
# 2. Run `makepkg -s` iteratively:
#  * Each time a dependency is missing, move it back from $_upstream_equiv_OLD to $_upstream_equiv.
#  * If a dependency is new, add a new line in $_upstream_equiv with nothing after the “=” sign.
#
# 3. When the package is done, in a terminal run: ./missing-deps.sh
#
# 4. For each “not found” line:
#  * If the missing file should be provided by a new dependency in $_upstream_equiv,
#    then put after the “=” sign the name of an Archlinux package that provides this file;
#    you may need to create the package if it does not exist (usually old versions).
#  * Else the missing file is probably expected to be present on any Debian/Ubuntu system;
#    thus add the missing dependency in the $depends array.
#
# 5. Review files under ./src/_control/* and see if install/upgrade actions have changed.
_upstream_equiv='
  adduser             = 
  cpio                = cpio
  expat               = expat
  fontconfig          = fontconfig
  init-system-helpers = 
  libc6               = gcc-libs
  libcap2             = libcap
  libcap2-bin         = libcap
  libgcc-s1           = gcc-libs
  libgcc1             = gcc-libs
  libpam0g            = pam
  libpng12-0          = libpng12
  libstdc++6          = gcc-libs
  openssh-client      = openssh
  systemd             = systemd
  zlib1g              = zlib
'
_upstream_equiv_OLD='
  locales-all         = glibc
'

_main_debs=
_i18n_debs=
declare -A __main_debs __i18n_debs

# >>>> START OF DYNAMIC ADAPTATION OF PKGBUILD
_upstream_handle_dep() {
  local dep="$2"
  local eqv="$(grep "^[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")[[:blank:]]*=" <<<"$_upstream_equiv")"
  local meta="$(awk -F$'\n' -vRS= "/^Package:[[:blank:]]*$(sed 's/[.]/\\\0/g' <<<"$dep")\\n/ && /_(all|amd64)\\.deb\\n/{print}" Packages)"
  local seen depurl
  if [ -n "$eqv" ]; then
    dep="$(sed 's/.*=[[:blank:]]*//' <<<"$eqv")"
    [ -n "$dep" ] || return
    for seen in "${depends[@]}"; do
      [ "$seen" == "$dep" ] && return
    done
    depends+=("$dep")
  elif [ -n "$meta" ]; then
    depurl="$(sed -rn "s#^Filename:[[:blank:]]*(.*/)?#${source[0]%Packages}#p" <<<"$meta")"
    for seen in "${source[@]}"; do
      [ "$seen" == "$depurl" ] && return
    done
    # when a new .DEB is needed, put it in the right array of dependencies
    [ $1 == main ] && __main_debs[$dep]="$depurl" || __i18n_debs[$dep]="$depurl"
    source+=("$depurl")
    while read dep; do if [ -n "$dep" ]; then
      _upstream_handle_dep "$1" "$dep"
    fi; done < <(
        sed -rn "s#^Depends:[[:blank:]]*##p" <<<"$meta" \
      | sed 's#([^)]*)##g; s#[[:blank:]]*,[[:blank:]]*#\n#g'
    )
  else
    echo "Unknown dependency: $dep" >&2; exit 1
  fi
}

if [ ${#source[*]} -eq 5 ]; then
  curl -L -s "${source[0]}" >Packages
  pkgver=$(
    awk -F$'\n' -vRS= '/^Package:[[:blank:]]*coolwsd\n/ && /_(all|amd64)\.deb\n/{print}' Packages \
    | sed -n 's/^Version:[[:blank:]]*\(.*\)-.*/\1/p'
  )

  # first register each .DEB as an unconfirmed main (i.e. not i18n) dependency
  for d in "${_upstream_deps[@]}"; do __main_debs[$d]=_pending_; done
  if [ -z "$_I18N_EREGEX" ]; then
    # go with that if no i18n has been requested
    pkgname=$_pkgname
    eval 'package() { _main_package; }'
  else
    # else register the function for building the main package, and dynamically discover i18n packages
    pkgname=($_pkgname)
    eval "package_$_pkgname() { _main_package; }"
    for p in $( \
      sed -nr 's#^Package:[[:blank:]]*((collaboraoffice-dict|collaboraofficebasis)-[a-z]{2}(-[a-z]+)?)$#\1#p' Packages \
      | grep -ve '-en-us$' \
      | sort -u \
      | grep -E "(dict|basis)-($_I18N_EREGEX)\$")
    do
      # for each .DEB file found that matches the requested i18n regex, register that .DEB as a i18n one
      __i18n_debs[$p]=_pending_
    done
    while read l; do
      # and register the function for building each of the i18n packages
      pkgname+=(${_pkgname}_${l})
      eval "package_${_pkgname}_${l}() { _i18n_package $l; }"
    done < <( \
      sed -nr 's#^Package:[[:blank:]]*(collaboraoffice-dict-|collaboraofficebasis-)([a-z]{2}(-[a-z]+)?)$#\2#p' Packages \
      | grep -vxF en-us \
      | sort -u \
      | grep -Exe "$_I18N_EREGEX")
  fi

  for dep in "${!__main_debs[@]}"; do
    # recursive dependencies for the main package
    _upstream_handle_dep main "$dep"
  done
  for dep in "${!__i18n_debs[@]}"; do
    # recursive dependencies for the i18n packages
    _upstream_handle_dep i18n "$dep"
  done
  _main_debs="$(IFS='|'; echo "${__main_debs[*]}")"
  _i18n_debs="$(IFS='|'; echo "${__i18n_debs[*]}")"
fi
# some debug:
echo "MAIN DEBs: $_main_debs" >&2
echo "I18N DEBs: $_i18n_debs" >&2
unset _upstream_handle_dep _upstream_equiv _upstream_deps __main_debs __i18n_debs
# <<<< END OF DYNAMIC ADAPTATION OF PKGBUILD

_unpack_deb_file() {
  local target="$1"
  local deb="$2"
  local archive="$3"
  local data="$(ar t "$deb" | grep "^${archive}\.")"
  if [ -n "$data" ]; then
    [ -d "$target" ] || mkdir -p "$target"
    case "$data" in
    *.bz2) ar p "$deb" "$data" | tar -C "$target" -xjf - ;;
    *.gz) ar p "$deb" "$data" | tar -C "$target" -xzf - ;;
    *.xz) ar p "$deb" "$data" | tar -C "$target" -xJf - ;;
    *) echo "Unknown file format: $data" >&2; exit 1 ;;
    esac
  fi
}

_i18n_package() {
  depends=()
  backup=()
  install=
  pkgdesc="Language ${1} internationalization files for Collabora CODE (LibreOffice Online)"

  local data f
  cd "$pkgdir"

  while read f; do
    [[ "$f" =~ (dict|basis)-$1 ]] || continue
    f="$srcdir/$(basename "$f")"
    _unpack_deb_file "$pkgdir" "$f" data
  done < <(tr '|' '\n' <<<"$_i18n_debs")
  chown -R $(id -nu):$(id -ng) .
}

_main_package() {
  pkgdesc="Collabora CODE (LibreOffice Online) server for Nextcloud or ownCloud, without Docker"

  local data f
  cd "$pkgdir"

  while read f; do
    f="$srcdir/$(basename "$f")"
    _unpack_deb_file "$pkgdir" "$f" data
    _unpack_deb_file "$srcdir/_control/$(basename "$f")" "$f" control
  done < <(tr '|' '\n' <<<"$_main_debs")
  find "$srcdir/_control" -type f \( -name control -o -name copyright -o -name md5sums \) -exec rm -f {} +
  find "$srcdir/_control" -depth -empty -exec rm -rf {} \;
  chown -R $(id -nu):$(id -ng) .

  # /lib is deprecated
  mv {lib,usr/lib}

  # use systemd for user allocation
  install -Dm0644 "$srcdir"/sysusers usr/lib/sysusers.d/$_pkgname.conf

  # replace cron with systemd
  rm -rf etc/cron.d
  install -Dm0644 "$srcdir"/tmpfiles usr/lib/tmpfiles.d/$_pkgname.conf

  # add dependency on systemd
  sed -i '/^\[Unit\]/ a \
After=systemd-tmpfiles-setup.service' usr/lib/systemd/system/coolwsd.service

  # keep the cert-making script from the Dockerfile for reference
  install -Dm0755 "$srcdir"/mkcert_example.sh usr/share/doc/coolwsd/example.mkcert.sh

  # do not provide libreoffice for the desktop (seems broken…)
  rm -rf opt/collaboraoffice/share/xdg

  # fix lib + desktop files’ permissions
  chmod a+x opt/collaboraoffice/program/lib*.so

  # https://github.com/CollaboraOnline/Docker-CODE/issues/32
  [ -d etc/sysconfig ] || mkdir etc/sysconfig
  echo 'SLEEPFORDEBUGGER=0' >>etc/sysconfig/coolwsd
}
