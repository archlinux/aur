# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.2.1
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
b2sums=('33272809148a2763b2c924d2a919a8700431465c5905e0c26e410451d58afdb0cfe832eb41c41d8977d1cd2889012dd933e4f3503cadda4c12ff1aaef056b25c'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'bd51ff8161f1b88ae8c30db830f982e2297aa2e7ba14738f27d2074c479157fef5f0c61fde163dc251e9d8905bf31050210802c26f32c9c25a8b6d20c4a50913'
        '97c6339c58b49c4e0c045a2631b6f126bf822a294ecb75d23937ebf3ff8d8310be2c8c4064d089a7a0da3587cbdaa99db42e9289e7e2de2f01b41d2546085607'
        'f8f049141e8360beecdeadc827211fc7535e743058cd3a4b313e2b68829ba0776f04878614248195c850376c3b351a716431faf03995c505cf3877141d69a196'
        '7a4d4050615652b32e77e7749814297b3e0bcfb58479c8d61bb5acb1c9e292dfb871aeed0c31299746afb7d5c01bf20719f0e6435c65608d086984239d8e14ec'
        '0eb4d7b29017d02a66c04bb3c6df33c21b4875be9cb96ddd4fde89d2f1a531ca537e8c2b00709b7d79260f7ce48aeaa7a88c60f51806d2c96d2c8632722eb095'
        '328cd323ef042496a50de9f7c8776d512f114584e550ef8b8d348410d79b2386f19fd5ba77a91ba6ce5a23291add511794ad69fb9921ab586ef0732b80182fab'
        '54286c23e9d3bc75a17fe7808dca6d3010da62d87c491d4280508cce7995d742526616a823b7841029b616e137ad320f2ac3651a220bb4688a5f33e91e1d77b6'
        '69fe7ca3570bf2a787134389bd8e656292f814b8af123ab87f33a48b6743cba917d09b5e9fc8610d45808d3ff16222a8e775a4bffdf08940adb03cdb3fc2f626'
        '0da84650d73616669bb27b2674562675c3ae0578d0406895d857f2fb43a9e35800c7f89f39e410932ad758e1226a533dd2427ed06a487ffcd0e94fdc79cceb97'
        '425b1f239d24c19f60517d82d325b8d4281214ada5259e80bec21f11c85137616d8efd1111a71f9e0d86f1878f57587122a789b4c36814450084879b1d9d3048'
        '30bd5b169cc3903027f5a21c3c2ee0715b9ccc8dbf41017f7f04f7cdfdbb5fd1e110d4caf0441b055565b95c252bd16149843a20a2be9432bb90f07efb9a25d7'
        'fc8df2499a6139a8a0205038898086dd7ced9fa68f94f21fe0021b05c7ec9b7113c03590a6c6afec69829668b1dc98692b3bf6b0476248e55cd1d88316f92709'
        'e8fa5ae6d3f15bfc58392e7de05df89809804499e8830b0ab1cd172a9acb07044e1ff3e98552dd365b032d353d86d97dd749ffd7d9db28ed6b5dc4fd93b26136'
        'e04e09aff48245d5518f088a5df7494f53a3034b32b9f97265b5f05e4aa1f982046d35ded1b42df274ef233999f7177b6e62f34ba0196286a184a47edf83514d'
        '2e741628bc57c24310c76af5805bfbcc58eff148ac83c0aff197249cd71979343ab19714b404c370f8d12b6a7f1b7a338c715cfec14efc0141978fb45d5353d3'
        '74d06406009bf03ed29dc75ecab49f0021cf7c46dc01ad57ed83cdf66fe604f3666e13500c4337f662c07c68cb796b6273dfd2f56ada05cc2940671fedc7e9dd'
        '5c2d115bf85733ffa7b3a3e5f5fa35f1b5c52b767e0b7815e7b3d923be39d126dcc7ee225401636a5c863071a394cfc4815c6589cc613a1dee16845d4155d144'
        '69a475c664ea4a7e09f41ced682cbbccf2ce7c5a1dcfc72fa67de944e99d29324749bd56dfba82bc0fba38bb850023c35227a29dba9308170cc063e40d8b1f69'
        '7f42c81b452a69c41165626e7697982d5ae29b649574beb2572253508235ac30e66761d3413b8a1df78ba62e5b0f1d70fe2333edf5db639537abdc384403b9c1'
        '4657554996e8658f7c18627ec90a047b8dcae74c0b68437f688c6e5512b324fcc5f7cdea0124f8fd4699be5a9b4d3c1c6f6282185c2cbfa2b2485b3593572fb4'
        'e60f9d5390fe3b55987b4ca7fdb6e8bf29fe02e6141e535989f1117f7ac77a2e5ae8881e172333e1b4ac1c1f35f0aa1a9903729a0420550a9ab81022db734bb2'
        'e7846c03a69bdbfed9517ebc8dba818ca9b75d84c6ff77878c798a2a8bcdc007f53f2b4d5def91c78dcc61eebdc34da1e3e987db2e10d8977d422b2a2b5dd674'
        '31f730d40ad052ac16c9719e3e774ac80cc29ea260aee5adbc6d8a987ee6913806ac62a14954af772c8d7ff4f2db6f0d5bed162cca552ca7f4bcd183406dd084'
        '17f6fa760b1a75c66f03716b6b20dc9c7a9bf717c3f3b2fa8c91a20a4e811baf12a1b4b4a130322e1f7057479994dd64cbe555c62f13b4e354907615c08c40b3'
        '5a32d55a52342bfd32759ab240753e26db5f4ab73e0e8d4a5b54ecfd032191471eff686edf38ed1a07aa03ea3e8196ce8d7c59087f1f71ce822fdec003856c26'
        'cf90bcffe7a997cfa0e440855742f3850c7b9e90beaf4b57bae90b731a9043492f7180b4b86e666c347669408823bc99dd1a3d88ef4d422b9248e07785afdf9d'
        'c0d15c57175e2029c76a00730273e3046421918f2a264912393e4c589125221a6fd1e9d07fe8a4def23b6991c4a26b1fb702d1c17e307a8e16368dbaef31b139'
        'c13c427571f60a3498095ab43243c4d708db186f164580e538b9b10afe9134010fca1717e4109f7e08d5614942d3c06446818b07eb90eb31f70fde1216737139'
        'd3d4b3d4c308876237a7d765f51d3ac7c8300b92df0d8310fb3abee1acdf57e91c4ddc58026a451f5a31ab59c571ae2a3e2cc37574cdfcced47d6f61138ee348'
        'a0a2052c12fb733b9e5633f6dc1bcef426ed86e39c069dfe0b1d175db8485f40c91a5d48ef8ac697e6e798655f83fab79f141e43e62737180ca45a6ec5423e16'
        'de5c485c99fbfe348b3c890e94088c7ea084844e471f79e9a2159e75c0e65f53a29b6b5cf85b5a8212ae3a15c225dbc0f896fd43a08a9030124b0da3eab36c9e'
        '7fe950caad6a6afaa9ba3704384dc28815df7baeef5a15fc57c86c0f6ca867899db9ab5b5fa91780cec9aab62a7ea1452a6949457df9589d7e804df93f0bd8b6'
        '04909e8cccdd4d16dc0517d8c592957e080f43b0447bc3937859ff9118840722c1bffc764e4e4589a2e33dc7b6447ceb8031e6398c537ee3d3964822b3cb32c8'
        '9034b215b49503ddbaf45e36d9e8370e58cf65ecc32cf86bd14d495f6a927950cbe9cdc4b8dad8c7c6c99b968b50e297bba3f86555f84007cd2900d7d392682a'
        'ffc014894e94414161a93f9a2898a410c42a539016208b19262b252208935dbad82598c45c74c2efbf9f0aaa2a7183859e7366ddf37874f806b387fdf15fb3f0'
        'ebf108d67f3eb8105a9874fb78ccdee41857c826490246e4ff3066d002f69863b1431c733e9b6a9801a89494cee38842c76e385f2122ace8906b85e0db4ecab1'
        'f03a4e4ee5b0a2639247b23a516e680b924acce148ffefad9d93e177390b4f64f3e0a83dc553f80165fc53d787ac37c0d15cb041f26731c4b4bb799fdd752ab2'
        'eb85ff6b0abe7af077e552fcc41cbc83f60b45dec7237e2af5f8195a962f5bf7cb9a8eee6bc21e25366c5316517555591b18eded9c82c63c8b04bf98e0a39f2c'
        '14bb405e5fb67e0dab9fa09df85b9e7c71f153c59aa0bfe7d5082486984463c9c522bb10c3069af8c202506eeb25a27b1ec66c7636165294a20c296277060570'
        '6f18c59c92d333eb282b04f8e12afea6450103a55f8c0b975edc43d839550f5bdde5af4cfef6c17202d860fc0685b13fdfc9e66863594f9e089134ca0b92f5db'
        'c0356cc3b90ccfec963c42f7a868e54ac4629b3d3006da0c3609fdf2b6bbec052284952afb40ad3eb2c967a832b0030556c2587479f718d5aea05c9f41a8204c'
        'db2d7bdef9d93a1895dd94e9bc1f38cd3a4de00fefff0499cd4ef6294cf2416b3181076e12f1c35e28c543a31ecca39d007360ccef70668ee507b4824db2bdd5'
        'e921096eb629082512c8742f346c41966a3ef210e9e8212f60ec16ce7381a796f43d2a01dccd4ba9bc3bcaab7a11e28c0241da2d5b8a22acb40fc4558cfd51f3'
        '1e515151e9fdad9c5c4701a496844e60abacd149abca2a329cac6b9bd33d22528ab75133478e32fcb1929e840f83ea05ec6b13fa014960c4ab60ff10ab8ab8bb'
        '8664f819e0597bc4117e80b8629fca3751732d25aae0b95cf77015af23bdf8cceec3caaef7d664b1f4bc04d6254c5235b6b8a3e31857a14395caf49e35cf7668'
        '07a07077652c776a31bcd05f3b8db4f19e6f5daa8a281f6e482215d867dc05c73d71299fa8ad3eedf2e92f08e91c2a13ce9f5a7aa38db2b82bb29914e36e94b9'
        'bddf6f62ed5edfd47860f3afbc7160810fecf7d22b66b2ad5dd5bc82d610f9dc57af776a459485ae9b086cfc5797dbb3403ceab629aff56cc0e4f55ce6c4506b'
        '5e549ee7f80f974619f8ea1e8f43bb567073d475267e10cdd1671db2d73a4b37b6df38e0694f20b2e234a98698972680144dc892426c1ff885e928d8979ecc7d'
        'ae328bf4b53cad10e9918f8620f4e0e4b2c9d2f696ec8fcf3ba9fd6032857aed39032a4338a5a18a9377d0221505ef44a772dc52b20338bcc80e8d73411e98f1'
        '2dc82bd400cb22576ae29189873b2e0359dd0ccfe4ec7cb765e3985b07fb48a2d40e216de31c12caeff6e52fd46f1764fa75cd13d9a2c1db4c87b87d978d4366'
        'd1a114ddc67adaf68726bb8024013bcd3cf027cc12468131f684d6742ddecd1adb04e77bd101168b2783f2cc7579daeb6ba4217d56b803541e6e9c9a48aecdb5'
        'f559b842ecc591edb2dc98a871dd4e5a04cea1b74d5beba7a7fe3f32a32f8583f76121e77adee1d9380a0faf5b6079dbd288bceda457b2b3c71773df3ee83446'
        'ac5353d4f93c8eec3f132001c5a919d69b22eabaf07f0b9ebed5bf73ff01e4a62b1c49ce712bdd54c9a64383e3ffcda34a95d9a5241615b2b6e79aa6cc3fd14a'
        'fca3a6ced3971e8fda0e3c8efda6a79eacc372b8077e3825978cd8ac03bab54671a6ab3ecb3bf2a56be12ab7a03afca82fd85c6525973a77481391c33e42141b'
        '19900e525b1e307fc1f2c0440e911c9948d7826e2dd147a0f787630569518e3f992f93749305e1fe5c52dd9860fb7d77fb9fcf0ae6785f400daf642f2b2eab4f'
        'b035237848483b7ab6abb33c144ed523e8a794ae69dd1c1d8c327a907bbf7b1c2a7caa18381a7b44d9fc69ad09dd0fe0e3a53ce3c183a54f1f1b96716562558c'
        '20b27ba24394f8b9ea13ccf9139276a80d47bd0bff454c14f991e28dce1973499890fcd8699beefddf7c3b2705918011578f9f89976438bef412320aa54f1e0b'
        '7405f22f605ab714ea39361da6514ab7e331eb3f802f44bed7230153943280493194b7342b8ab1c122a6b755e7922ff7e2b38acd69a485a1165bb9dbc5b1f235'
        'b223dc143cd9020a68d1c26bc93849bac5176ca71851fad81eca9aad4fb120e9465c6f7df249170627aa105e6ce2d4836abc6b3c9c3aa9f5dc11be00a01582d8'
        '87a54458467e0b6b08449b1c6e1285cdb4c163be4117c3ef90d3a6f89b498d0851f9975156edbd0b62deb56e51ef88f255a63ca3d757c6528f59f6ee5057ca6f'
        '7439024e7b0b081ffecccdc87f00da22841301a8d1ed0fe2c225c1296f613e62af03fb0457c2cad9b44744a5cd0f0791e1b8660701efb6307430f4c9ef301c95'
        '5f76fa6068fa831183cacea488327a121cf2f74f44ce838690b998460ad89debbadd75242ca0d6c2740df7310ececb9223e9a36bd5933a9e85357d5ed6ce15a6'
        '0cf0a0a7a2213341228aedd025a164f0c28d877c96555f8d266b6d50a318893094ea4d43911dd3d6cd69bdc6b934cd95e4147bbbd461824de7b2ec585be46afc'
        '78daf6ac2e7218300e857ab3756881e2a5f652fdc705c95c9c69ae9f2cfa170fca313d7573fab97509ab9731b9e05114785e7741e1cb545258d21b796caad6b3'
        '2560dd42d5be61dd02bc66b4709d1063a16d374dd96e348f8546ae55348bcd2814a1e2540aa03dad304ba2e7d06063f44566b139b55ad17b568ba59238c7f770'
        'b420d16bbd385557ab346cee23b97774beba0333cbf4e92b13d2da818cdbeb36751d8aeeeabe273445c7d5d5031cb3d4132a6abbe9eff2e2a2ebfd94474f014c'
        'fee926591fa7b326a2fd178a6c609d41ab44ed927e2656c8fbd72f14dc1ef8ffff6e9e6c7f227486169ceb6d4e93eb2fe96076fa697dfbd37b728ed4e5856d2c'
        '32d4a71364a2d7a3c63132014785ff4e4fa12f19245b8c2b10bbc337b6d2483658f094fbe1bdacdf297ec53ed56b23ea184b52bdad1651906ea7dc9024579ad8'
        '35a611ccee42e77631c614d92b7d3d409346bbc04ca0b471dcde0b6abd9cf8f627d43851627ad4c06d16b4a21027428e290730b8965dee59642eb913ea9bfb94'
        '41595ee301154a3674636ac628d7e6151640299c853cea9dfdc5d8ce048875b01bee04f93babbce1994151afccf73b2aca0fbd96a58f6370130cbc51f06bb6d4'
        '0ca2bbc278331eb7d8592fa04d7963c27eb10e5242731c058ec92959aa48ead870877bd9dc0b0cb9e17ece995398d2a790774721445e998c027536ad2f82aa72'
        'ef27a7f632342806f12afc747973f89e969ae6be8ecd08ff4cb453ce171ff3bb612b70ff8cfb79d07ea1ec541d18c1cefb7422b42b9365ce4e5c4398a5a996a1'
        '54acd230a360cc50660f19d919da75c323d667f2837b6eaa83c0217c74ce1eecea61ef0aa5e59410e6ccd9db3b38660d019a275f53c3ed534395b5107af9e9ed'
        '889796fe501e39e8b0933e3016e87b07b3ced0c8ba6a85a9d2389ed30f58f0ad1f02b1c3812b0061fe6ae69047d8e3a7da0f0a77e4ccf79f826b5fb33e773e04'
        '903f169fea77f791301259925c13fc85beca31a109019dcde863455569f074986756da92573d50faaf1bf8bb2e6cd782458bef8ed70077b0bf6e5f1dc7a966a4'
        'c406fb5a9e622d0db597c659b85d76015d98b96b808d43226bcc512d2d005525ac32bccb76150cbb45f7b5a016b15163bd6d1ce84276d1aec502e92b9323ad40'
        'd96e5f5b57a853ea263dbdd812c69f6ffe98b2f7357cf4d45415896be9530551eb90ab080f4d8640324f3541db3e85db0f88a9983a4871e8ef7f4484ba070423'
        'e254c9a26ad224587bd3911a166f9a668cefd733dcaf6435cb3165cfd3c5db55b06ae08621302cbd8665a8425712789b657024066eef9cfcc36b9e536540b044'
        'c126ed0423d47f452552aee77c752289affd94ac1ffd5f1215f1aa295f43362d462bbd6056a2e4f7bc09bc3188b641db7f9e71423dc0b514a5720f313e9e573c'
        '40d0c4741cd6695e2bbe228a271fa345312028a4af0c719c59bc515f9827e6348f497f1fa0435a6dff60dbc1e7c934870addd916a7ecff3e64174ff203cdb951'
        '3ac88b86e37a03e1c15d293f468fc85aa9eb5d4aa3b03f2708583d993d1cbb4f7726389f85eadbae54e1c7ebe4e4488c053e0decc092e165f574cf5e11949a60'
        'cb1733e653291f878958d72686262f65a4215c67b97cb561c6ce72d7e9bf793676400353c8485469a83b2c32ca9942c83dbf74df063fdcf9870dc466d2739743'
        'ec6bf5ddbeefccc354236bc57a804f8cdd893697f1e9d5b6c2b36d753f2564e41746c6b045e766d0f3581fffc548f01389081d48ca69727d5f7619bbe4686236'
        '0d13b2b06d410bb1bb7db20014a3976eaf6f38d3d65288ebd712929ef687bc615a00c7c8f76ed4b13caefbbdb8743dda4d2aee9e2f7b0cdf968c0efbc99cddb4'
        '2e751b9fe485160b517e8aaf99c1db56c9a5e5c0cf57ec4acdefc1e6b4bef363e8f0e1491a6f4db0f72c1bb603e8f8d6d39431d7816a5e3eaaf5c86aa1765070'
        '63fbc4645bbf3ed3d21c747341916378e0282276b49de440a382961098492cf3479085f7e979807646b673065614dd6368eb43b7953f85f2f10b703d68a548a9'
        'b0923fdee91ef8c94db63e8271b55f77638bcdbf97b0f1bb842ed97616988e09cdbbd0768953a7bd8e901847d4e03a6f75bcbc445ced2833600b57b79898b146'
        'bdda39674abe4ce63d9fbbcda9e48ace2f3be1465abb4d303804b5c7e6d0caad5c3a51373e525b3dcb59278fd09e6299c60f071a4da3d315ed8f7573429ef373'
        'dac379c074a874596fec2186736c2803c745dfb53a7f70f5220486e27bbfcd9f311e229828ad33ff9fd7ac610d310ea5ffbfd94bf7dd0987056b19b3439d58f3')

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
