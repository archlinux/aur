# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.8.4
pkgrel=1
arch=('x86_64')
url="https://www.collaboraoffice.com/code/"
license=('MPL')
makedepends=(curl fontconfig libcap)
# ↑ excluding base (bzip2 coreutils gawk grep gzip sed systemd tar util-linux xz)

optdepends=(
  'hunspell: Use with language-specific hunspell dictionaries for LibreOffice spell-check'
  'hyphen: Use with language-specific hyphen rules for LibreOffice hyphenation'
)

depends=()

source=(
  'https://www.collaboraoffice.com/repos/CollaboraOnline/CODE/Packages'
  install
  mkcert_example.sh
  sysusers
  tmpfiles
)
b2sums=('ffb7d4688d53c001152201111666f7fb6b1f011bc07a4a8145ea1af09f1050d3b6803415ea179e7de977a0320ddd9fbb2274f318aeb3e85ad36c6af84dc7589b'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '7c723a93b335ed80a1e7d7958b289436ad3dd7eefdf4a7da23aca3482b9ebab46283bbea6880b6801bfc2d74ee04fadbe4437c1bc32947f1b971531cc41d74cc'
        '0fbb7c5ab9e4b681bfbf128a32a9f1363c1601931d5741a43418cbf1ad8db54a08ce324fee5474fcebc004ee3c746c9bf4db9b6c3902584bd8ebb0d647dadbb5'
        'a726af384d2d7aee22b1562da1c6b804617eebe724ac9dde1d00d14c7dc5a5355daca80f5746639b8224b009c589bda3bc4ab5d1fd0efd669980f04d9f604c66'
        'c46169fe37df305671da2f3a87f46fd35a72874c8be5414f62a6d7b9d6118b7f09c423c61b7e714c83b6411a30eab87e1a66c8f940bdbc29f975ed1ead06b1d4'
        '03ca341feeced2b1d5d7e2579fcd3c40be9578f7f1f33685cb8864959adf192aee15682f166d35652d0445b3ae619dd59df115fceec3a88e9615e07e1ab6aa94'
        'abf48ffbe32f2d40405dc9e8d63112512d14ff9d211a153cb12f84fced363bf4c15db8fd6e1cfeacf95f390cc3b3d51d2947a5c476676125d3e5c79dd2f3d467'
        '0cfaf049ee1fb9e92590e67fbb982f213bd78a26be0a4fe01d5438e6f0476396d9a3ff039b3b9233c87faf5d2a1720a2bae072aab805ab5259c89a8b8d8d8c28'
        '5fbe2d059a0f15466f110755f34022480cc0e19760908f2f54d6cef008305cb0c6b89c89662a8a061ae518c52f6984183be473162f4d4053a72cbedee4bc00ec'
        'd06ba30001d66e032b05400f36acc180d5e7b2959dcd6d0f21d566b02d2b96897758fe02b9491361d813abdaed138eaa139960bf3e1d8b8f767507b8f79b036f'
        'be8f4cb09cf353f330937aec74fad57a575f1caa9f94706e568de0b2ea8f8903c9dd2a3b79485df7fc1ac5dcd034516703a37bebf1353ea095da9a1c8d425e45'
        'b1af21102a2aa4caddeaf3f5e71aa83ddc74945502f2ec6a8d22363dab349befcd521f666c859a29dc53851b8b53ac7b3b55c68523e2b397be619ca1982b6736'
        'feababcfdc618223202649833fa2302baf0b3f639d72184acd3a40176ee333fadaeda6cabf7a9c81cdcbacab8f9937e7c80aa2422ce351e767d570f40685388b'
        '55bf9a6b617c976d47d2e8ffa4e564ef1884d5256ed6aaf21879fea150e888d6a310bada3a08fac3eb9bd444d3c44bee062c31198fef9840e49dfd98f05a17dc'
        '0d7058f5df23e10273c8723a46f459407d6b197c2f7d5879bfce2ece958c8a1ce0a7e4b8876122a9e9cd53bce8caff4f52261b15d34532b7cac3a72e1bec7cbb'
        '5f7e74959ef2e80868a462c3c6e6b036d5df21563e7d5169f5a9cbb6cc57108e663fd0c50c6f3243c06fbe109cd2a1b64b4292a7dc96989df3b110799ed74bc8'
        '5c503ff663cce05acae1cf5e5d986640dd1184a2d8e2b7e39f0bd4ebdb6766c2603923136c620c68d0d3396686b99c05a9ad36625af59331198521f424890180'
        '016b1dd2a31eb59b939915fc7ba085309d2b031ac0f8b6c555628e42346f387b8bc1186db997c37c16dce05b69cf2d24d1bb349475ead72023e19812b9c67e57'
        '0cdf0e91131f0529929262bc1ae1c3ea3e218f8ba00a94bef3780d5b7debafa749f7e30c40ac399bea6ef12b625da6d59802252a6c22515e09ac05f1e41733b5'
        'f35c4aa2b8b6c4af170450393d71f0b844ffa3fe0853dd369c224e4eec8f767a7dd11bef7a8ffca123a173abc3d7d15fe113072da37499cc3238f66dad670e69'
        'ffc8953c2516150b364671610124010eb61589d14d31da71fbccb916c1f7a3102615f1d0c51b380f2bf5edb80586c370276e9439ff51cb2337edcc28d016eeed'
        '51bf0e04a4a6dca791a15d9ccf1e178ce4a0e1c9b358f8fc8834aea5291701e5261e2d473c5b6b9307d74d784936f9779e4a2d3a0b49500f579c5cfc1bf45854'
        'b2292d85bf41e59d25115df627d3546dfb11fa0830fbfeb91532619d595af9cefa9bb39c96750e0fcb94369c623017f4b95b087a4d8bfddcdfafbfbbf268f7f4'
        '00bc2f2ba8c5f608ad3b1d0154e1ed4802c6c20ca089b9185988fad7f9e807050d1955f46f71aa16cc62ac9ec62692d1928ac93780c59b779d717adc57f8a46c'
        '119fef03d34c1a63764cde489a9f8e5a9930b9fc208d9c1f4f81c64211b801428eb4925b1eb37b86da5587cadc7b196b4393a67f58815ac93aabda76c965fa92'
        '57a94cd5f767841b71dd32740c390f542d90e112e8da6f3e6472be226262f6c80e137f64cc4dd98b0100a162a4718f4195eaa2d8b3a4fa3f713a55fd1e9c5faf'
        'a0036def727c6bca694f262fd6a164e69d47a3c6f48aa2fc90a884dfd609ac75db8c051679625e1175bd9e8732c15f55648599a82f063e0c8945ac0192c653c0'
        'ff4f5326f1833bcb17a9c6ae2e22b8a7bad1fdb6e45b2fe44eaa4b31c06ad677b10dc6e588e9c1216839864240447c854031280ff9fa6632384bcb0d3518d5f7'
        'bca2901e49d26d4dda3f8c97d84ad4f1d067fd23aea30e6a4986c979e4837430eaeb8d334afb71e027104bcc47c1e8cf907f949ff7799c2cc7ca7a6d9dbacc59'
        'ec683407f4b5e97e9020da0bf0ab034cda6e4a11cf75129df620e14423ac40c2343305c7fb0a44d3f3e4f4bfca69f41f2989ff8af1fad6e8430b576bcc890d5a'
        '5e49d84ef572f19530207ee39fb5ded03f9991a3b70aec8e1d59fd67d18d7fe63f97f9fb8180724407c672612528adaa4708159c029ef62bf0566544ac661f07'
        '5b1411e4c2ac0e7ada2975dc2e7a5d8a6d5c6cd82f4f9719c17f3dcf7986e320480ccd06765c96ebabb9544e5d32fc23cf9023aa76152031c0db4f6042a1e42a'
        'd289616ece89e3181661890fd76fee45b18702d674e7b0f12ff1ba4636caea704f7fafee78642a2d5c6194c9d97878ac33484e9e0f17464b8fb6e863fa055621'
        '3781a1299e76329d19bacc57e11dc6bd62f0f9c247213dad05759ca4553bf19c1c039b728065409cf7d9fbf5b32b6de521ad2050aaa6ee297f27842b4f9db304'
        '33a097c869df275f288c0dc8074db58f6fe04e698d63e877b0c5f88136afa7660d8cdf45507f14c8364a9ffee39c8526e6857d9eba1511e3416f22c2d52aaa58'
        '4233149bce10050dbf981936ebd35fe126e294b4b7bd78f519ebf3f3bc2a1c9795dd00386be0fe363304c4a74bf0b62cdb77055914c544a74daf8f2cd4f6eac5'
        '24e3217130c8efde6fc6bab21c4c2c5d64b857c2d5ef5929886b3accecb20a5ab195fe6bb1067adfbcfdf46b5621a250c3e321f9c877f564291b1064369fa0c3'
        'e871ce6cffd31206144636cdab14db05db9b79327172e40fce3c710bac40a5af093771d34987f589fa2ea9bb3dc3cb657b5edff0302369e48a68018d4398494d'
        '7115c0807e15807ece157bde81faa4321bd335bf58a2ee64ba61e8b4495b7b488a83115a10558f35e222523b65d2405a400377c56cf43c1a233ffa722c4fbff9'
        '301168684c91b2652079221ce8372ba3984ec394c3c6f6bbebe4d5e3a01470809ab79475edd442f3296d5a86aeeb3d5be7691a895002c1241ecf4729bc036c90'
        '8d43c8a34df59a4ca0c5cc0b6bcde957413b5d02cdad0473470092b8b3e46d64e76825cf19d98bb98dcd9565f58815ee14a4b588b6c49f6ab58aed4a8b7da3b7'
        '8e4696c543eb7900ba83aa296ad34f23fd809d992f1e917f78d6fec9a160f469ed4502471273637a7a4171afa22f6b4805d9363f23779fcb8f390a1ecdde46a6'
        '182d9db4e0284313365e62973934e086701d53a8b8a081466499a591e03ebfa114c52d2f09871283aece937acb1c784db1b154a7d6f76764246a24edaa3d5bdd'
        'c69042f9268be355eb47b8b9fca1a94573cc1b766705ba2b5f1f350eccf382f4bc4f1a37c0d1617e490ad88a4e6c61142f95c45a9f6c03c363104d785ada7db2'
        '2540c9e5e95273b3f9e8f7b3d2650754f704576500fd0b4dd92d2a54e2eea72537fd6f030fdf68d119f8bb80966100dde24f428d7217ca55ca376a8b4e6b2be2'
        '41cdd34871e1a194bd6a6ae66c6de174d3108855916273d075b02e2a43b80368e4deca0df5b3cbab419d2a86dabb142d0cdb5a17053d114a7c35e399d0e0c0cd'
        'eaf63982ad15be324d8b123b6af30fbeda10cd4ef94cb47dd424b448b6e6ad2b24fb245a6f07e6353e9dcada47939e6a20b357385a995e0c4f84d7739b26b103'
        '43145382887ee9022d9dde7054a0114a2113f0f459202e853ae8c85f23db2c127f3eb1c5f988c0b14203f252f187476b809cdc9c8c4ca88708dbdd20a31b1620'
        '3bd61389fa8308df91efc425b8965021f496c336c8ad87fa12334f7e3d64858ae34a3935f1307beacca2a1ef6a6a39d5709b326dc3fc9f80b7a984b4787c45c8'
        '22b639a2a8572d486cb7e2a9fc8d8304137bff5f436c447874f1db41a32d1f681b4c2fc4111c030d1cb5000c6a3676794448723f4ee2427f4f04f96c06941b2c'
        '24e92c0a04338dfff09da629d1816a6810387c4f6cc4542a423998c77b1196ee2a699fd92896139d633a302f8681045cd10a49f907c06c9f55231ce139aeb591'
        '8bf3688484353c5ebf5385036934af3af2095c534b03580cf311129ab874c6451cd13902d05f33cf895522f8236b7fdd445ca75a0287b9a9b1b39a7712d27de4'
        'bdff4ebd7edf16edb882f717235c71c8ae7aa0400df7a3c3181475da2d99c94927d9916e162fa83def51605278d010bb713028553d8b559321b3a9728db2c9c8'
        'd79cb87e0f350535941c3543c9ad2ffba0ea7cb62e449f69c9098d553cb5a52b764a8ea2dfd585e23439a9e5073446e4ebb63de11f4f416cf95488e8a486f9e6'
        '58aa75a83c0bdba826a789f17cea23a41314ef9dccc957a560cd45af669629d282eaccb03b8b441cf7080a923ca6797140b3a6975cb8000359a363e3403ff0e9'
        '3c1d94497ef485b514adbd5f2572ce3a9bed5a7a68250175fdb1dc1ebb4d90ae1fbf00f0cceb30b8c3a2a0e185639389225a174782ef63a11549cf38bad72670'
        'a05e2b0ffeee2dd4fde97095a838b06a1eb3bcb4d75b9e48ac2b9a62e8dfd07c448779cc554a2ea24cc185432344f28c9b5b7faf0060aa512c44441dd9448b9a'
        'ea976be1b3551f54cef8efd8a8a6ed04790e14d264ef391e16d1f6b73febca5cc83521016ab8439f5020f0873b1f0ebf82b88c31cb83940f6ced03864138feb0'
        '770c51112cad02d0559f563146ce83a26e8e29f22da14d541e166ca8e057ceefe154646bcd768916698f743090741b59a1ceb0f88c1063fee5e6fb910f9b9bc3'
        'd54c59da90ed620f4b01ae921685669158703c94d91fb221a95deb864ea8f78a8664f0799369c12a1509d354948d932be61bd9d83030227223623baba91a8e9b'
        '2ec7a778e6c25b18cc9a081ff1ec507c9a023897eb1ba6b11279eee5e44c6559f54fd16d83bc5a2fe210157a24ff6c97aa19f42c2ddb816767803b7a7b1051db'
        'db169c0dbda751ddc28cae5eac0322879e160b999759cd380ddfc3f77bc01b481a2a9ca5c1b20dbe8989537480475de1deb71ca415d189df4a2b0e24485b5837'
        '9cc40704d7ccd67e0138669c98720a9616ad06810195f2bf52b045d2be497f90439e29c506e05625ad7edeb11ff48a547f5ee44d852b675297130e6c4755d11c'
        '378a0cd31e1b1944fd7373179f3e7d0d1e3a4b9f73d76e9ee3479ac1ebe7025aee142843b1b3c5d1b2ba781d2a3e9188b2d1b808d08623cfa3d53864a852da09'
        '27f7982d810c7634f76fb34a656412ed443d3b64bb152456f3486e0046b221eec5b090c3de25104ceb0be26e264bfc14dd30e280289ac564c40b5e4a56867279'
        '898fbc4974491ce0b074755426dc95059a639195a554dd47b729dbb87c0ba583e8cf3ce1953ff6ed0718b958fe2ca5a8ef35b06a80f2dc6b41097e2b8a557215'
        '2e831942dbc4decbaffd078846b86badab1b61fa3f99cb4257b69e1de5bbcfcfa9ae8d9a02892b8eded1451f3f995fe134b0d7232521c00693aca1ffd3dde81e'
        '9d254d1dc49df2ba9aca0533964e093884a87779edc01f5b11760c5bc69753dd18a75f62cbb1ef51ba12beac6e227249998cb0443d7970f2183550c39606ab74'
        '01b13c5e1b7dee029585c1d361f87aca068b11954908dbd62eda469634256e74aaeb063bce6874626da01e2f85e480093f62f8baed5a75436b43c576545d56e4'
        '77a757d573d670be4c7bc372c32f1b197a44f63407bb7387c5953def433ce265a9252e99ffdb9c56393d886e330c6aa571d00460e4a7c469230fa5f832971138'
        'b36c5161b8a3bffd8688b458a91380250a79bb9ae4c6213733724e6c62a87f12874751b20b19c9e8da31797470aac12c77b8fc527c82fcc57cf19b3968235324'
        '4f16d5fb4de8e1519b09451a84687988512b4239936098f7ce60bd9201d5cc6bbba91e80cbb0d536da1e95c879b940a455f7f8f40ecd78970dbd19c26ec7ec71'
        'a917b73fd0feaccf18a3d396968734d1b66a88723f100ac9598fc7cec2204d6e272e625406f15de8a7a18202faf08ff7a32255921a073ea2a445f7a1105776bd'
        '415522a32ba0cabbfab923df3bd77d3556a9cda291b3aae7be43392f22cfbb797e3bf265c300d9d1de308e1d2dc2a708be0085167434c709b019d4e0b07ebde7'
        'e95fc683a81a8f2c8704750ea05133ea45b2d32cef58f0b31bed76a0ac70d7279d8a9bd0183f3fcbfbf7efb32dedc333e0055595eb79e18d50877467f8237b16'
        'f278e7575228d45ee58bc4d8304632000632d1554ab329dcda004ccb4fe3a54284bae538a72efa5e7744893879a34b88ba9c4c0c678ea7586e386d70106cc927'
        '62da73ea16ee06bff60ddda8ba25e4e23b7fdb13a83af66eb9a2800279a36180a46886a363d41cd5ab501882c8369900e1d5e8df2d367a634187d86f76832ed5'
        '51ca9a56426522dd2b5524b1020f782024fcb33b146cbfae2fa3d3f52e506daf1020ba8a048612d2ead162c430cda9f52f7a4e3eb82e7638af4bfff2ef334b49'
        '3e37e850a7d1c95070840d6dacf7ab17496f5a7901daec2d6269c4ca5c99c5b84cca0862c2859ae8203364e62b3f94c04682d4040ad5f726f66088562c3cf430'
        'e14978c4047f6c0270bfe820661fb8d0001bdb8a3a1e04a8da6a354c0548c1f757e06f257bd0b359fa71d45dd4f0efd1223ca6ba9d25031d3dbc6bcf6d0f51a3'
        'fa842dc7dbc61ca722c5ada2419e0cb5e33c47ec350dd8e0f89f2bc898262f780333ede3a719237df41fe4283f335727f356a2c1c0dca59e4fbfcbf26fae6efe'
        '2018f2e9ece722e14edb44b9b06ed4a96a9335e874e8f338766e6cf7a041acef787bc4046df4d659ada5685943ba14195ee520e0f10a4ffb1daae7c42e482114'
        '260f529a3690be1a4ef6cb83f6b7f7b704804bb3e8d1df6db67ef8d1666cc6df740a095e91ad5b2d8ed979d8ad7341519d08cf50c9283ebdda5a05ebf49001cf'
        '338733465e37f61142ae329795b9953c165877a5d363a894d382f5affd17861ad8fe46337945ffcc32a72364f42bf21de343e3b2a2eb1d8bd68a46c071316486'
        '387583ca6a7dc587c2f91b1f417945321c06c1f6acaa4c727a29d05645b3bfa6422e2ce6ba1fb91e13be620a07b8552a2fdccf020ff3f11a6e207d253deafe97'
        '68b3bfc68a9a17b2094e8b5f720535dfe4bb928393f43c89745790b921af80ea0d6505ba73665b99ead44765ad4eeb1a16eac64bcfd25f2833464daeacc9cf30'
        '11cfbafbbe848f739f4ac677e29386beb100a501391b944fc72d972eef1ad3c10cd99217d76b70f819a7bee17ae3e9decb5f01c689065601e06cd2d568a2ac83'
        '161f37748c4afeed718903f4ef430cad24395aa1850ed56261d897090c5817a86b54dbb298ef0c8692044b225190ec5e2c71810bda3fd17c539f65987fc2c7c0'
        '2433c0dd725c6129eb94ccbd19331448e7dadebd735f053ef61a46fbbbdc961158085ed1918f4c3e90686af265119ad5b43ea9bd28e788511d388b9cd914c993'
        'ff3309954e6cf67e982d33a2175cbf68698d13bf14db292497b03f4e462aca4905cdda55add2ded7439d9f17bc6d2a62c14424b5f9ff2d5b40a438b42a8fa5eb')

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
