# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=25.04.2.2
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
b2sums=('dc75e2c6dd284677266b0c309e403acf52f8a4172bc96af7cf622e63f2a988f3f5b533ff333902f023c8c6d23f0f6328d1fb81405194193fe634d5aa0e898245'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '8d0cc8449d5b0764245993cef5fe902c96f8e8c6f34e46b5416d75dd70b9fb7db896a059c881a9e993106ade32195180ec2118e8643b9cbb0cfd1c5384fb7136'
        '60b42266c83ccb452a40ea126f14fa63ca6a55d4b7eea8d7520ef67f0da826f0789b186fa9f9f41a21543ea3b56dd5bd6e798dcefb15bfb7682c416926055230'
        'eb454208042d39d1498da41199feef67b421f659dfbdf4e4078112c1148d2c2ddaf958731bf4a05b62c70ca9b046054799e8e0e1d1f894386390cccb410d8a5c'
        '58605cf03cc5237463abe48f715a6fdf529a548143d811106e7d70529a2acfb47cb98fe17dcb4ad13adccc64e275a1f00b67f009fc5f2207bf58c564ac52bde9'
        'e034af975781ecc92285f440f13cfd0625bc2631ce16acb98a604c4ae757322267d821d1759d49cbbd82e44e3bf8ef9103491bbb2f15dc7d52231ca77a9a9b72'
        '45b32e4d3c2ab0e46c96e511487d6ae3d0193e6a44f9361deada5dafdad4930f61fb337265e9528ceefc954548360bcde036e0305c8692e16b98572423ee07fb'
        'ad24271126242fb9acc95a8e8a6cef1b0effa162883c17dafc45cbfc4f51d2007def3d3a7467021309621bec5ea4793262154f1db84529c282979266f4b77f97'
        '824af64b75af143e383401d889b4d1b1e84b054831e7452555fb29a30d545c022c9134180d4205ac0a381a801a17d0fb59bb23077ceb880b8c9dca44529b873b'
        '0e4317cc56f79e8a8cbe648947051bf0f153cdf557d73dfc02a2c4ae628dbdf26dff757a0a1a39bca4b8fc331dfe9c7add22379117983e3e29d6e54024690b6b'
        '94bf148c1e534b38782861e212da5682a439c9f8ae6d84934829cd238a6a15a205c199966af3d33adfa6c476c20578d9d0266e513c6f5e562005947ad44881ca'
        'c4eb1afe6d5acf37aef6a560fc514d675a8661f6e2e8e316a8b1770ecd885150b2d21f9fb13c4ed1ba7b42c375ccd5512695fb39c582e1f40f78b6d44202dd7e'
        '52349c58c03cf166cd04bfdbbe607c91cddf194903be78cad4e9cebb7f29a95f3abb22acb5a758b7b6cfcca0872b2cbab09d68d8944eb228d1b128f8e180fce7'
        'fcb41ac9647ce5efb4a342fd11965a6a6be4deaa8252d226381fbc786bf482aadb15d8ff050fab4754758617e7441c39bc8c97db218b52f2ae3ee50da11590be'
        '3d7fdadebd07c7397e7e8e88207b00b86e5c2c0af1988fd5bb59bf8d79f13d858e49a8a4dc1d18a8e264476c833d6beba7e6673c2eaa40245c4d84c308e28e92'
        '05d630f4f75c630b92d389f6a71102af270b6444f70775caa301df63ac7bc6be639e8cda11eb5a05c933788490db3e859eab02f87efe90cad846871bf765c7cf'
        'b7e66ea91fac1c6094eae0bed22bb14ce8f2b81cd3428931ced6c25fd08f14df89e33b24e72718d2b6188d8debc38742ec565afb0a1af6fb6ec7e3fe12d08322'
        '5cfe5da45d4c7f76b621dcf15a5c9e243ac153fa12dba204596f865c7f06cdf84a0270a1f5f2d2296f006e3ec320a693b2a9def202fd101db33adfea997f9c5c'
        'ce06f12568f492c39dfbd35c3f5088d3b089ef04281c64aa5f35d9f1abe6750bbe3f107a24bbab9297ed6af5cefd100fc23b585fcc582ce34ef8b32322328e43'
        'a84003bf5d3fd867e95b612f020aa9a1f7a810b9ce2eac232d47e392d8d43e82c8ddb12d299b958a791a02578feb0857631a59d2fce9240ddae41ed16d940188'
        '40c3966d15e59defb2f1bf4f25dad626864b232944acf4a76560a5ffc178c3495ca86425b7ca9f2d6780bca7da5263ae4442f9a4208bc64397f29e59b1415286'
        '484970c117b337d392cc4e05af1c6a7717305d05d8b2e473bd0d03d64fc56c09e6d313e18ec7ae3a3867d3faa465e31deb9276b0742f4cc806bba0ee6176afac'
        'f7f813ff4551219a86728d2e14ec610731939f9d0cc56397abb8321e7149f52f7267621f84b9c02a6392ddf819c38f57b14fcf3600adc99ae3ed1cc17299b6d9'
        '7ea166b11c6d47ea90da1a8e7aae65e1446375b272aa390a8cea9dca7ba94d0901111139d0f6d1dab00724a4eb190655e7563688b505c5fe699374d17805941f'
        '9051b3b5ca8a62bd6486f63fdaa38c413d834fe2a34df7d9bf1353168c60ff8935fc22645d1315fdd93b0c4f4bb28d6a64e4ebdad53bd1cb25529283adbdbf9c'
        '853a0f0567cf39661c8f237e0996484fe6bd66d148b7c74e3f4ce501eaeae025527fd50dcc6e50cad1bfc7b9b90493617ed78c945ec6d02f2605fc09fda4bf1d'
        'ece2b017a8c69c184e7a3d96c152a93fbfcfc007bdb479e3af3a4f11325f546e5284c20d1b75823edd13abb16ce4c5d47938e39932befc60960b477bd2b81767'
        '5e14120f93a1b8e8beaf7ce73db58fd829efe23a10264f1ab12596682543a7e969dc2438eaba79308ecd86b2f7cb2a42e889f959a8e1f5af79fc9b86ea865618'
        '22b2825fb5119fe79db9ae512d70f1465ecfe8fdc989435d0f7cffb97e93225040cf7df0c67d6a2d0fa7ca30ff41c5a494dc5cc1bbc6735d843e7a651f35d41e'
        'f3e75ae3501b52c1766aa5e9fec358f5e94a5c445dc8ee4bb6bde2a67f28173ca29c698a9170bccda85ea67b763427f2d2692e619c25bc4e9c8bd0ee74b047bf'
        '46d5682a951d72ed30d80399e9745e86529ad312417045a319627499b78a41fcefdc491f9a05c4c4cbf8538645a237b36df32074a9308000b82512b3b5ab4ce7'
        '815b33c143f36db566cac4b81719fcc0c6d524bf5aa599f14398cb28544af891e247e3d4060d5757d86f7ff714e5a69bcd48dc9cb57adb46725c5144fe46f560'
        '9f632483cbc95c75b740e7e58fca2e8d9f844b9110fa9a69aa877cdd8edea06528bfee8fde17a4e5be5524c75d3d8c84f83a94cfe612ee3b867b8b909af00137'
        '9d3c700844f09276215dd268746d60451730ab74b2c05ae0b00d3b6df557eb0c09f36b4857c41fd0f714c08bfdcae09e2570a11c054291dda2db4d0301423eba'
        '87925ba19af5aff40ab4b7c80bd087590ab5c95e833bfc607e82c0a3d7ff1d16c459b2b0dce59372cec3d43468d80745af026d4fe542d4a828e86c906ee2240f'
        'e2751fe77b45c091023c84d54eec2f8b37c7d4808d9bb4dc3aa2ee28e688e7373ce61b0e1f77d28aa50267f0ce64aa8094a107b15f65174369cad14297c36a74'
        '92a8567b4c1b049f457b6955621154c80abe9603687526064fac05c49dd08d4a3cb9a1c0c107a60bb6c39b085d81b45d05e29ea369abbeadd480e943198e3e9d'
        'a8b0ce8a5850ac6ecef01a777bfa6742bd7ac7cbf19a0b3ac59e23c8d75e9567e0d46649af5389d09f53f763c17aea716200cf6eb0cde6b16a0628df54a8a1ab'
        '1d3c3fbb518b04b783310528843af4fe90fcb3d027aa74ad3e1ed367fe43d3fe40203ed526e92e18cb0f8f3f7a842a7264d75c09413685b35ecc8a955595937d'
        '7f54e45d01b63b849dab293d25a47ea37c1bb2183eeaa6dcb2b7831722347916ccaa5ad1c3502f847b1e3a6673d00083902aeb3464db9fec9c2a7b062dce3dc4'
        'f6ef91383f54ca21d62e9f85dd61aac2222af3bc023e3c6a7ca89ccdc7d131cf07bd261e2b2440fd737cf3bf97ac85f791b10a0452a1a037fabd29b5d33f6058'
        'c25c591a5ea1c155c322baa6f9927f582c020896fc20634879db1819a4e70d4ffcee60b9cb305709fc5776e7218a51f0d4947e992b90cd28bee381aa82dcdc3b'
        '884823424b0a7185ba0ef3b0dd36d60d88592ee3d1573af5cebe377a275c924648c466535fe3ec2369167bd338158d3245e083bace8c80e383b77deb9d64c7f7'
        '0d07f0426321c125f47a4131bec340f188905c70fa8097fcc0401356b2124b870d715052f8a43b4a9a807639df8def2bb6157dae98fd39e022288545980418ee'
        '4bac40eac8cb6a04dbc1fabda66960c1628870f7038b0ab407e6b74394e360b961b6bcbe768f0ca54ebebd8c8b96491c47f58bb0f6f6ec98d588c90f554f9c24'
        '4e7fd3f3fe5ae9be3acdfdd5c1e6c5607cda76eaf1a6b2d0e0e5e87140fb5f2c7d4670cbad0b56a5a4e5406c63bdb77c4fcff2abc69de36196e45c1e20a127fe'
        '0a190942549ac6ac72e24af97a24ab56c070598f247cc1ff107ce3388185d76a30db2a985f7f09df0ade9768c12620b79fa73015b8231269b49ec7ce70e8f462'
        '0b95ed483fa8bbfefe6f9ba87ea69202217c1d4f2112826c174ebad0b1106d356b640339bb9bf62efde60d8f67c0bf4e6824b25c1cdd14fd8334a9d828e8774c'
        '987a5868b63b1def89c52b46e55a5377ca543f6e08a8c4483bd4c1b67c7950a686ba69c86f4a33a47613f4c4cd2600daf6d3a29d7ab0e60abd76917100d8b62d'
        'f9b2183a89c45d6cff01c334420f7f006f53efdca37438de90312a6283e9e1544120a1a4c1e58f0211ecf27a01351b141d29ed3ca50aefdee3c4733d12ed1a9f'
        'bc345c2face84e211abb02fa10281382c75e8292bbb024a1eb309012574f4682f64882d5ee042d6bf498586d4164cc154bb9892b3976742dae26219970b524a5'
        '45f9535a126eae379cf7b1828603efbe75eb61e806bba97bd2f01aae026bd3f2a20249f65c8b1219c37527c57483dab33ea62cda127842ccf0b08ee62fd5aabc'
        '975a28237936b7b1d8ccc9239b7a3dd2d518271d7cd8989cfc298edfb85e65cbe4875a77d1f54769f06e5bd18d28e03aa97770c9cfbf4467d90ec55aa7a71bbf'
        '8e2b186f68b7ea9f8b1c9f79e91be21392eb65f65b07e22b4b1ff1654e899957e7ba21be4d67e9259035400eef346b12dbd21dced2c29f03068f733d4e9b1429'
        'f275bef26bf41f89dadb0a177a6bf84d2731a08a1c57b8bb0af735e62da7d296a960b686547c95dac0c77de5e7b25bc86da5d101ed952ccc63e652495a117ed4'
        '2d05baecaa1e8ce764504a3aeabe066212a19ddca07b167dd63a84d234103852d90c378347abdbb0da4e3098a6e11a374150c9355765dd28e1befb0a9a90808c'
        '82b16aef291e2e996037334e10e0039ddbc0d35e45f8cbf021c370df59072e68d8b093f3b7bca346a2075f99687714720f2b57cb5b58c1453417c30dbce06b7b'
        '5dfbc0a46a3fb2698330a90c5c46ffa70eb5d9254f514c79396bd08be3f9d2b7e2cc5b4ccf304dd4d4827df63de5a3b6058c4b48485f161bec86e448a3a8935e'
        'be53e90dcc0f79d16f90c3316f36f29089e8ef0d42f6058dcaf2c2b548a67ec8c7f813f596d128307e0b0ecace71e5c683011244e0c11bd60893b13614ba9955'
        'e2434bf1384373da457a98bfbbca95aa0ce983ef3d96ac68cfb372d90cb9832f526294be631a07c1f22b0a17bb21e5b62b86e1583df0c1b00294f005d0badd15'
        '88c9566a3d5e54a3196792c512f47d6814d8e92bec82cbedf0a68957bcd655fc0d7fb5359eacfdb988871fb50442ad0ece97394a082ba33a2629df6ae1f0b724'
        '0874469ff625bfcf9d5af95cbc1e37a88dc183557061724d325064128953a3ea798ba440d361b8bb77ccc014d139ed24449a23e53aab7a44bcf2427dc700d93c'
        'cfe72cff04364e8e4efffa2d3c083865cc9391d27c87e9c288ffcc2c17b1481485ba70087db151fe0b74086cb435a3cf1ad5c29f88b06fc2a049146ccdb11372'
        '427564ab9b7c8e7e8df04f5c01aed4aeff44252f6d4c762e1350b844d3f66bcf76ce5d3378bae006fc15163b66d0040c7eb0278d566721b073833ce33bd5e946'
        'c3464399b6d2263c88fecefa3c74797cc771ac56815123e6b6e13cfab78886c19459edf8cc01de46b8890252aac06f91b3b8c19c54b5b8630c46d30ba9139283'
        'cfd557e1d784124b79326d313a98bf373a74ee57ae20913f4fd55aa0633e89948614d223f6112ff28bce1d7867f5bdda145910385c2967ca2fd4b5693e56d861'
        'd040d9d7b865015c15178ba0f96d7844d1c222e74638d33cb402fe89bfad8f4def34fa95c5171f783bd1767036474d54ea89466f5df5f21b024080e0b9bb7a07'
        'ec4f7ac98a5ca8d26fff3c3ce365bf33be4513005bd480821e2e9715853c3b17f424f39f5f206ff3a5328c2662bf149f60d048343fe20cdab37f0d083fb86b21'
        '55679c8fc7a7835ab63c06bb18d53fc36d76e470378ba788b298b4ce6b1e6622f8deecffc8268d5b24d94eab97f63317dc8b4b0639722addbf15379565d7dd8d'
        '73f513c7f61a3fa61542b25c4ce9883b79b82ae249e427578129fd7854053f94e8140345ffc378c628883c1ea1c1bcf012ebf8c7f97ba76af437f0b5ba0e5d0b'
        '9d7a997a35884b46543d6cad7c3b780dc912f4a8bfc1b8af70232116fe2e591c7ba7675d7a4bb97f602b1cf06628bccfdce50a11d6c79781fd193e9b2dbafcbe'
        'cadda5f856ca32257c9ea07b3d2b480d48145b93e42e80f41fdccc9107753f3412140abe1a7bb5c36670e75486396c53ce8bde5d47168ff987b00a18ad506cf6'
        '51f15119cc38a1a3e00fda465014008da6dacc526d0a440f336c0939640c2cce664580f68da81d6618018c798a98baa475f70894b46ff418b44f38cce2ce5a7b'
        '28432b8b798999385aafed30195c1a037c2627f4c87d584536cf022be5f6f387e97f644799030526ece043c8c666050d6289bb0c883d30fc8ae6e6e3676be094'
        '9000efcac58782068e574bcc2b96f54429eb2a3eda9ad2002ee482ffadc6d9f286f3ed4f6b49b8b4a578b7cbd09af4ee0f597cf5d6d3b99d6d37d6c3febba12e'
        '9a6d9627dd51383535dd31aae9a09bc59f40c05faa96cb74c0eaa31ca4a691029903c9de132764a03e128c862b2e55d35dfeb22db92a94ecf4215e61ea4de268'
        '8173638d085f1f8c889d7a39d152f132c07bc61f5dab06b9889618a4701438fa1fdf45f71159682087174d999d6198d8e0874cc566ebac2677476066070124be'
        '2c3e63e18cf190277a4f99365b88af7a7f2d0bbce79ec440ffc3beafc6f8ab583d17fd236ef1c850e7fafdc72f83c27cce73eba662662c84eed64d11504bd63f'
        '7028ee9df5194e72367803de44821b244699fe8055601ca3759a133a4aaf418acb0ede7e8cb95d0e281a784ac796f56af925d0de6cebe2cb8a592ef44c8b31be'
        '159f3407e544edefe345ca4cf095cc43473cdbc083294f2f42f15a2facbf9b9b073fc3fd4745c0b70a331854bc674cbc9bc55ded46fe887e20280651d15e294e'
        'f86526411c3f7976ead3809d914e8a0ce1a47920b3a7e2a30b43b490186494763de8d4491f311cb3d17a57b0e27ee4b2fac8159f194bd979b1d9facf0199cf3e'
        '891a36e35d2595d8cf24f641d7e0b7a210ceb5a61e7db3889ff82c06a734efbe67b36c1b5bc5d85a45dad78e00c236b1f97173ee993d89f3231450f20c12519e'
        'e8ffdf77bff1e07c8ad179bc95fd132f3c8183c57bc579e43d40200240d7152842026a2b3381f66da0da493b66805091e562d1f6e34bd92f46a8576624c34aac'
        '8991f4124c7876f8dc507c2766ee45248dcb431249f59eb3840a8b7d245abbb2c48a467cd7dacfeaac15abf5f205bf177832fcce2319efadc2946c4334bfb858'
        '55844533199e71f175095b4970da45b2f2bab61637ee5b7e3d23db5d4d86f0472a1db46007acdeaa2d1e1e8fa870f39cf14b45e8adab0988c374317fab24f6ab'
        '0d7a7a889978f5b8d33659c47e404221b4d54f65d765ca6e4843fddc438681e9bf238dc96219cc241ea8de04834de47b48a5a073cd4ecc3a3bc88148ee7c498c'
        'f3159b1bd5b24531cf219c1b54e48564507c7c1c23e4c5eda64baf839172813a2cac222b34d27a77874c9dff55599d9c2f3e55ff637f7e3c15a49adbb1da20a9'
        '2ff5d00614f29c2975b80e5d4bb538cfa14ce6e6c54554da035488e079c5668a6cf3311bc307c396ac08603e019897f149d0380738956713c40f755641f195be'
        '3f31353144e1b0caea9ab24c98d3d4e2b6306be89c7811bb173c7f47c7691892386fd16b85503b265f5dae14ef92e89cd7455d796e522a0427a589b567700751'
        '7c6102bc8652bfaf43f93ad89446ee2d5d74fe59e2e3817934282ed3e980322e72442a898b940e97238e559cdcffa7b684b37baa15c027e6c55eb4fda5618883')

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
