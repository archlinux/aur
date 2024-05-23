# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.3.1
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
b2sums=('a1206aa6c4594445055313a33f8c4d8acdd656fa3a3e1720ee1833db7b8b83f2e6f41fc8f05652adf38dc86de2bd8cd4b5b6049d17256fd1c85a09ca2096dd19'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '976416f1607a323fd40c77a43b04aabdc9a42f862b16129e79f0cfe3fea0e6dc67c0b1ed6620c4ebc733604ed9fb3dbf52e34ca3c4c4912106c9c79615681297'
        '17c7d7b3aff11529d29b03a5ca88ad5ca75f4830d69697e894937e6432bdb4d7927673b657adba870a1016ffcfc8f8c468e7ffc1c3d26d65d251f51443d9704e'
        '18dc9cb36f74e032ddb31a2f4c5add35712ecccf5cb63c964d203f00b77b9fe85d402344a5cd8f52119838cc9364f49709db5704acb3b0f8a8b9497300f5ee53'
        'ff3bfac25a63a5049baf4d3d0d8f9478162f5afb2eac0b6e534657a7ec0aa228bfd30c2a190c4c27d2d278c57e2ca325ca61373a64700e95ebf8b042f7f2530d'
        '245af3b8710a382870bed70d72ae2011ccf78add78a086c35af265e128b1e900b4737e4be987d9b2cc7c54b39d1ef9499737d833ee90201421dd0d12648a4f5b'
        'eca644544b823fe8cde4106c1f6dcc264de0fedfca62859a816a314c38f27b95ce7bae87500c75c355f8eaa1c51e007c99dba4708053ac76ba61610e3f2d4d47'
        '7a24421567f853a06ecf468aa78f90d697e89f9d89069f751e0de8f6e4d50346a740647460139547ac36bb4c408e9af7b41ede0b128ef6a6170316471e95b640'
        '795e899f1fdc6a2fc7cd3999b193e950fefc206d3ba11ca10d8d21f420395df221d11045ae4b4bf0918587c26dcf38f16a2d2127c7fd7e4521887eb4f77032ae'
        '3c3d495825f9db55fbae619671fd3cb903c7976cb443f508677aa085fba38f290db354590d0ac7412bb378d9501ecf02e5f61ab24892ccf5b5af8efc26984ee9'
        'ccf2e8210b46973da4eb30847e8bfc00aba8e0c18623f64108839fbbf03935360aac4fb2bd4c4dca2e47ee170269294bbc590f28aece8a84dc7dd94dbe44ef4f'
        '50a19c150f2d45cb28bff4c6519b418148db3b31df590fc638046cf54a684435c92b544c683bc986f7c2dca62dc9689cb50b45597bc5f36f31c7fbd8516f9e0c'
        '4ff4daabc7ea749d5d2990bdf374ec6b820d48b7b064ca6d86b8b700c1468518dfdf5cf3671e398f8656a31a7511de690d01875b73f5a7b4b27ecd71c865eb87'
        'a91a89d2302bf56edf31f92123927dd904fb5f9c6203cdcf579700b61333e6550b427f73ecff3f573d4efdab9c011a59927020c54d6ddd402a763f693bc29b93'
        'c483eb642388225bb61f5a5583df556cd7adee2245f813646ced8e5248ed4b45484acc47d1add9d25d87527992ed390c20ceb5eb0a942c9a0d6b0a4d2c9b57c8'
        '870c43d2551296a891a62752edc5e0a68826e231a68d972abd388deaa4019b8af3b7936d998e24c57bc40c116e511a73e668d821a86b78988da8ed9fd5379e14'
        '7d8b899928f5bd3636f5fd22a6ed052d49ea956b87aab933f816060c9cafa50682239f83fb145235ec9aad3a7844f5bcedb62d0e4698d49c8c8c95b16eb2f5ad'
        '2aaae4172a1af29c7991ba6c32136d49249a3bb1d0f6f89d8d6df3deba0c237d2440a5251aed588305a7264bcdf2321573246de083be54075f3f65323da17456'
        'd1ef818e19825fd553fd56fee6d9d9264a0493ca212a6d32db326d2cf625ef924270dc079126a7c43ee802e881b5b3e4f1df55f1629f7340ba279eb8ad4a12d1'
        '708cbf6af6395110935abfef11d55f32732cfa159ea0c43ee1672a722a3e42ceb7e0da18795cc2a8b6d1d233b53db12902daf55d5777d03843a65027df665ba3'
        '399705dd0fe4ab8de6592c21e47cab503f27e751b1efb64c58d9eef3bfa1bbfd08f2e7027bfae03cca5478f6acf1afb60f00c2e552a7ee589672cd148d948b41'
        'c9eeceb20bdaa372f9542065c5ea665b4bbda0d684e179c62717ef5ac3c82376aa113d317e2f2cff73880decdfd631e20901dff04dec9a72c2e76e8536c47a43'
        '688c85217c5c43f9b96790ec99fa102677780f3412958b2eb0bb555b3fd1daee09a2487af4264bb881bbdf0208dd683087fa26dc9a598f5b818c572b7b55c3b4'
        '3b4de2c6870347bfd3a1a7254f2dad2927c33ec7c9218888d2b073e4b545983d5d53931a9c147003cb9e6275e7ebe9c5e4ce58034acdde5dd45f2a094225a3c3'
        '1cab88b0a0343fceaec88073ba6be8ff8b9c54614c3e13109cc32ce2855d7f4cba3883e509a1adc3337bccf6a5ef8b581bd83d2d496f199dec73ab35f3440f43'
        '345f2a93f9c40b33287401a437a4e5b5999f1525398e0662a7c33167b42bae62ffb8d7f750277fcd53b887db0a46e9419ab5b3e2f2d6324c91996c717369cbe8'
        '6f6edcd93ec6cd8ec0a0c90b8246deddf98c0f283657610ccf6bcdf0eb1244c8899411826f9dd951bcbabac6cb56f99e8e90b8aef2fd9ab9791e2a6d36a421b4'
        '43e0253d848dd15e39d2bb661e880db069928e03b8b8ff9aca300eb41b85e936600eb37af9dfb70d5bef64098a5f59ad127bf0892565463ba9463e6fd9df3e92'
        'a91aeb1e84e8b91cce219d92ddfc1db73b52d3bcdde4527c3eb66c82b1f3b5f89df186057bb54a94521fa1d772694e2f6b0532e8c0fe58d2c8b3ea99c782ea18'
        '6c2b2b4220a7efbeb1d519b318674092c243d21e39848d232e699e6c66c63843062c68989bebbd5fc862371e3414bcd798c876c7cb3781358ac7b284988f55d7'
        'c7767eec1d5f8568a9f0d537fd19a38687ce3af0f9a7c9f3c69df0422c0ee142d950382cdb80e6e45a862957cd4251d9203651afb6fd42ce0dfd51517d78cd66'
        '52bcc9ce73ac714ea4cac35162978df38dfca8a1c0d75f4f4e8899856653c950722def356b34d2e3a320649f598c692f3491d3fc39d216b1f5877156a0330b61'
        '0bd660e2270095ad918dee698414ee6103ed96eb936722acaf81deccb8cb8f1544e48fa197b33f2bec242461e58ca17c4149becfb882530d56cce593e200ff55'
        'bc2e6ccbcfaefdd76833ec0f47c876bcfde53b2ae787942e35f6a3eb0234f8c328d00c1a11deddb75bdcfb257a14e88c0f3d74dae92319562b47ff4abd4cade2'
        '3697e33e23c53a7260be42f19a43ea4e73b963611e0e850857ffb6f9026b45dcd0bda682044856ff737ccc33cb00e7ef6cd66685c9830e3522b7e6e1d7c273e6'
        'e61c91ea6382542edcd15b4c2cd2fa707c8760c145057a09e610d5662ee83aa773de8374f034b6f243b01c651a385c257d0543f75588bf06a1ac20bf22d2444b'
        '34e7faa03010b36a4aa4df869ac1f2c08eb02e654a4020804e5916a594782e18f23c8309066ca4db796ebe222965818edf9e037d144bc4dc6e7d5760240616b4'
        'a2a4214c2af37a6dad6d5711665aaa61c19a29cae50bcdcb342bc102f22200a62a6b3bdc90c38263ead45ab08120d73793fbe820470e321fe9d16fc7edbecd8a'
        'a9302bbfdd3f3192da6c8bc5944cb3109975c97d05ade00221b6b6f2d4f6ec26f158e01ba0991888c80b378422402c961e39c0c3d7dd63ccb8149bd89ac9cd59'
        'cef94039a24a860f61375078a9c30902ec0b6bba616dcca9d98d0f50e10655243f3a80173f91a05c65895ede9055e55f97541fdf1b8b5f15592bf05cee4ef1c3'
        'e21f3d4e0e07bcd5a0f10df280d935f46793e958ad15646d488f844801e4b8fc42b2b505fc8e90ec625c15e297042e038266f0d3129e021ce91e698cf667782c'
        '4812a849905ba47b5a1a3aa77de505e01d8eb4a4faf80cba6d9f26a29150bc48d5baabf83b0f5534299a4cfd07bd1cbecaf342aed0466ac6154778332ef2c78c'
        '869254aa28bb60c111caab63a690caea93d818169b062c74c23593b926986cff73468fc02a53bbfbebd5e92a415b31c2890de816aebe6949a5281af313943ac8'
        '1b9741f20223ae1715ceb38e51eaab2a4fb451b0177bf2b1af905dd58f5faf82d74ce2798d3eb29a6311596282ef507e72474833bac8d259d2349b8d027136a3'
        'c319a82383aae1cf7295f1dcc538f87d9efde160ec95e3389d8cde7307f1044b954b258a546085c1cf52c5ee9428129b0470887b0b7773c0a341ca4b54716803'
        '845378b0de561dee9b3baa6fd7160ac970fabde449da6fc75b946f5be8f0163827576912471e2576b9b1be854ff78233eae0a9655489be457a08f5d65a484df5'
        'd46a7b9db8b8f9ce9cfcee82a513254d768ceb3a70f6f221874601aa5b001eefdbfe3b2132aef7d93c583f0451a0dc08cc83f9509645a0a54e81473b4e6035a4'
        '60d1357f51a59e3f3d638203b6e00d0160d83e37f2eedc494ad4d11455784f61e43de30aa8412fcb60326b9527beb84c5cfb7cc6e29c021a48c6f45ec24a4ad9'
        '3dea63ef478cfb825dc727dbd3bd43b01c5270ee6e30d88eab54df9b3007c4c3aae9929246ea904c6a0912a8fd60ab810a19745b7244fe546d8e090a9ba93fec'
        '39281e67f77ffbb1df4cab4a64fd69d38efe40483619412088531622ad763072bb4936ce311033860cf2717ac824083ab519e601f2e88cc13ed8168815497299'
        '85f8c1384075f5c4fb91fae08c7daf82248a4033bd214429728d71f296974b604c3ba3aece89079c1c96d190d3263a9e6785686328140fed675416c911cd07e5'
        'ead4c479b74eff2c34e58c28d3204a4a5b4e9511e23bce1f4afc9507d8070def80b5fc6a2132ebc6463ca09ecfc9f537fc441714a5e2f4c9609c7be594a3a4e6'
        '4afa7ee63258dbdb934cc97bfeee87347c2f5d0927b1a3f8bc774c5f432c93d7516babbef9f23912f698c6c103830a78ebaf86d464642baba1a47f0a91bb87a9'
        '4df52caf409032b4018405a1558bfd9b07755be9b3eafeceedb3972dba9b489516f44bf7a4331ea790957e5cb247d22fbce112d1cbf74d667fdbcfbdb226753d'
        'b1b7a818557d81629175654355465ee8d9377571dba98034d169ae54536d5d3907b92b0a61ed8800374cee213a79a725e06617338d7e3fc9f1e32744f188aefd'
        'c094d6a80b2c8d60dc2680bf4e3b537c69354badf5a2880c060c965f5315618f62a26221af48d34544e571127a5a18b67091963845c487278c62bb1d42a7072c'
        'ef32ddc254ec649d295813f92ad4511f83d16f6c5a7c7e7eb054a4dd913a9d7d8cb924780cc5515f62cd051333fb50432a765800eb302d720d0c17e792728272'
        'd3844876235e23e961bf5f9648e4c31b837d6ef10571667158181a600894a1b963dc53f635230e004cea731a07a1c6b0aeb2d39bcac3d260b76ac5a22d4b40bb'
        'ec7a35bd429588537e35bfaf1dd00c20c23653abfd24ea11dbf6fcc556562fcfbb3aec80d0615f37524ca30edc84f8eef97cedee640f4748f95ae8901a9a3afa'
        '0fae7752920178807b00fde0e6c2233b24171771d698f329eb771f255a8122c2d9c1446b75a1925dba6ceebe05522ffe40423f66dd9513dca8b6f85a0a5e439e'
        '9f8da4bff263c1bfbe30d14453560da43296c4912746d03b57535c7424b39b10317bcdffdc642e1c649c5e9201d4772cef90b864a89321825979d22ee80911a0'
        'da24eed55327c93a29126118459cacc5d370d2f2936be6a4d83243f9eca84b3dc829f36caa29b71dc776d3d0535356f1c04ce51eff38b5fa3f9f70da907a7ea3'
        'db7c5df318a89e49414432e52a637d8a4379f41834f2192a29b8d8f93f1177dfe0cb9abbd39cc876df77675c2650d832c05290a5b37d1fd10e174918ac406552'
        'ad025b11262d479f46ddb892a193b4b9aa65a6bd5d0f11256fc4abf3a7c7082177ab130f82cbf4c5ef465870112a25e25e05fc611f17b1e90a3c7f35cbebe1f0'
        '11fa9bd4334286772be169f4f21c4bf9cbfb83301652c7db749698597a499e58c920758833c798ca04b6f748b3e270d2c82c556a75777257c9363c674e840e71'
        'd0c4fe615be21f09469b527d52bc5c07c784375f5d2af4bac4c6f860209d57a1d11c70ff1386a4f78855b3a22f08626bf4edbaa54bcba33d28e06c3e3066614d'
        '1a051395b69bc3c0d70e7f529c4cfbe1014cebe872084165dd86ce1dbf1b6357c84a135bfe6b1f09ef04bf8d68ca8c01aaebf4a7d1394638214e534b25afb0c4'
        '9e19417315fc41ceb0f5e890170f942b674029553aaa2fa2cf77c722dede8363ad93059c04c2fdfa9fb94d4b3f8529b77eb9becb95b3ce34136246c9dbd5bf54'
        '3d953844ecc02f777cc9cdd93caea2cd8c35ebc055f258b02080a20d40d323f5801723c26c804206abd44029e8df444a148e5789d8a73c7eced814abf224766b'
        'ca4c2841edd9275bbd21c75ab4b49524cea8613011aa8eba112af32d15e1a752e9c491443d866f377fd3454bbba9f4ba9a63dce343dd92547029fefe4018b7f9'
        '31e5de670cfa06342881247223cf13815081d5fe8d1f72543e340ff9fe269317c452c78d7d605efca0ca1e01cefd8836733f9e808929d4483c5b70e92bfca6f2'
        'f50d9b5fd9f5f1cec0ec5c751f4d82686d761780aa3ae7e98e3a184a85880119fb99180d046f6542cf5bfd50fcd3bed4bcc7c85f8e837f280072f44828f74cd4'
        'c4bdfac9c21ab57fcb9596206677531908ebafacb20a9e77d5ee590c42d48f7fe79964cadfc0d0a25e548d163f28345d7fcd69ca199944f9f63f5517804bcace'
        'a2f0438d7438f9ec8eaf601295b7e7c951031da3fea173da1f0386a65add1f3c141f952ea80c71a4573ba290da8cb6fc53434a732351ebcb813743e755cff3f5'
        'aa0af71e6d1110846603a85057353ea258bac966a4860a97db571d5640bf0851ae7af3f99f2870958836474dfe62dcbe2664382311bc3acf18d98f7b4b2a196e'
        '4174274ad03d99d16b5988ba008243b6fd43b883b774dcfd9a4a9c2acc8475c98ca0944b68f0d40414f88db4bb653c58c2be377cdc57bc63490662f706403eb8'
        'ab476d057590780dfe15c555fa2218772c19badb4a0205b148a41e2120a59c10d9d94bdf63a2eb47c825dca975c9efb9712ad3a2554af906132942e1bbff345c'
        '9cddc0146834ffea13d5c696defb455fa840987ef02cc49d8f3f4f40c6291e349ddaf0db38251439274f6d191500998aa453940e9c27b1a846428ca0404467f7'
        'fd17fae51e91415e0bba97befd872eaf397d13b3c99b68cfb3e83b352cf20c3121902d0b0066ce3643db700a6d7c6752a5d66763caa31744fe34dd9c9d459bed'
        '6f0a53f67b9f9b1d6d02918d63303d3bdbfb649a9be3fbc7ad13266060aaf3c4d8fa159333645ff102449f74d29a87c037599787dfd322d9e52d874ea1376092'
        '62ebf199df1d72619026be0fa919aa65f0becc17577ee0cd805aac399183eebef2fd74091b39b66bb3782548e092a6067543bd4bb6f9f9e63561be5288bd995e'
        'bfe8b2c3138397f4fbaa1acf67637522c9b045fcba73daf6e5645855fba28abd1ac97928f0dff61c44a38981b46cb3274be8dd7a61433c54e7c57a340c3f4dcb'
        '362c3cf003a729c4d80abdfa44e6366ab25546bfe0b0634367b882651c9d91da81a96e6fbe08a05381dbb08df5243f85a8d13ec68530a7d0a5d927d1dba26476'
        'cb5a10adc948da88a24088b3f1aed767ce6752db91bdd8c4a7d5926408996e7f108fb61c0296a0499b651c3b38f648128dad7bf77d68191aae539e23bafafa50'
        '679c2a840e31c562961bb71dd5c2bf47cd8b996098446d63b21ccaca48f5643650c296d77db9c2c26294dcea3a0dbbd64b3ddfcce95ea9cde9b3d1aa488bc663'
        '605f3a2231ec340c390924c23c98e4d075322408bf0344cd4aea8d55768d43616c7d2a5d8212a98ba79d3260e80be4d0bc95f66b9b71a0e8f594819cc058c8c0'
        '125c31128e2963f15b6b47a92cd39e9e6ccbf93f2e454ccd832d8ca5b6847cce6dfd8ae5a085bef827308b7e292054c91a73b23a03a131bc57514fa76ab7809f'
        '2206f3e0a6601e124d9bbe4e4767c966ddfeda75fb7bc72bbe756d16bd6a585604409f26cfa147f8038e4310aa88b576e23be93976b566d9fa531a2a3ce6a9d2'
        'f239ec24db7814c56dd408d73c8e90406edc8fbfcf6b66e5d1002118508dfd714efabf5a247b26af8885aa9c9edaa16cd3671891ffc94fb19cc6cc1f86cddc42'
        'a05b9e9a48a6eb47c34e90542b73c6953dfcd6f71353b148dd36bbd6d2b2802e3d2c2ab923d86c8995bf09f9b838fbbaad8f4dcb0c4350cb9f092f489ce3e1c8')

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
