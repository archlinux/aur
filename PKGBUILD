# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=25.04.3.2
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
  'https://www.collaboraoffice.com/repos/CollaboraOnline/CODE/Packages'
  install
  mkcert_example.sh
  sysusers
  tmpfiles
)
b2sums=('1802fa838a2fff33b1afd09f1a1aac90be12e15ceef3a3dec953d2ee6d7bd2bced84711dd3d806aa0c4c68e9160f8764264b2daa2ec1ba0b712cd2ff5568985d'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'd0d1180147adc761ac1413d4202123ba0f4412a509686c915f2d0e0b008c726f2ea061282bff60d92811a97e83280434cad7ef2beeb3e6cb81a726762ca18e89'
        '61144d5ff933767748728e477ebb3c8a5a5bbe7bb8cef2c4be9aea7e8abc74db752bd8223689489c576548fcb7a5b1acc952e95480502e41ffd930953d561fdd'
        'cc30a33beff88c7888ba2e72e920ba82e8ac6ae1853f1101951c20d775bceec383df60dd039bae72ce9a2e264d7364249550ce79955ec3035e2b9f4398d0e00f'
        'b3b4864934a856382d9031db47aab2e73f3ce97ae9052f09cb45c6013c36bb6d6b7fa891254b362f5fd1aa93a73f31cac463d5f5cd98c47db32de2dea12520ce'
        'b008d2ff44b630dfa43895e76a35886343849dbbc2c773ef11cc6553423a38741943c4c542f26b64fb89e97ac29fb7622057c9cd3f5b36f6f442ce43d3903240'
        'a25a885dfe816dfc6eac725259c4770c7086474a99b109176d5ba8055f7c80bcb7c50896a8ac7a7ff67bee3156beeb38f26ca91561afc3e920c83664017f8a11'
        '08dba1079e257a7b9c12c93a7871fe4d4c81455c9c680fff0d7b7158a25f4ec0b42da35c09fb85ff3d416db22fe6acf4a86648b1ed14d9a8e6d6b03bc9e78e97'
        '1577cd65af6fc9d9f371765885dc812efb788643475c9e886159c96a98d25398b9ba9fa4df2d0ff066fb7fffec691b85cf88ef26e4b4e7614b037413e5ec4236'
        'd1e47ad3d7fe632c5bc58c65dcb576a3889ce2c8ed21a5a3fcbe7a1ee2d9e02ec5607e60995de80214ddb05791a2d28916bad1f17e7868bc0e4cc1d0ae87e1e4'
        'da65870253feafd9dadb6c1a139bdb2850d9b71f8d33d1003db7256b020d9cb1d353a550fee23e49e4dd4ca9b206bc57406ac3f2dee3f21397995116fa2e40eb'
        '8cff3898467ab374daeb6f259c4ec9dadf8bed7ecda7b9a40c32ed52ac8701b81a6664c040c76a4431a76137e4de1059ebd3f1c6887ed98f965e473b0335b3cc'
        'b461635450f4a37920569ace492030c3e451a0f6f542ce53e2e70ed56712389834c4595879b335a3ddfbac3390fad0804c30baebbfded93d90942ff3f9e51b2b'
        'fc8183f44e15462ef5d7800e3f6cfd6f0532c80122c164bc292b9732e0fe84d0422dae3783fda0d692f40dae9321d8a24607faa9ca19c56b4085a0609535bdd7'
        '8d13539594f84799880c6b48568a83fbb3853e2ffe7f42f4ce2fa5106f30fcb7cbfe0171ec2740e67c7cac8fe25005e940f810f05102afec769fc0ac6c927239'
        'dcdcd73d158a449ba4548086820ca0a727cecaeca1f064c01e19964cd1e3a4610c01348bce9035e957caea165657ffd4867cbb1d3bb0770cf9a238cf6c73534f'
        '0ff198e05a811bac2432cc0a089f95e97f3bda2f050fa90884cf22a751a488e83c13d672e3d64c0f20200f7763893b5274b0130800e69157f8e27dddcda9145d'
        'aca04a342c98b7bc2190d6d83b94862dd6a822536bdc93f2411e173504baea87a948b8f986e92dc82be67e3fef8beade562773851ff64d6947d160538e8a25fe'
        '945e5efb8d3478197604e1dabf8af36ed9eb66c4cbd23a48015bed2ce0e4f8122935966942c87d2290b918dbbd1c88ef960502046185d7d6f3a13dc3eda92d18'
        'ad6ef9e0cf0afb92ac1861fd550a57c7c8eb1a1f677423f5bbaf5eee824ba87b1e50ecd41d95217fbf8422a9ccc4c9d04d6c45a01e20e6c2f09aec499a10ba3e'
        'bb486883333336f832ea41118e3632d3f6616a9e78afa57daf41da6d4f984f11098ce7ca0b86ce453e5e72063093bd5c68bb81a4482eb5280dd2daca62bee5f3'
        '423770801bda4b50b4635f6fe3f0af9059d79feccb7117118d2142f564d675f1379f000214718b1f6569959f82f6b4b6290637b3b7af814a670245e18f664861'
        '8072ea5caab705c2274b9ccced3c136badebd98e0544d2f59e5d4764fc2851266c8a0f61cd9f7a95cd97adc2bc29ec82bc5ac862ca05efb10fee5ff83b0af562'
        '60611774fea76c6c176a0c9c19cf0ae67132d134af61a1dacac501b5bce36f073f6c971529a27939bdd85ef49a4dfbfd5f20653903566b28dcb451a3593547b7'
        'b4a5b6a0c747908e17b4eaffcc5e476bc94eee5d297d62b275ad3e9237f1ffa88da82966b7c015d54d6726608de1e62e7a3067f4c95c60c2ab83a4c6eece33a6'
        '57c7d1ff74f1ed49d941ff1e9497f85c0b3655d059ce12ddb91a5cd690b993785aba8e988fe800518ec672a04f34d8a6940ed23cae5f91c4b4b99a663ae18ad0'
        'c6b7cb521bc425ed04061b58d8c631a4606a1a1e1d95ea9a099c7a9a24296180c09ad44ae9a12d82084906a49e2d21270b87f12d7979a967d5337580a489e871'
        '6c5067495671a2d92059cfa045d14cb1450f1e09d81d971d89d82904d528833504ad4e106b5cbf3966e0697a67af89e6268e854ac392efffbeeffb01e44f5a38'
        '1618de217ae0174fdb0144518941ec8d460ef76a617218ca19c41da79deb25f1d6ba91a38975c0c569ec38a2f7e6df4af87c32bbec35f59244031f8497ec3813'
        '06a28e7a12b1f82ed8677489f0b28641d1c21012443e5040c95a9f992a43cc5ba2f2e969f7bc12f820bd2d79bc4ed27ee0faa29cce4458dd0f32a23bbc6b3967'
        '088d81ef508495346db078bc0165c61e8861ac8755d523978f99a1421df5fdfa4a7664fc66bf242959153c1a0df29d42313382692eec3de5b884814ba37017a5'
        '5aca30edd615c7e434b38a814bc6e0395214f8e2da55b02988a1f55c62797d81ff6b90540e368df553d290d8f1784cdf1c4cc2264f740db55b7728f80f886b2a'
        '4007f7ae5c81a43a420f76100401f2822a69720cb2cb7e28e3306b473aa16407aa58ca273d14df52be3393b2d4c5415a5e6456d2f39c961fb18ed7170097ab55'
        'a449aa7b83dc2950196788ae7943f73e5374ee58a9d462e3a4a9d80d9d115e1cfdbcddf7c97ca9fea23cfac495dc41015e499170fb55fe45b7c20b89bc9fc1e9'
        '2569b96a545ae2015bc7a135c175dc5287e1e85cc801ff8d15c28a1fce71b771af6b7b65db70454cde91b2766da01a83aae6985e377300f1044442ffa762a864'
        '5114e8ce2e234e100529588deaedacc734aa4f3a7a964c07cc5e31db8fc20387b549bbb0553138b96c3d3ee4082857afffa7e8f37225316d74ca70671f42400f'
        '7fb03e6d98904612f94ef386f3b95529195fbe8fc8595ca4f711fff9c0955fcae4b608a7140a84f491d52934dd752eb63c57bc96ea61bdc11f7167fe0ce461d9'
        'e0022bc5407170bf3e1d5228ca0ac97b73bd1825ed434c08e6e1f3c177b52dc3af70836b46285b43925beab4ce97409e84db63bdd3e11fcd669d9a0f042df166'
        '8e88d0f6004665bc358bbaf5c6f2680fb3dfde5fbbbc36a4eaed1d875a61742e14de8f4b8837e3755b33f4a805213de589d0122e7fcda54dc2219ca805f7ddf5'
        'f8033ca89e8b4100dfa0183c3039d51653e789b4c85793036fc395f3d5a68f21173c0b40badafce5c951b7f5acd19562ee12dc24713f5bbe94277324d671732e'
        'faa4dc701d62c7a0d08fb20c2428a546053a668dc5da5d9f07759b994241dd9814e79c984e3c7dae409188c9088f5820798f2b158c0826d17452009ea82bc9c8'
        '8d0c27cacf7967aeffeba837a8c264ff61abb3b2b28fbe49bdd497a9f692773c70d8cc127000e9a7ca83703a2e06f6ebbab1bbadc90111fa730682592005373c'
        '7c0b5769eac3a74cdb181ad89334b3a8ebe304e744d0480d3c2ac23235ebb547aeade463ee3a008340d0f06b3d9ebc38968e5a279ae0d80d245917700a66ec1b'
        'a7cad19fde8a4a3407ca7832f92f3e9a377f78b5e243096533740a15990a372590888461966b7cb44648c74400857355d5895236d9ef89afdada13052ce73faf'
        'dae408a4045e60950eb9a4073f9232d3724e7b8753ff5569ce09556c75304a2b68c0ccdb93f69e641affe7b356b9ebcb304e5460812304e15b1b4879fab37688'
        '36c730e77b22d28165961124748ebfce4763f2df6e4643c09f88f40ef26ab3b948ea0ef8a8059e1f1a293248ec052f6b4ee80130443afa18712ad83d8d8a419f'
        'd27bcd66dad2a66d2f17f401b86741168cc2ebceed71a257d37ad6f41be977645dd05ae51350ba1dfe7775e1c64858126ddc2e26f85ecfa615515c3d4010936d'
        '70f469968d8686da21fa323953739ad68e9c5fa53c60e2b587c9fa68547c08c2df088123022ed183bad87689276cb021d0abec74d7b53f3e7cca154a1094ec24'
        '1d0bb76273f609f12f97e1ce3b93a62cf1420a93b7d5b7937e08bac6ccc55b80f46db7634b842cd45348a1489c38a8a33bd1f32ed7e86dbd6c8e5d2a8139cab3'
        '3ea3890fdba1eaf1a8bed1e22c2dcaa80637eb77964d61cba0aa0cea2a015bef6614210cded954b3d8de57c4591661852fc60bed208f1282a9101b684e0c9fc0'
        '3b675f3e8db6a6aa6f6b2a2ef483f8f670f88d529b3684c52000173ec50cc59118192a43148d6ef7446f5585fb31e8fd0e9edd61ae5ffce471e2813ca17f30d8'
        '2dfd024b99da81bb312ee549d3423e784aa44bbf6c2a30155f41ab2c3cb569bd11d623f64e6738c5ce588ed71da5fa2a6d245cd08722c703eff9e27a249ff411'
        '664ee6428382068cdcfb1974a3e30077da366b85b7169fc9582c044417556142e9e44ada0f2f0b414abd1b6a6c0f381be350381d87eec8ab695ee3f55929e1cb'
        '8abf407a80e08c47359f501c06bbecc69b0e0c027c84635851240d81a2a0226b033293e685a8bb7edfdabd8273c02596abef4105fde92f6de852cbabf9d9ed4c'
        '677eb00a5e9466b50203557dd58a4a8c47ae69b125c55ec946fc971c7f55d4df9f9f270f17894a09ea9f0423c3a39cec8dff56637bec95d70430db03f4f012d7'
        'a25940261b081b842f04e13be27cd578ad3d8592ec510e17b45de3c2e3d5296869020c0219c0915fca677e653aadf7e67edf1336ba962659f8101940d2c43822'
        '1afef12b379a710208e66143a2ccdd0f95f00691da77fb80582a013c67c91fc5743aa0c014096c87b34685f175a0cdaf1a3e103487dd628c8fee3cde977cbf30'
        '4767c8a305a181f9305465b3f66b2831b6e42d3ce04e6251357c694d3240d53fd33f1f4780fb9d39076f62c7a5250bc9cd9716a16718487990986b294745ec48'
        '1498f7d6d49b8d0c067b3f572f07360eee70a6db2360cc5febfdb37ed1b2bd45fb449799e6a3476068ab4af85d501d410928b5b6ff026c3fe7116055d2d3499e'
        '85d4fd0571f63e7088dad37d7edfb4e1f3f659a92d81d49ee541fd43d9cd2d88b09e8549bbb036a677ad39439782ba2e8deecc7f96376d1fa78c28310f695e22'
        '8ed49c7b2b7d83e17516843a2aaef8bb7491572d572a6f7de4b3346faf1c3bd1bca32bfef22f280f7621b88921defe848ced2c0b4427b21b0560391ecd2f3e32'
        'a56e510039f83f1eeffe9a77f44fc4f5d40c657977ac82a96cedc80c83d93d461e3151155dd4a8bac643867d4d9f99b45874aeadaa9a9f952938f3a6eef0f11e'
        '1b0fa8fb12b160e5e401781065584c80a4f178d6e8da1558a95f8298f451fadcfb9633234f1f344cfbe9971283bd5d5fec5cc02be40a67d42858092a22e835af'
        'b6824829a1c843d07930f3bf0fb03f67cfa31b12e6011aae2b45c133d065112b8093dddd89d45ad575ed7aa409ca8ec02511cabc80db6cc806373dc0034d3b18'
        'ee6505cbc60ee2a12aa45c9af282d75c17477d80fa788c3241bdbd41406fe062eef99ad10f15c1b62d008f10730334bdead01600af369be6a1eb065753b1b584'
        'cfe1ccdd00bee3eb01622fb60056235eddb91968d6247b31bdeba8147cc02c0a7d19c4456b1596d3579663f86868ef3d1046ad718a288766fecd0ba6bacbbbb2'
        '54408923979c3810abf59056432685d36127c0ffdebb3402f3375fd14d53781b506004c521f77f825b631a6703e2994e15a017a0f0013f22fd2e9e8d51b36031'
        '334a624e23606c8c2b0fc11d381b4ee09fbfbf93cea2d943f4c5484f0b9836ef2d3f01516f9b766fd00c296ab8406f6e505b8f311e7755a3a9251badc3fc3dda'
        'bb14df89cf2c9d9bd2407475d1ca4171cd1ecc8220a543440c05cd57c943fab096d09db7f6dc9750f20adb93b9dc055bc82487fe9ced73bc395b73663f29d89c'
        'f0390e6d6c317a8a13dedc91e8f2aaac1c3dd9ed3d7560442768154a0bf877af74dc04a8a0100821fdd521835ea9aeedddaa11de686120de8feb174e9bb5c78e'
        'd31cfc2a5c8116182decc7a360fd3615ba5a2e7ec13ade1911653d34a7485e1dba81fcf43632a577a340494eadd4f1c87229c78fcf5c66e7908303e21e20b0ff'
        'ac56ddd14cc9432e89143c124a711b6ad15c15546da5fad2e20429985130de53b42f5b1e6f7bca45ce841049deb9b49950a163451959e8ac4067dde23ffcb148'
        '7a7b50704a2ca21c4f2cf4a1fe0dddc73ef771347cbf55834fb1b2111fcd35f1e8235f0b4b70c4b71ffcd2fd7fceeb1d18483524ac8348adce2194310b5a07c0'
        '827b18845a16a0afce18d7e892c2f4d03c88aafe3215b1049fc6341f5acce00e84e932d0251243e7639a941276bea7107402bfa0af34941a3738ba662f659c75'
        'ad05d5d5f60b2f06dc88c01f0ae0ef9ea6524c12a4287d9462c755ebebd1cd39a198b6518ab5e79d17cbb270490dd6cb9996d665644f904bd648d3224db307aa'
        'bb6fb34c6546257aa1b2fc7a7965f74ec2c9c7955f8a4c112a1384524cafafe65b1240adcee669b4ee9135e05af421ab4b44811434daaa6c956c2d48211ef3a8'
        'cfb057f3ae9f2fe21f45a4df03f9610517e549357a1877135195effb6a83f9c7dbf2ec23b2cd2add80ca7e92bec6122783a4b2ab90e9acf3b955f0304e125034'
        '81356c5b27e5bf0446fbb98d9843677ac25e1283b23bff5e2f76ab4c4f98ae7aa68d6f450677560615590c19bc4fb0436903fa51abc9ac618d010d1db9066805'
        'cbfd06ed5aacb6ee14e3f9ff1cf4f1e20c3b88d808abcde6bf1f6b1c86def20c314c241270b549776ff21e84910724015677cd7f259b93755cba07420ee50b98'
        '4c44be2a5a68a40aa07c0c1810a28f4e9e77459280c8c232ff1a215c08210389dbd29f931778482baeb19b86d96949a8728736f9881a4cb44526f0afca3f9e53'
        '4ee51ad4d18fdb57e41c6bdf7ae4ca737787aa05b3c40ca303db90a2399471f770d0dfc0db885d4712c8b13650b60858164b0c779182ade265ea93a7266ea318'
        'ce8131ad28da1357b5456e597876643a8b5eaa948e24e44bf0a44d89d60843497472317c2deee5d999f1727827228032d18c75d6dd3b4990df8da912c65df014'
        '618de3ad5c808e27a5abe17a6763f33e3d5c0b66d5e61722d95df407a9651f931522512e69c16ce495d304f2e0e91a2e91658398faae56743fd4a4a1b51f4aa7'
        '0260196c463606fa8b5fc05af37d8c2995454acff2fa18a1df8d0410888dfc4fe40552541d6d80da67866fff2519b7c48ecc12f5632da202cb65f5dc9f324b49'
        '47232a3526c097bed3c1b9cf4b81763a0e0ebfb6aac9d9e30d74884866786db1f51cd0e8b0c38110b3354077623f90f7de00d80134c2263651163f019e6f1b9e'
        'd158ddc7eb3aeebf720842050f81109268217d2de4dbcea59113a7a2a1ac338c53d081fd3c4868be6b617a1cd249c18a7d237e59c1649f6420e5d169df8acccd'
        'f395a4f13aae18278840e53bcbab7c55018269cb017fccfa84befde7b5839e412e57d146c9cf9b869b059a70f661a9c5c5ce11fe0d39fb68d6af20ef1d6683a8'
        'a030ff2add3769cff2e3ee51416db9ff04b6cf28ecb8a27fbf9f923548bd67f5eed2505dcb0ba07ae8c3fb5a934bbf2251422313c9dcd38874ce72a8b8732589'
        '04a5fbd1a8e7e1bfac43366923d256afd7e3f8c449f62d2ffac56b37e523d3598b199aa007e1972cb35ee4fda32940b1d88b4e61e5b73c4c85449bb2c5a24e23'
        '3ead06520a89895281f39fda6566d15fd6fc01f1ec0beb805f0987776511564a6ba64f0278448de7b91b1ed3347af6e391002c161a785c249e183f83948a9304')

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
    depurl_all="$(sed -rn "s#^Filename:[[:blank:]]*(.*/)?#${source[0]%Packages}#p" <<<"$meta")"
    depurl="$(echo "$depurl_all" | tr ' ' '\n' | sort -V | tail -n1)"
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
    | sed -n 's/^Version:[[:blank:]]*\(.*\)-.*/\1/p' \
    | sort -V \
    | tail -n1
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
