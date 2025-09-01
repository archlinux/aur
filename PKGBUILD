# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=25.04.5.1
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
b2sums=('fe5c6fed67dfca09c4c2affef55e081597b5cc85f8bb46e9424d113e1bbb5afa6aba65955cbbee094529b0ab5e17301760ba94353fb05c21b5b12bce03790900'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'f6fd05e85fcd64320d127f0e22a3efed46fc4f0799a9028befbded657500960c29ea362dc2190f82deadb50a638e0290443b08eadf9dbd255baed53fff40e28b'
        'bcd691eaae58a2fe985b3d1ecf2b971a5fc1f9fc1b522a8a386489ffe0f4e2dd010062f1137e7c46b3e05550f8982f4cd5451b3d2355a79c81d0afeaa45eb2d9'
        '8c9c0efea2eb6e6963dce42a7bfca5a5dedfc1f43c68568989601a32b15efca4e6d3470664542bfc7751b1d77d794d973183ebb339a94dcfd5946cdd6bd52f04'
        '079c0011c21ad3bc0d9a5f56f20e1b813da1a526f0818b11fa5a62039a4eaa5e220bfdc94001a0ae219ad4bf542ff7ff4038f60a23504923e7404881825d1967'
        '761b5a558d148c89dce15d2ca8609aad2674df81660cb6f9514bee09ab209c7c67769efa825a34a6188d7fb420007f277809e3578d7e7b32137938c0b17e6841'
        'abfcceba4edeb5bcc41bfe08c94ffc354a46e6c2d8416e40cfb35eee802377c1105900b7067f43d851d3552dd47073e4b68bd06ba682c76e0133cd294994415c'
        '0f462cb59025d4c292d083538e887a2cb305d845f09636d466e9686c374eb43fdb7575069b3fbe38e710b0f98cc72a83bced55e4cbab4f3bc624bd07da4a3261'
        'b9913526d5a3fde1abae98a272badfe07356a959d235d66ed3b0db2c6fa470dc55b615a127c132eacb08f740daa9747ba78148ea8c52b341d1549ca8338e7477'
        '2b3d809ec494db94b55dad2724fc386b25cd7c8c1eca2c16f3156739e52529b02cf2fba7f9e6586c909cbd6e262c1e6ecf843b68ad20adb48715dde4d60a67b2'
        'da6a2a0e8603724ac9a889c814da2530bd14c00424fee909f24d6f9e2056c0c5a365f494825a11eb048d5c2baff5fa7491ce3f5379e3acaa4c88e4615aacf396'
        '8999272a93b8c1a5608eca168e717d985d4b4f25d147321ecce6707a94ab2a834eaf44cb90f8add7603a3a69ac5a14398a4b4b0390f6172f5216c088a16f4048'
        '8dbeebebdfb835c70a83ae642eceb7234eba41976c5ab5d5e971358fc04f458766daf8aadeebbe8ae260e98066a07e6a862f20b7ded049da01dbc8ca1c1f95a8'
        'db9b3d246f0c92d7f5e1a1479f057e45ae550f913eda181f2d00a8046ecd8ed22a39b9280c8c160beef4dc1a94993b3cc7472f18d3c4e98f34dd64c8f55d6c1c'
        '96a81bd3acb21c9f48cc07eaa3709e93ea3e6b2d4e0d817eb872107a9fa21478195b6e3f41710b084ff95bf282e70ee721146bdba8368427099221198568c942'
        'ac5eff22c6f7e3d86f73325f87e8081f6b694079bbe909e1e9689c32af93c495d4b3a4295bb2068d738c2b945b4cdd50ca944c3174565cc40dcbdca811e7a760'
        'e69a62078390549e1a93d50d001fffc8f6bed7e199754b608af8c0540ef21ada90f3be9893c5b6d380e895ec585377260a49a575e779a67226fcda929289d0f1'
        '75af30922d358f20630ea01e6dc1571e475b78d5a45c489f23cb05ae47d379a4f6f53b0b6a0893310596f9063677c42773c2364e377f6b6faab0682f098eda1f'
        '081924cde0236e7b9ca4fdf855f358ed1a2c7e7e38fbc1fc93301d9f3fe762d4aef994b09f4eaf8a7aa91eb1b74b3e0c1acf93e9c6d3bfce8e8106e87757660b'
        '1f3df48d81423546deaca0dd7f198d60207130978fef253e4f52b123c4d0884a8ecc999a61fad92d048aed35e1144123e0446904be74edeec4a1f694d4a2ecfe'
        'a9400f8c7a2f930f929ccd3751ab1bc20d9a6931dfbbb5cb2fe5923d15f905d8b892aa351e21ef496778caba0ab4d1e0c1b84028a4258ba94ef8d014a3f88c71'
        'c1ba347c97bed7e75056c6d58f001c219d19fdb931fcc1a6d8a76c931693917bc4b2d89f226afbc6c4604acb3f20de010055b1409fd3dfb225a4750500e3f9b7'
        'ce7026528528e37aca588a7cab86a8853944486d6e970b4f3b967c8901d8fa6fe1cbe810fccb96970c08bbec51746716404f0df14417c3927c945ee09067b144'
        '0c9dc66f786ca28dd6738a0adde1069f0c71ac95abb7961b53c8b7c2846a535ff3a7b5539050fe508f9b16acd078bb36998a90c734cb20b50a3e70da93cb272b'
        'db28a263573352aaa7a3d5af58dec804421d70e342697b7a955d7829260d5ab7542b015613c011202fb5c3c91d2604f24a75efa8447611b75e8e6523501cae30'
        '7e044122ee2f284a2f71e7e7c645a6dc2e3d68f94975cc7206b28af2429e22094e48949452068136ea3bb11f194c4d3baaf44991fd0f6e7b030fae1b25e42cce'
        '88db6fb1ac6f6a89f7b5ad359526ab66c0ab41dd8e0892b1b7f30879d6a90cb80f0e8a0811d0f78123a8cf3ad4f4c2810272d070eba026d013d41b10273ef70c'
        '51e1734b061dc8acadd120976a10288794b0e5a15971577fdf665b2df88ff56022b75b103b402c4166dbc28a454ed425c5581b9877fe6a3d3a49335b01b8db46'
        '90e16bf58613228f030a3c3b929f3744237f3cf654520d4e647b1bef3e4bb21a3eefb2d873eaa4c2ea0dcf9e15dd1c1a19884fabbc9bb917b7536f81f5b0794d'
        'a5069f9088b7b14b4f7d79754b261647ce8065ef5e08517d9afa7c97edc92752c91e251d345e22697d2daba9308200727385b0db8fbfe4c797cde50d49a42cc1'
        '8914601513606e9d31efaf01131b909b4b72e27e0add98b7b6adaf35a0b1db587e7aa3b05ba1915dcb63fd20468e47f4d66b3d8f2f80fbd8370282a3a309171e'
        '54e113e0fadb747f711561713e7881ba275daa09968603bc969cf795412e11be2b89c7b444b01fc9c35ac8b9c78ade0fe915cb9c84b6599596750b8d2a3b0d1c'
        '53e11ee5005a184c54901aee260b4e2159313a184fbe8714a90e15d4822c41fea77ee3d4f7d6e40bd8fb9c67257fa03aae75102993bc31eee0da274f1ac87d22'
        'c09a6ae29b9493a87d986b7c1f9461eb4f3871c3a20e753f2f79d5eb6b650edca27eec3ef120e6ddb3270804f84f71b7616b71f71463551fe6b1c28516942770'
        'cfe282b16037d4f2e187200c9114c2176c4f3b259c632e6c5da996038b1185d51dd468f2ba1da17192cf47567e65b4150eee73077d2362db6c9556f78fb5edfe'
        '0dcd5353963e1dd2c0be0635459e7b6f04de2342103924518c8b220f131a2f1ab32ec06ecf6fa9ccdd095aefaa99da51f6f982057ca45defe922cdeaeca72a64'
        '376ce370f09c6c177d613aa959d156ac14611867976a419b222847952256a81ce8a7917df00dbec1f8d3a404b878535e44e8de3fb57cc312bc9e8308454c8cd3'
        'f2a0b8651382eab44ff6a201a4fcf4d8bf4d680cf6f8faa63d9d4c5d1ec4c89af453ab6094d8fbe863d694a9c47845873a3562fb146c44928c3478cfc9260145'
        '84cded4c166c3ab68c4db593e0f24e9f5daceebc7c1d8ecf7cee1fb5e18e3c1278449e94168cf36e7c33f175216b8fd68ce35d0351120d9525aa6d0802dddaf5'
        'daa210e6da0d9d958512e0ab8da675f81fe29d28f023b378e57ac75b424bac2d1dfdb9338f1607e0bcbb9c0c2796b06b020867940710e4b1d9546d51fa7958ca'
        '38b3445fb92a31ec9f3baafa4a5518994c89f03dd9e6c21fff9fee619f0d12656d3143ed9c881b0d7bddeb736bb256c62f289edf70f98283293d0d63e9839e98'
        'b355ed36b690694d9edf13b40925e53def967c45e6b151188fbd9cc774776c035059aa8a688aedf3b1da458503952950ff1287da1cd47e20a6651352d449d6bd'
        '6a151e74e66479ae886e4ee51168642086904894cf0089c27aa14ffc43d05855f7d412bfee344205a61dd27a92361fbaabc93ed8f813a703f65ef5c3b229e5ed'
        'bbad83f0dbe0380e3efab9e8d598ad4357fb6c78ec2d9b73aa99406f2971b118e5223c277f23267e0f819d8da42ec7ebe51874e40c1b67f987925fdfda6968cc'
        '0d534562be5039672d9404bc354a8064540a3ad5541514b04a856f212bfcccb8859c4e949973f608417711eaa5ff9ed231d725220ea3f8229f13d518c4fa61bc'
        '1500f542cf3db2f00bcfcb4df5ab1728eb6b326ff5eea09714075a506bcb29e4ce4b56545170daa539ac4b67216a0686e2b77e2e28d1c0a6170ecca2c1943730'
        '282e79134f7f7f01e530f51ffb9bdc9670ec361049ff133152e1935ac49367d623308360393a8e2550ab08de4cf6c999a22def2a971a3ebb00fe3d038afb480b'
        '1c56550a3659322e0b14752ad52ab4e9dfab1106a6c02e9847c8c5a35ba7757ca83fd37ce86ba9e6100ec9e1ab197bf0b47c9653c4ecae7bc58079fe8429555e'
        'ea4aad8aad0ca85bdea325bb59ec5002e87125a711a714c79610344717cea86655775b035d6b927c8a9b3367fe702292e0211e10268ed070769bd89d49b77939'
        'ebaf8e72bd13635c335b0a3150fdaa5d7dba3fd3e77c039f5868c1f7ec750235d25ba5f10a71b919c45906fc65e4dab6e022a365844644a0be76ae40a0dfa392'
        'c585c4e0dc9892cd7ed9ccd528bbd35d8d5909909ba03d3941b2c1387778a9f193d6b1d278f7947ffe62b1045224e615fad260cb5af751ee3e572df68261ac51'
        '0b68c1b701329d318cadd5de8298ef4b676f54badd3859125b0ad3bcbd76a312bcd23bf44575dd0620f51bbeed2b33adc14a6d5f0d0c5efd79b0f4ef39fed8ce'
        '4615a90b80f4026b833368c6e5d13cae825638b9341ad68154293d2536ef8f529789b3749f7f6a8601f7633082507ad85fdb27aa6c50b363c6c264db5c1bee7d'
        '30874e62b2f851167eaff80960729ca096f6774a26a4a81f46f5ac15a694c66d0d9b9bc388f9a7c9975ee2c27bd317bc6dc3c8c877335a78f889cd2269f22669'
        '64c59a75bc52db5c1f14867ee7dbe3e81657b795abca95fbc2e96de6841bd20975200b37b67b8c40358b58781a6bda9b80d0b2fff79ad7c027637cad543e7dde'
        '3ebbe101febee057f21791a4b1256d4fac05b18c87bf4f5e0c84bfb6fbe88f8e1969630d4abcb1b27f2ba78bff6d535ca506007090089fd7ea26dc03dce0aedd'
        'b8b69b15cdb42a0b22a08197c56882965e30111e4f62fd8605be8152058f33fc6f1ad07072f6d34a0f47db72adf993fa43f5237a914205ab6cc8142664c4f391'
        'fe4c89e7dc1e23adebbf2aed386218effbaf9c594ecb56a6d8d5090f1b419b6654e16c64ec7fa378942ba3a1d691d47853a34d2be33c8b255088ba08ebf04e8d'
        'c6bbc09958f2a115f9da59bf7fc77922af772dc89793db0b6a83a5ef6f30e6630c08a11e7f9f77e65b2f2dcd7ffe4e0d08c7cd6cc9e056c163a03090b0784604'
        'f8369469808cf735eb4ceb448dc2898700ac5391dbdcaa0b794dc898acd0787bcb33d7d7658cfa9aee56239007e94f98fec9ce210aa9f0daef4f97e4fd5991da'
        '4ea1db177fec110e42367b3b9c9bece3d5dcb2d8a0e312b6a21b5cb28849910b1ef9ce7a07c27aa6d4c776615d5b41b1ab3e92e32b5b4375ade422be0bea4ff3'
        '5d02c730d82dda608a030642206a27e5d47ffac86d048a0084ad3702881a48ad95710af6723e39c67276867f67df34c61ec639f8e4ba3cc492447dc26354514b'
        '8f6c0526546065bb9df228107ee0661736faf0ef2ea7fc9ead415015c96c70f2a1bcce32f1016bfb76eec928404befa0826428a174494ca2806ffa4ee67c1d0a'
        'a374cb494eee46391fe846923b451c4d9126a98100b7413f229fd34d1891ad8510bc74e987ffe062dde4cd3bea1a3d4240a1056c906681df4ca1be17f4ff80ee'
        'ae7ce362b913334c025967ffa5a300ce287be3695c533ae106461fc3bd945d0c72da0443fafe2da8ff2e45d5a122a9b4424c6d4ef211969282b137a942caab2b'
        'b18ddd1acebff444acb06d2c2c8b4d9008af69d8d076e5b54d54c4d3c12b707c94c2a633644985f162b0b50fbc6d18aeea2b48876fcf941f98144a3ff63170ce'
        '1be09cac62f83e5d0a5c45eb0826384283c12c9ed28df46a840d0f2e379287046ceab528593c7f67d4b27ee653c1ef2cf0577b50854bf5913d1fba605b1439bf'
        '8b9c520017bf2ad69e6887c8c9266b88c3a01ed9a6ecfdc7fee2002a8e49f17706444e431e010f5db5b2fb470061b9946d151506bccdd06102b390f82369cc2f'
        '558b6ee4d83306dabc130fe38d6a4ca5841ac5d20c3a97c3fb82335f8a4b86b7ce803c7c43783f17a4f7707b2fdbf6bd552c7a35fa551ac8f998fa64597415e3'
        'b351dc08204504b69afea93841527a1a542ee57e951e656c3285c2d8242f6baf65218f73214b2f7882b8972ecef39f12cbb90fd06ae4b19561efa35697c6e60e'
        'ed7b6efd721170be37114ff055a126a5b9e72057c21ed3b138c5b055499a275709b8e1bdf858a7066a355de8e974f60124ab3d831af56c0b55a3696f2dc6c9f1'
        'fa76d1a5094c4883a48b8356c621277c17fd6af38f74ecab2de26c8277b637828df0519efedde05e7dcc0c216fcd05817808369b0cb28d47c762451857520143'
        '2b5fc68533f83336b090fb2f3f96c567e3be5dbff933b6dad4cdf3d7268bff412f43a9997df72a45240d72d0b5010f2e7b374e3ee835f8d38d9c934a37525095'
        '80c771c64b31c697569b3b3e667de4f39d7756fb4080a77d713e5895dadd2f8f1d50535ef8f0feafe4daa9c98f820ab9287055caefaaf8ce0ae563a287533943'
        '9fc61c69939656e2b4ac1cbbf288267f82927e39d3ec7df36958c78523f8d67f9957a725bdaacc1b2a938f7e473c10c65f693424b64547a18d7c3dbad7ff2d20'
        '11e3516e403c2fd61777d4abef08cdcb5aadbe02cb5dff16bca60a195aa5d959fd97f49ec6778c237c21d07b029ef4eb8e4c8e8bed4074e6ad8f7b779a8a5c9f'
        'df06424552928c09db5191bca2f0c8a692e398402ce6c838e24fd6824b3abf47860c58008f4c819a9938dd4cc557bce1dfdfc45d5c063885cfe738e5e723e85f'
        '32d23e499f2fdb00c8929d94489e7e70d09d47e747b57d4d144d070cbb96a41b59442f30ba99862affcbf00676572d3ea525745edaa9c454b5f6f9677d07ca5b'
        '3237ffabcbf3e4a92e02d07e5670ab20873712f475b7b8c4887e88122463d8e9189978cb7bd3fb2613b1c4cabcda7d759b421cb200a6fc6a1ff82a6ce5a6231e'
        'b1595a031e99a24b3113ef78c70b7444cb021cb07debdea62fb97c2b1802a69fd9cb60fca20910ea78c4f6b79ff021098aa86cb87a3743c8c2297399f8465896'
        'fa70485ce7c506134d8031f24bdfed8d7df72f713c682676ed4ab584dc302c42ddc27b1f06efda3aef6cbea4e5d30e1dc1d5e65499c04714472ca611bb98c594'
        '411a5eb90b3c990501b9aed595ac0298740fe11d93f3d70eef3c7315ecd3ec9d54d4f3ce9c787d69af9bf4889db30479bc6ee8d43c53be6ade0e7695e3723a8b'
        '86978207f0fece614d867cdad58029666f5f5fa17484a7ada48e538484448797547c9e720bc82a4796222a4ac71079e02e2eac2bd813ba5a37918256e88efcb3'
        '5749561bffcf804ae8b312615ba347ef1890914b96bcc4e083fb41a5893741dcabb8090b7a930bcce75e8ced728005d18b730723f1f13c3f07d3882be335a2de'
        '81744a78ca7be207350a018d2a63fe60a4146d7bd7775501f03ef38d45ea39933f1dcd127dfc85be48c12d3ad2ec11a031517cdf8617ea5fcdad3c75dfe525ca'
        'bafa7c592339639fc46a3b113398f7050554de90141686a38a3bc5decaf71a3f26ef440d19e64ea17983d7cb616a9cb2e05e38ad58124204126231b8b5ba7f69'
        'cfa9e3e8e8b41fe06c03869274d2e7ea7c831958322cb15d35d9a92501341cac1011776b1aa62e74e514f6e88c513a7af942c4d84094c17f5eecaf39590e377a'
        '931de6b25dfb28f241c4a45dea78f3a3c965400794a196cfb508bc5be2dc8660a345d915f49d0bca614e2cb9e4189cd072102946d9046b1498ad2d70ca835059'
        '3697ddc280fa37fb5378ba7479779ad4ca104b318bdcf7c0fb380be6b98a81dd066d9083b6b9ac0caa9950813168282038dc3602c6680f13d5e261d723d67109'
        '37b1c91a2706729eb68e53c95e1ab85684bff2007a860692610fd4f4b535ad8abdb5a28c8b627044bf77415909682dd104207e95a2990d9f3676912da70f6778')

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
