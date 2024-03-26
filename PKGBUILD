# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.9.4
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
b2sums=('f27ee16af8661c4eaeec68a1ef968cb2cf10f6fc0955e6c5d91e3c7e91501b6a036186ec89eedeb8bd71e222c9586827d8ba1946101602451c0ea1d8d4827923'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '6102d0cd18d68d8740e41f9d2965fa5ad88ea1982ed39cf18a66b1018ba8aa9dd2a0b494dd33f3c926e53f4866609a9fa135334026e401262371f35ff2487076'
        'fefc1b16e82f3e906408a38b711e1aad3cf11075a16e37c8956282edb3bd7eac6fc59947602e606d79cf3621ca2a3b15fe016b03a4e48951f4f26c1b2ab30aca'
        '90ca0358161451b2224bb7de5435cec38a01fd5cce89032c049157bcc05f428f40d0b834f45c964cda8dcb0cf617fed8953cca23609be925f78493d767a3d08c'
        '9f1b8ace4e11cd3519a4b6bf8cae295f49ad37292a7f89bf6ebc453d736b62453553ae340f09cb3c89645eb78f59bbad2d9783ab31f7fb084e0b59396ae15a2a'
        '6d7344f94444b56ff3acbea6d66bec41dc7f20f2cb038a6c31ba1aec3c3b981ae3e7afccbcbe9dfb8ce25177d966435030115b98a35d88da56413be9e78eff77'
        '256cee2c92fcafb7e548b34272dd4f9fd3203938e02967842daf5d8de9307e128f554a8bf69540986def2abade79250ba6e37d0e6dd06c37eb5aa5e7ea93ce9c'
        '9d1061e4ad60222defb66a00e3fcf2ea993fe8e23f787742a4f2e07b770543ebc74e5aef29ed99007d9d45d29d6058dc81436ceafcbb5799863b7fc2a668dbab'
        '17885318d27dfe410fd259e45cb6593f43e4e37cf5a7bc33b348a2293f2c98ad929b0bef9f2add3d3f2b1e742b02a5c0d4973c3802f1f327b86b106f35f24aa5'
        '4640d76ade2c1d20ed0f95463c7f4ba7f110a250860b701c1666835ea36e93014e67a2e2c35663ea6e1ce1615e26e7a226dd4bd64438048301f9665bd04a20c8'
        '860394ef2f8a083bc1c0f0b7bdd9efb3607f78856c0abb17cd30518309982e2082b7f8ff87dd731ac1432eda50a48c937bb67fee347a8b81a7ce2fde860ef388'
        '03e022796285bef17379b5efa7838414dc47d186dcdac4c117f1e4e925225ed06c0c66547c5cbe2b3665fcb503675f585a38da16648d4350086aeaeb995d65ac'
        'c7d874d43f5141bf9e2ce83de9eaa1d69d54d0e8f7da92a3836c5baf085980dd48d51f7976018cbf8a24f61ff553b8e8c5d3f081e279dc6e029ab1452f3f634c'
        '1f43f8f3abf52a950dd89b40319732639384b6f4b74380891802bb9293b42fde7ca1df3c3afcbdca3bd245d6f21dab32d5d27907bd366bfa78b212ec11f76a63'
        'e4866a6de42ea40107fdcf30ce2f887f0cdee9cccf177f9fa0fdabe4ede0eeab381668112345cffbc2e887942712a4845e317cbf925424db3ac0442ad83280eb'
        '708f72864d79b74fa24360ee3805bc0598008b64065a5980c1848f8567545684083abdb09ff924948542b17084284b2f7b5c0ca92c489e5bbb922e4153822857'
        '2ca6acffe36f63c801ea8ebb480d5b75a932af7f9145713d75d3f04b3b5449d793206f684e1f21726f189681a2e62cf6f1e22b829ef0827d6a14570a98b4c386'
        'c2298eed05e32ee5182723d48e9dd8af8a9cf7e415ee793714df63476fec962da4e9ebe3985cf3e5140db56b92e3dc5c82ec7aa7f2f33dd96885d7d0fdaa2c94'
        'f31cad245fce4f564cd64aa4d4271381459c0a22ea1ecc8a5ec30371cc43e65c7cc392fbe16c7a2832660573bdd138d041b32913759e11d6f57b3d0c2e0e9bc6'
        'c22b7d77ffdedd870c770211a99720cfd33b88cc7fe148b47655182590d4021e8e11166210a30369565118998f05adf8836de3cca169db75f85a7d47774291b6'
        'f54b0b20b01aa02794caea785b3de5212ec250a2d3bf4d6905f55215a5f1a53f02577134460ccafc6f29445962a49d8d9463d71b24c95569ec4d0c3c0b72abfc'
        '93529c3c3af52e3f09111a2df415a238f87b6a726b8d0b1d7ed8177d479c7a6f35bd7be289c8b3c3e3b9a3c7a0b93a05691915ad479c534bf68d4ed69fb06bb2'
        'f15057ff1f2fac8531f64bfc12b74b667001870bc5c30eea2d96d32b313d6ca650b4d8f11bac0386b122183d640cc0c1300706c73b4bc1ce5cb74ab7152c7895'
        'e123699b91868bd7550995689e832c47ed25b15972a7fa29b3310167f1d912a2d7a472c8b75c3a6a0c5a0535692d212794487da5586e42652e9dbcfbd1cccc2b'
        '16ea92cff5a60f156a6d536c9d9d9b5f461254861dcdb1eb3d98585cf71b2762f0cdd98c3f137fcdaa10b049a9e756dbc721be540fb1eda311a320040268725b'
        '42edfa7ddd2947de257ca128044fb993d667fec09af176f8aab821450bec88a796818bc0efb810eb1b5013981eddd9c9ff887c0692a38f43f768e09a1c47c875'
        '34e3354eb2d9781cfdd3fa6caba8d0c65709891f44928a938e95b50c6a5217a12d252ddf875c34dbb613c106db2a05502bc70d43756c26bc5a070f5009be4400'
        '85c605d212ea97d4408de469ddd4be18214add98aed8dbe5592d440ecdeb1015b388153ca76961dbd003bf31fda3039133f6080095817a17c36f73934901d1b2'
        '4ca5f320d91e0b220fd9fc000be7734a6e1af1e01d458e5b8bca19a7f15a720dcbe2a224dc976248c03b103226582a5d22515bb71e930b9def534d2af207df73'
        '58cac61947ef34196283a44b10252efcba8355cb4d5612b516310b365525053de23c4e050193a4983a6a7a1c03f1c977fbbc94cde44bff9cec4b362b80fa946b'
        'd2a68b24884e63bc170b2c74214eaec09ef79f48f132e3eb862821dea29659172565294d3b7ce142a02f3de29b636ef85a81150cd74593b9348a3160bf1b0939'
        '9f1859b6516d97e7b65eac8ac1556d8badf1767e59603d13e5d3f4c62f2a6b8ca859286db96bcb40839b8931e8fbd08b58af9b9cfdb543303addc6671ebcf85c'
        '4de7de7535ec62a2828eea1a8a5c1ad4af543780806aaf1608019853c01aada86b869e85d1e52da9deefeb85bc9227c60c5f9357084400e495ef612f4d0f0897'
        '3b6ea8e89e72d743989b92a3af1504f8bb3915f068d833113613b96fed939dd603aae53c970c18594139bf1a89ccb112b76fd438d22171e677c634d8b3797096'
        '031cbee66e4be73db3d4ce0868477d1fbc7caa88c8ff9d60a29bdb1487aa4d91ef2a572a2d1ef3f5a86685b113c89b5640e1a8ee12db2cfbd74eaa5bde276eb9'
        'fb7b3bc461d5c2a62a226f4f6a36c76df6b317e735f591a6c30f19dcbe1a61531538090e92996f84c47492327e819f9c13d9c17f41fddb2f72e7467d8b60587a'
        'f822e1c41b3375ef6df6e22d1c8dc8603f66b8af02d5d1a9a33d6e02923bbf385f641779c43a7a3944d2e7a0290ce5dc7bc32daff65f6c267f1d7fa351a71468'
        '56cf87b027f5fca3271535dec50a45024b3006bba0827195c861a7b90af28148a0e017b2eeb4721fc2bd62e6a58ecbd8b8d75637dfbde714f45b8ba127f1d175'
        '066e0ba7b080af28738d83fa8f53d2d7eea6c4d045bc39426d568ff67161a24849657cb4890f9a7ab1b050032a2ff84ad0d930807a1c028de1ff5a1f9a4356a4'
        '63ccaefe8e33103d90678fb8ccebbef399c6a2df069a0dc701606fdfbf922f7429a7fa352581949561759de2b8c0b6d2dcf3e2f50a86416742bf553c3951aa42'
        'aeb19af9aefb3497599e4715072ad158b7d51ecbcc4dc055c5bf921bb97e4af2f3da1f6630932a051746bf3174033db46b814d98700ac406870ab82f1c94bb8a'
        'd8c1756c220d1853d5acb00c0f349c29a248203c55d99c43792da1dd7861986b7ef8faff5158990f5d9b3a949980cc7741baba64aeec9c9a1d32e6ded340eb85'
        'ea7bf6edd37e543e7b1bfe9e7590b78537dae9cef6a75b9fa0645b175304d0485a8e65ee0e09be29d64a3601c0da519d96d0c0a7b41d1ff3c356c996af417640'
        'd620e183891d809773f8a2c517b405deabd2bc5f51f27a2b41160e14ee73fb6b88a238a25a97f5e35f801123fe075d64533b718af8c450c1281e6ae0a026cfbe'
        '793c246b104a40b24ad548a564bcf70dbc09fed5fa9eca554e455e4140cf391534048c44b3a2d47645089d82716a4343b7fb365cc88c65ac6fa53e530a451fd5'
        '3049857104ee9636fd0bb6500ee16d0c15cd5d88d0c4448374a86a3559d3faddef7e599c9122a07e2511dd4aea22362477df4e4ccce64537d3856401971068ff'
        '58aa762a145b36d81b6b3a4a786042c4d1b27ea7fd73431b9de29b194214ddde1eb5ad816f712bf34a5295c307c6bbdc62e5eae5c5c11fc79095616046a33056'
        '7f0e8c1b78f26566399e545edf427cc6c7865a6119bada1db89cfb25d596f930ca6ecb140562683df4ee5694418e539360eec627b99868eb16324cdc3f8afd6a'
        '316ac6a4c785da3c15ce14567115dc4a7962384dc26a40d7737192043a272e12467916b77ee4078ae9b9182b80d3fd493cedc1d38a7882c4846de5f8a76770a3'
        '0068d87c72789ee276e9ecb74102e81f3bb5f4846db55ce25e48f7c3b1efac823f0ca8e2bacb3b4d025afb31def1bdc8544902c62d9cdab9981975bca3d599dc'
        '198c3acafb4f381602f42dfdacd588171e531a3b001bacc4f0a8d7e4be4c3edbc6226c834cfdceb7f4bacc4fbe85006cf0523ad3035e4fe9bc7420cfc6cc7455'
        '340ce53a64e939c36797e762a39b8fb5b0932640fe3214bcac227acfac1f09a71f91a3cfeb0037c69b8ebf2f295194b87f13a5a1981302ae7d9d6d760be27ac6'
        '664921392413964865ed189fb218badcaa43b952b5fc7405bc67bd29f9a0d84d98e439490bd918b16c26dfce9870fb4eb39cd942dfdf7461e7089d2343fdbc55'
        '3c1e18d91016e4cc769671552e0681b634f9290e5c76b9f85299fc9ee449ce55f3adf385c50f1b0c0c6cade3424a6b9a23ea23f34139dcac4c05625ec94a8acc'
        '81096b72d958885cad712fb9b71784a39703bd4da52a4786cfabb02728d01d857680157b7469f5deea9eb4935b8c5de0a4ec84ab7fb9d509028a933014af94d5'
        'cd57e961142d1949d656ec71e01d2545e61096fcbefef63c0b20e92b8c842303fd7cf14d1bd525e1f2f5694a79c7169f4c351bfa51ad6f6046ef2671d9eddfa4'
        'b6fcadf0642b7e2ca1eb74bf1e6cb8063b0e56fe504021d486a3608a25be4803e6dc7fd536441ba334f3b2dbc9bd03bee6de21540f2af40c6dead0e93f22c15c'
        '0b9e53d77ccd745301a297bd48323e65f4075837aade0e3a00c2f355bcb1b27b88ebd364be471a8ac463f6869aacd9250692565b7964882e56741c888e6d5bab'
        'ebee1ba313975e480e322fff0a787d105dfda92590a3eab6c06b4028f23ab5234b6eeeb72e5321beeb1d400a069496dbc18874b49d96be76cb671696936cbda8'
        'c73913ca2fa4679837700352059e6a28a0871b73d280536b461fb8306c7d3f507ce37481fce06e6d14b1e779825a1e79dd04c9e341f7356e404d67edcf35e856'
        '9305a117366dee6f4bffd6ac2e41951e56bdfeb23d5af28ecbaa58b76f588632e873ff7b5b2d3b0f76f2ce1f8ef3bc54a9fd57e15a64528145456771339523d2'
        'b52128a834146969bacbffb5897b3d87bd67d815a35a73531900651eeb8274e31a93757c1ff98e6d601e4f06f91a3a60ff16593ab38ffaa58f4dd2f6d3ffdb52'
        '6a74ae5458704999cbe24e8d77d62e2454ffef03d900086455d3d525954f6559c4fb60f2e6272c9230049147f4525cc5196a691dcb6cc88754214e91156435dd'
        'b5fff53e9335986a66f2947cb5842d5dea111055a37e78cb96be4791dfca6caa95b9589e27710c8091c2638fa17e71f293fe53657f314052e57f9bf5146c2fe8'
        '0f0dc78f125f1e1908bb1735ec93cf53ea4e4c6da30bde67ebd702b4921b13bff948392836edb12078fb3f06db8148778b8614b3e78c44f00de74f6887ab85b6'
        'ef0760860ca60753cc6dd1ffb9194e4db6d66b711b97db824cf717a0fb91e82b4a58eeb69aa41330d4102a81d0a632e52da26ad78b85b8645230e8d0fe8e6775'
        'beee1837f2f194998a634550ccf3a30955990f51e376dc459fdcf3ba0b69011be63c772263302e37e52f22f93cbcfd2a9bc78d42c5cbb26dcf69113df15ff12f'
        'b588c1b03cdc02ebb81fcfda0cabcc8c7dfebd3b8d726c57e5effd6f88f61c5fa82a720c059aaceb382e0bcb1d939043ac2a61f0fc5f01512afdf7203c5861f4'
        '9d4f30da4331e16d0a598f951260bbd02ece3a494263f9d346a58bd5bbecf0259325755ebeedf0366eed1bad5a5ee71a1e4387afb818d51e226fb5d5eb11b272'
        'b8e32a2187bf0157c4ab381c427975ee749350dcfd13fe2568ce7bc51217b062545b81d1953238dedf13d7b3bb8d1e44ad472133f6973c1282f93dc62526c3b2'
        '9dfe6c74a52ab8ed21b5c67e6da711a68722afb4fa1c49e12dd060c6f9fcaae2e9b2fd91e9274fcd55ef7f591bbce005023fa9cd664d8e0a72fe7ea5bc6ae87f'
        '3c019f79f3b103e6c13a37319f2009f04edcee88bb4bf5baa9a66c422e86bc55f8414eb294d5dda5e3bc550b16bb8216b0330fdc81ba8c0c69bf2033b6e6aa77'
        '7f2b9904b12e1360f52bf1112c68d8f4926c9c7a7e881e607262f2a2e8b0ddfd9224b00b01a1a8260f61b3ab0df7e217721a30d74124a04fc438114b6e0cc872'
        '0cdeb65a2e3ea90f9f007d0026ea32b17861411013589961cf9e5e223d2771490a44436e4a9b86fbc2b10a1a84b8a114fc7de7f4950ba48ba371f00695b60ab7'
        '165d58e0b111a42e88124d53c26c9b073b955a851cf8150f512d49693b1078885e73c8668b78695a6165364da9f01ebf4095039199fe8c2c94c8b0b160a988f9'
        '4bf238402c3e9d3582806bb2056fdd05aec9900fd819c94f9fe7d20a22e828c07a7489f424e710964ba0051f6b3174f1d270b90e3c544b203ab636eac4e9c31e'
        '418252b20bf1199db8a6e0792feb97912db1c12c87e09814403053ccf0a040eeab74a6a24415e4fe53985ac5f328e1695fc21ab065a07b5fb4dfb5f5f2486b01'
        '91ef6dd0ff83aeec5529e6ce1037bda01a2c3a7aec16dfa20b7a167e9e689855b34398b7c05579c863043a79a231837ee71896ba0269ce55905a015fd492ef12'
        '1f86587b60fa190ae3794a805d8b735f61f34e9a36be13d96ccdc82a50707f03d2887589576a28ce7a60af3f8bc056526bb882af2a1e42f19e7339bce9f60b7d'
        'e2e69b6eedba9a53d16fa2e21bdf41334dd9a60d698d11010c498af16873ca1ff4188fa59cc37c779a440d01a400818df3be7e6ba70a9a68298bf1afdbfdfe0e'
        'ed609ae50fb52ea820f5b0ec9b0f445dd6ef50394baf214e0123b6eb0f49e8298cdf5c4df005ad3cf8b057f917db72884dac4e0417ffc3cdbc40cf6946fd53a5'
        '050936d068863546aee15b28ee79b288f55ec7abdca57f6eb89015071640cd1d199fe4bdadd531a354156b79cb0254c2c40b0d931273fe4b03811bd404ef07e0'
        'e2ccb1c96084c7b7680989b884a009a9d8cded99a8e261eccbebf1fe84cfeb1cb9a9811b269c1e0bcab5822df2a7b7964f1d5dcf0026e6f86e95a93a2143db49'
        '2e85ee6e31912fa0af4f5fa7dbba9dc95ce964f5d30da190d4700dbf9c1b2b64b9f7ff0806fdb9f67036484be6227168978678e260020b8c6e0b399ff203a738'
        '692963ccebb1fed9657778d6cf9002cf353b7faa9175e9c3646939a5ada00caa0dc8645a40951f131523b8328834372dc938076e0b4697e040f61ed6935d2da7'
        '5b2fa1162ee23032f9c9ec7baf71ee5cfb6e4e88bfa35c306d8159e88546fc4db5b3675ae822359ff23bfa78770f6313a4ed84609f9047670ae4b02536c9ea78'
        'b450786eb4f8e4eef3c3839330d7b98bc3df0967a78e761d9454e3d769f6dd85aa5ba3aa5465621567f303e69eaf4353f307acdca16831676937a47f7ae717d8'
        'd3a44ab6234c6fa59c1c873db2e11da02556e8cad3f5f75a67c99b6666a6524f88bcfd4a8f49bf0e90cf555cf0357e5851a1aa9ddc088306294aa258961628f2'
        '8dcf5ba9bb912fb4a5275a8a15bf87eebc9a6afaf0c617fa164e6961f2e94f25791d46c21d0f8942c2d39cca02b8db7e5babc1571fdb919646592a42486539e1'
        'e2efe7a07cab02f09aff5719d23f6e23808038a4a479c39d755bb2c495b78deef30839a4230039a1553a90070d6c8652135507942a278d97415353eb96cd88ba')

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
