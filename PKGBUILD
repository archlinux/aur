# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.5.2
pkgrel=2
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
b2sums=('6f2e21211bb6ecf84f47641098758d4888f37decbd37b2bdaf5568633c2f41a7d976290685885f535565aab14bc64253506ac5525ad6b40ae4f3acdcc13f5c34'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '6bf2980064102c028d2126679e4cfa57f14e22196b7d43a17c925139d87b62126d316a1bcac7c73dfe83c4737c52e560a5704c992ce16ba2b9f1851545ae0ce9'
        '52fef4f47ecc65d653a20930cbd004aa4b20e47e579668e10e2943d391974d55005bda850b748e09875fd68b0aca21fc383f6f5b7f37a83a29ca068bb5323031'
        '32d177dedb4e020043e09295ae450ad7235e5a59985dedbe3b59abf250e9d0dbc6a4883b72e7b9cad64680750ca52ccc4c87e6adf0f8583d47f23c32afd838e7'
        '0101e035385603441a456b4b503ecf94cadda8d0b39910a4ceebcc7b565b4c82cd13a7e7044cf8593d39eb92a682bff24cf431747461bcf03db8d720fbc6ca7d'
        '79f484126ef0568d3f23391e76e0b9e09a9350b90246c693e50f2dbc9055e18c0984c92914087240f78da5e4f0d8738f6d7c2cafc22cfe6ffff68b101e55f87b'
        'b6345c31c3361f7fa53dde11e41afe4568b1957097013084d308ae3b1af88bab86b3c0ea5e068c37a03f8795c575ea5ec86d9be56f996a02a13fb1abbff9725d'
        'e429ae8df802cc821806716baae21ba517b3341204e8e1a1c28088fdaa70440143477700cc0343e041cb61705869a0afa7e222ef67be1ef93112ca78cedab11d'
        '8a4c8ea8ed522302c6bffa3832833b71438d08914f630d708ddf5facfe4a4ec5398cfcb8aba8e17705b4563cbb7b5c4d0bcf5ff1cb057baaa881ce2e14201b80'
        '07a1506d826a1e807cfa777070d0f2dfb89aa14fb3a5790445f18a7e38dd7970c8c421f55f8744f991b7b1f3373c2f356395781790b8279921ef6975a8703f53'
        '7213f120af80f487273186d7a802d1205228d902717a171271c2a5d52a5d44aa024efa215fe19272e622eb079e27dfdecf4081825f480658e50ae14399863782'
        '1caff56af933603ba7c28a400b713ddbe98ddef99a442913863bf2a860a4cf78b50c7b9a3320d3e3bfd11b5a08fa55eed53a12f5f16980d94a29029ca1e00cf8'
        'c11b32613cbaea3758356226a2fbe5767890dd01639e4fe946adfb0fe9c3d273e2b4078456a0b959577000b99a7b2119434572da94cd50a75279c8de37f76374'
        '30e53b5ed646635ddaa6107ccc30d38f49e047d992aa21f5a5e1b62e6d9b49c49433aeac2be204f7222aa6c6587f0f42217987ff412cf785aec8f6c59902fe9f'
        '7fc0440be3e00a76bfb3ef2a31706647905f2e6418c5c1be53da917c4ede63110aaa63ecf415990ceed4c3ee3a948ff2b8c72bfa4620651387d461cc4a4c2bfa'
        '242939385296db15632929a47c7f44e50eacd724fd887d7ea05d5cdb20038e8096fb57d43ad9a2727a8b434b2b0a371418fc910c297997d67d1340112d2852f2'
        'c90fa931281daa084f64505500a0ad270ab0d019a1eac8fd1c3c75ac79fbd819d7f4ae062cc3812b743b04e93f0ab31bfd53f85cee34c14b30fb68b1ab636589'
        '4556f692a863381cd12322e03fc5a65cded88618a49ae655ea889fde3cca5e84054a5f29a041ece9bd6de4e3cef76dd2df753137572a5b5c352b069cfa9d44b7'
        'd6a8d98efc6fd07d28568278eaabcbaccb024bb4a2d500ffbe540156e54e9a9beb0b2c00e2cc088580db167655ac733406cd488904fc115c71d7c0ba50229976'
        '295b75acd3431194f5a550a9c58e5dfef76021c5dd4a138546dcc35d365d9a462d3ef0ecc6c24c8b19d17a3e82abb9192a1e84bba601ffc9a83b7c2ca30976ff'
        '8f369aaa723143006f301d616d3cb7c8c2aaa297d93d5c2942297213c9ad1f243f81a0a4ff77d895b3719172fa907337d7b564b0f85d13c813d373b524e44aad'
        '39a758b3a836c6a8ca10bbae84283e5ef79c4773e4f7a0b3f6bec42293bb629450c619ff33217eb870b4697225abec7a54eb74d36319d08d384e9e9930e6b909'
        'ca48a951a23fff7c21f89828556822254963d06b5441d498c43f37ad657bdb84103404b0c0d69abd6268e3585d771447ede438db2fd22512635c85cc3cb2c775'
        '655f04408549959407bcdc26a35d366425c2822fac52b2087fe20fed04f360192623024f7bc4869f0605dcee0be4ceea560a65126407ef02a9beea2fd53e57dc'
        'f489d97a0c29af0e94ef5ea3bdf6402d4575f628aa81be36d3f5fc1fa2942762b78b8877e766d833e21ba98cea8e9b512702d73abd8d2208a324bd595e2bafd2'
        'ffffc381b660f823ecfd93e2cdb6315fc393a12177b044f05c2dc9729f2dc7cf7623530e72796c8adeebb721c435a1174b7975adb75d6e53220ecd5bc43a867c'
        '6c0f828a53f8f5b7eadb2a41078ce16af53f2560356733e1ab29f0ba0b22cf1f91b9b1a2d00cacab92093457713b79ef641c2088b311726995768a11d237da64'
        '2909f034d9e64e635694feaf4a4b602387de00c4585d47ca8e4b64e9ca73ca8211c07f5990f84eb20b8cb101171b6ada244eed47234d16a43b78f7d1678ee185'
        '7f43c4a0212c65d77946898ebcd7a0e904d9067f84623e5df111090ea27c59dd4188ba1fc361bb4959357c59e3d882096b8bf1c05be166cc4b4a861ad10c7bae'
        'b03315ddaf3e3203e791786d7866f9908a20d7e0f46df6c133f36a30e71c2544c8e72c9d97a6faebc0529446b2ea4b8079b0c3594b03d18cae7f266d83fc8ac4'
        '5c20d367e80f2cc00d8f97fc7cbbc1dbf29b33e2767e4b90084601d60488be9294417721f3c6b186d1234e44d059d1045718b64af341f97b45f700b08e71bde0'
        '019ea9b9009c7c99199074af302d0755b96ea746d212fa275466cff6a9901593d0ac132ed6ec625387f58e31571c393c9dc71aa6e77aa80b78fd7a89e6b695df'
        '9ba471ab3a51e51a5d0834631cda01df0d5acf179c18a42dfe2c8fce3636fcacb817aeec4992b260fb972b51b633c8a39e2ac67d8c657edb165a5ad1c7c4a5e5'
        '713f7165c84039a06fa43b8c09a862e5f89464381be68e9781de17c3ad7f757fb8cd6bcda679f0b5686a61c66b9d1a34cd5116c240e4c0da257fc2944c709714'
        '719f4f1f9a86c63c6528d8c35159821b43eaa1d10044463d80939fed2834fdc5caad7884459a32712588a357ad917c1f56ad56ac3bd51d830fe48c1a980cdb41'
        'ce9996340561bfcdcb86f1dd47c5098e96464598c653091551ef5401a0d46aca6ada9e2c55cb35897356038b68928fe0bff47dd9e01f69a8f12f8e7b6ad89f7a'
        '0768c5c9d114d2988b126c82b490b53a9dea3d2c4cca18f2c3fb0b7c2b3f1e15d66753fb5451fd8603102b80cdbccf2db1faafbd73d5377cd74bdfc6fa6f1b81'
        'a70dfb1b6fa82b2f3843059817f930ae8c9a1262313d5731f99bdd7a2c749d9ff91ba56921ef489ba4202ac28ab73d626a7237ec4b912997c93e7fdc956adb0f'
        'c625372893fcb15a2328cc28232209a2ea05dc411a8c00c2923c415219fb7e0dbe4603d3237b21b2fa1770d35c81c84bbd4b97bda467175a43ebb6b107a63ebb'
        '46769980043bf63d0deebc62de17c2fbf62c4b6adb3c817c3f8baa771d7a1bffaa727d11a6a55f780f024087f782c8dc02ba16b5a387346fee52f48496702caf'
        '5546abe660db912c7c6f25f9f2fb5bcee5216b8980c44b619bd31aa917d84cdc4013c287c5d84659bbcbf4bb2b03a41c50d9c1539fc9d46b6edcffba13f5ce43'
        'c6f016ab70934ae97f864380e5b6339febfb6e432a0dbe9ad25b1aef500afa240fba91087b31a47c47eda1f9a1e139db94d25e5e3214b50d3a270e5da3a7cdbb'
        'ae0623b32ff53437a0c6049a46e243f0a722fc7820e78fd9b98b4e9a2c4499661aa2bb92cb2c6014db33e7cdb2d057f97ca2beb3d612be99ad2b26798bab42ef'
        'e4c3b61b62c714bd9f3908e31df4e7cb7233ea11c203a7c9045376974ead490f99d7dc3be2138c82bd4c8e44d833019fc6d5d253e2c166c30adf2af171ca7f88'
        'b67203e9ce6cc0dc3e4ebb4ff63bfe7b14805dc1f36990cb36885f1721a567ff31faa715a4957b7f6c7e246578d6abea892fa5dca8e086d1d338cfe588d06895'
        'c1400b18d20aca7b43fbfa24393ee9a8e5bc3626c48767ea152cd02fdfabec705da0fc6cc5b9d30e9d5196cd0f35210e3357644273582f1ade717d4225ffb73e'
        'e3b88ecb433c40f6be2093591639e5dd043736a282c91fdb38bf8a4d1b8a19c296429aaf1a3ff891b259b3e6997635e83e05e0cc44896e5e52642a20b9df3838'
        'e87d03b664b927ec074d8eda34e8cb0de2726dd4aebee1acb67fd83507650481d20b97f6a2db2ad0a14c6cd367012611dc6a892b7acefb04bee7f16dba052db5'
        'ee62e94955267683baec34540a8ceb50fc3f3461e6ff17279c1eed32e9f989074cce0386523ae9a2f2260bd9012e85ed287b2a02f702404abff97d4b4b206de8'
        'df03dccefb214d628f904f045f4dae921b10da878f0dbdefa7c3c39a9f846bab1b47130a25fd1036d076350074257400b3677d435436d814491d6deb68ce00a6'
        'e70e6744b4c518b3919339783ab16c1fdd778bc5affe5b13e523d1808e99f78e0905195ddfbdcdea00ab06d0600ffc90f123ea4844f9129532cf8385df47f7a7'
        '643018731311bd15bb77606313c3ce60c99867c46b6bcbc2ffd24d3a81c6c17610ccae94c6164870fdfd78249e1dc0e8382d2fa53241912ba008037d61a2e22a'
        'f0a45b7dd379c76d50431ec774cc60fdde6e88ef3c05b51f55de9881b995828671b8bbfde74c0df005fbabb88fdddf63984b976d9714ac5ad6641e19412d447f'
        '912fdb5ca2118f0d3a6ee2e73113cdbd646319b4187063f1aeb36b7e772b45bbcc8816007ad78b3a093cef730cc5eb4e22717955d79d520bd452e5b437412b87'
        '9ec1ae377eb1acec14328e075d83d8ca1d069438812dca6203876059c79c55e1a638b87ecec54a16fb3082e528459832a40b6f1444816a2a58a961082cf14ec7'
        'f5fc3ced5c4a4d0f2ef78ee90bdc36a30c5f2cc8b6a039fb872d3a5be13cc69cb971cfd33507186bdf619dbc860f35744599b313ddb716ebf8429269043d1f86'
        'b669b3f7e98e301a7cc2478d8fb144859ca9aafc9c20509799ce1ed5b8d22452561933ad09a10c9d6ef383f6270a7575ec7dc3a9221e1d3ad014c268773efa01'
        '586fc8ec819030f26f0099abfdc760e9310b8a4f4901bf27ec146b3f1b384fcf11337cb601b67ad1e5fa3823ffdf6c773e8800348beabfc73c941e6549f04e8b'
        '9219d2d1bdcb3e6f5f4f8e05394b370349b951261afc707f336d1848d26d2b2e23e69f8cbe0f06619443b622d38a011a8c1b75702641aebaf47f7c43750eeea9'
        '69af84d9757c937ed0aeb60e130af7375ff67031c9fa4c9042469d0fba31724d5ecfd5da90725e00044fcdd0da9c008844469a85bcbbcbb4179e0a2e56319cf5'
        '8ebce51e96c78a416c5f8b4d60f9f0b818bb014ea6beed4ba4f071c0bc2b4240dda6668c03fe83b9795c51130cd0f100aeaad6e3e4d70865914a928d9b5f492e'
        'b6e64666b937aeafa954b19dff63f2d4af9fd812686722cb5f7374c89dd2e773e11183fd233f234c8dd8734976bb966c4ab4443e6d892fb59c03b5b17470b00c'
        '43992c78aaa42a18286efe63905440ea11c8e696d654eda2734271e115b7f85761c2186a19b874ec4d8cb1fd74cb5194c755903c9fd3dab033d3b14d7b25408d'
        'b8dbfdfe351bda465b503ca44e99a4a347775e9699417db0cef85c6a3bd46a17c8682c8610b5bba2fdb521280722aeb7775a7865ab61910d6f289a2e87477218'
        '5fc1f22203b57bf5044f27ff315ac24d29abd46858d2033810acfaf3d6ef3c7e871e5ae018cd24fbaf21d8cb96f69ed3e938c311712eca76c0aabd6d1b2769c2'
        'daf146d933757921a4a75b8fb93d39b11133694dc6bcf0b560a261f8c25496f8db35a27d5c9966e9fd363315f86b8c5b8256ded141205c9572869da6c8976b73'
        '07650f893f841c6612d3daf7e7d28b0403345f90d5bab342feedda13020d95bf68b23c0ddf7fd427b8a8ab1022eb434d6cb8396b93538afd18a5362058aa078f'
        'e8db2e06cf167e2ecfb5e3d7fb1257fd2e0fe74a081d28e9add64d54dbfdc4e1d62651a2e4158ea486453643da3bcfe459ef5679c9cf14d23edffd124d917a76'
        'f8a01831d08238e636a84b58edd667099c15f6e492d5666af6d3663570983d5221acdf0f9fa8ca3ffe18af67f6af307edede1903bfa14a8348953d316af66e0a'
        '34eee529f96caf9f5bac0fdda949bbf8d31ce4bca73cd38a730a40b2af0d45da19264b0078780b8e681108df44a6a79da5818b850d4534f0f50e50df3837b784'
        '9adaa137c1c610ff340e7a47fdb1a85d9146cf26a3338792ebb39909329482829f96bd37364519957187c893af4e16155d6b5e49c91b33de5ee36f94e44f013e'
        '470e3ba3be9c7269281fe5370373da65aedfcf7954ed6baf95d1be3487339eb74e39a7ad73185a79ae7304d03e9c832c98bbe74f2333a27f936dd2aa609b8830'
        '82ed1aba4138ad036f0716af2394a5b30bed436df1290373b9322114c705d191a333e946a475cac2699cdffc5dc6311d662a88d4d4cff86970ae41b79d820a84'
        '71a45087429180f9381a9c64f05215056a3069aa1a0c0e88e58298044de9f46598ba469cebbf047dbb8bfb5f0dddf9a78c9876ebe34188d96de4654654001418'
        'bd0c3d5cfc3ef9e3464e1e435c538aef481b8d5aeadf2c478e5b2de72679ff8a68bd14dde5a40e4958eee1f9cc70610c0f3bb39c9b3013ad67813e22c9906db5'
        '04afc2ba188a11b4a9693f064d3acecf5c506cf45a41e5b1da0de9338e26dac1a7a7a10b40bc1486e108529038edb9b38cd2fc9e4ed768df0128e41f1ac26744'
        'd7d4581cfcce3673a1f02c4409daf2e19d36abf9d4b636fd6da1d1223f791c8c138458703251be518b2e01dc7b30a4b8fcbab14a403c07b834b32964eacc014e'
        '39fbdf30b17b1c3ec2c15a1547535f58fa33af352976b8656adb480ae89d243c22d79beea27a3ac27a340995bb63fddf4f568e0eeacf9ead168786bc4b75a74d'
        'ebb8aa0021f0aa8b0e0c55354fbeaad712794a709e28001b829a8aec391ee5dbbc7121ab16d8bc6baa1f60328ef759adcad38a62de77bd40e9d1d637a6955912'
        '4250ae1c1c5836d621b7480756ee534d2a03886331fcc51399f3d477648647a0e86e5b3c90ea05bdb33d610b67204c543526c2f1b15fe0c50188067d151c743f'
        '9b8f19aa2b79d11abda3d66318d0a7f9299ed11dc18846ee8d3d48b3df3c9b295678d0517c1b93b08fc8341ec499fa0d60829c7641c91d6b6ba4aae3b3617b31'
        '19f46f2fd06d8a17aa78e7018012126418f16d499122b78375f0a6c7c75ef3547342f342c5a2de41dd62e1e20f601157abd0e712bffadaa484f7edf82bef9698'
        '1bafce3d849bd72eff36d7a44725313cbd1578fd672adfc6750f49ecd5a7c64686904471a0247979dde6d0085a952a99f15f684fae5fba96642e208367270588'
        '0ebda3f59dec0b40f8479a729fddae10fe1f22a765d0cc583c510b550e3ed4c96cd79becd8cdc129b301aa14cf487f8ec5f0420e4da5bd1ec133ab32a77e42cd'
        'db414999c692c8392fe849e62327da4dd8330225cb850f7899f291cef0912b97302124c36101361ee8d038e27080efd4eafae01e1e0f059b8e411e71355c179a'
        '7222535e9406bff0159448ed8455d7a56254c3aa729b1d9e3946b4736cf1c0699b3fecfb2ceb9c2c8d014464c1d986c460529bc14d66a727df51f1b25805b4f3'
        '76a0b9b20b366e46bbf53a5b75d25fef9165b845ba94e54d6f66090a70decb2ae961613d9b4450b0702b905c2ef27c0e96517113392e1cd3cbeaca6c61250ee9'
        'b3f5dda273e2de2dd5cfb961051773bbe903f934602d096af6816ef023e96bf9d20ce55a15f0f6dfedd524205b4a66dd6651116905a42c5ee68d3093fd6c4987'
        '9e5ce5fe023560483bd08de33ae9a47403304c54cd38bc0f0efb0ae82a6c34eb7db242a55135c37d307b060ea208b436a5e7829a794d6b5c838d611a9e13eafe'
        'a138a6eb4c584f2121af5ead854aada09923741413fb32687d40ec16fdf50fafca2d8fb57cd6ccd1d82027e778dd1cd7616b657e3e5cf4196c9f011bf6371c0a')

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
  curl -s "${source[0]}" >Packages
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
