# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.7.2
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
b2sums=('69c3640b541e91b23156de5ee5594cb70952a29c513dd06016a0f9b1b0c9103ca6443c3a28db4fd3f9d718514acacad8651c737c7b8037a6006445dae534bf52'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'a66694b551045117c27381d44b7f0eb2ccf37daa4274f4569145ef6409e7a1436284d8dfe5ed1137b9df92af61d43135dd2e5d92b6fc9699d4c96ce6e61cfa02'
        'a840ac69f55100c411c7fbbe20b8e67495a3d361580fee141c84e6e00acad0a02e1835fa5bd8b6e5f39b90d3c7986352e0dee97051549eb18c5338bdfbab5bad'
        '0d2760dfb68fa803160697446ed318e89f59b1e03b104a89ae706edd688141ea712d1bc1c7ba2c6d804edd0c1fcd2fda7484ddd182888618e10a04d816d13318'
        '3e97a9fc39320c2852e53bbee4f8401c2c4879963b7ffae8ce8768a096acb45365f56c3f2666485a7816b28864d9030514a1c6a8311af892d451a2cd3b85ad64'
        '12d8ffa5c2c430d357a56cb350fbe9d173df1fb7919d1e7a92a434e9bfe7e32b00994def7eac99726593531ef61eb318c5dc298fc8d999f9f1f66d8cc5d65330'
        '353aac7cbd6f59c4cdab421194ee174d0b376a51c034352099382d277cc9c4d9f685bd83af7aa274ef820c7c8ff7f4168f51f5de1327ba578447f00efab3a195'
        'c8b4ee40ec3a8ad18d5708885a7853270d4fe4f0e83095bd6da5ea2a90934b1482be4e71094780f5b4b88d3a6a36a7c67e415985da61797bf076cf1429799500'
        '4b10d64bb8317b7bc9278a2128f6dc99253c2a5470a48695ec21aec663bd67c618352a9636d2c3422ef98062316c89a7beb2784814fb5f83274b545f4525d33f'
        '13eacad1c89137a63f517a898fb590579227fb7f70969d241bd4627d2afd9296473d1465e9e9d0920904da79ca7ed55a668a64b135c476f656519fa716a95a91'
        '45e9a59c31ee9e3fd641b13c9b4e78cc25f225601356085f994936187a447fa56902320ed06f2944a05e4964a1d595cce4e428513d4539bdf21c4d95f5d6535f'
        '6dc798bdca065e44eead74d5fc6b1e4bec55a49df40d61c41a7ea85c313d9c68770e2f0ca1856fd032aada5ab4a51d424b71319ba6fa928db092677527e4a119'
        '7ef5b96288016488196df7fccd0c0f5b98162201eb6ec5ab38d79868978f9ebe7fe6a618001631a2907a55f47ccc5eeb62c3229230661a151f093738ee89c443'
        '5f0d065882919a78dee5f17c0fef8223f88fe5a6ddba6e46d3358fadeea295ba2f6418346848151dacf6d2f9e53c1b32e66f2d837aaeeabb1997c2653f8c280e'
        'a677470c290528a3e9d8737ed77eb99518dffac0000740181468ee012675cd6785c876e14de35254ed3aa4865a9d24477458e34f3a0956755d75818aaed9dc27'
        'dda916d96910575d8cecb8be85d489ada04b7da81df0d9e8c24a7c32297970d4c3640c93b22949833d0ba1f37d8faee81647188f9f7ff19488988399b1cb016d'
        '12200ff854b0dc95ca44556539df6ce7027d3a77cae2213acb630e7bb821b276c40556b459da017677187dbf809580e321e3fea077cdf39c2d33622418db6318'
        'ba11b4158096a6d7b3e81a2d4efca029c930e973f814a9cfca953b9d9e7f9847570cf257a8d8d8cab17de3b88138fcb2c0950d16f9ade2d434e2e9f5ecf68c19'
        '170cb465c8d15d4156f7a6110497ced499bc1a40ee025efdb7ec7c5206b180ba711be80dac6528ef3a7772708c0d703e12aa6a65b66aef1240c59405d9389c60'
        'f3e7221d33036a2ad68aba1431b03f470cbe5bd3860b205a514077a328d94cd92d237924d94098720832465d175da54250a22fedb828dbd8ff00f6c839fd45b3'
        '9babe514589f13e81ce357259cf9984290c644492fe1fe249349e32adbca8cdcc288a9688990714d70a02f411d074998103e0d01a42b4aeed9d8a25e6b86124f'
        'bf4cf0701d46cc1a99174bbe9890e43bbbc983f8a85eec09b26882d70680dc4925929af6e1c50a6c50f5ef6533706bb50459c94158a521454ca43fb3be17f7e9'
        'fedda88427d162cf9eb1bd9014eb98c6c0b0c0034de49627d55b630072ce9f23afed2de81a07bf41f10cb07125b93a0dd2d13beba1ccfbb78c9147c983de04d1'
        '0bc03387dbb7540ffba88dfd442aae17f2854871c8655410d769c6bae961bf672e2f0427356b3e9aae5f629651bd6f9dceb3759fb34e80eb075a0c5a078b4fdf'
        '6a5ec6d5f660bc3c2875b5f18a44b66f7a36e25bf88e892fe71b2eb1232e4827ce1bb6b9054779b419e986d20f167f28888dd3285a804e11c51d9cdc6b24939f'
        '15b0d8c30b8ce8fa01427a6a1f3a8cf17bdeece62a79c59b148d27851e8dddc5188bfee80004f98c7ce3742c1c5565c219fae2124c852b905657225e17c24933'
        'ca8b91b48a0ab181c7dcaef62616328579e0be88ec31c2453f0034d6daf34b2198ea9b3ed80d97154d355ef44eda26d54058408ae7d147efca2713e9705036d4'
        'dace617b030f33372fedcaa8d837bc1488a583095c6001632d5955f82b0232d403e2fbe2e1b02edfb4b61c66b90d53d4fdfaa0927c8606732de58d35e8046d6c'
        'e6c0d682ccec67de77b4793b06754a1f119f420fc7646770008e5964e3a19c6cc35931b2bc56c444fd7cf0d944f871f80c83130eb5d1732dcf428501c44e62d5'
        '88a3c250280cd4c9c144d238cfbe182095a34d4979e191ead1655d77738090cd348f10b9f4a7f100f770628808fd33820c798b1fd5796cd8b4d394679b752f8a'
        'f6b0c919301a00bd2b0bd3d950b5bc3840bbe73a8569279848648b6766bf8c46ccd6ca6a7b6cf1e0875d3b8f40d982ad3355f43e32b818a156aaea229c3678fe'
        '0b90e48f209456a7bce5c641567bbe7b076eb58201a68b62915326039998c82cfd9bb7cfdb6b4e52310bd62a752700636fb5f68a5af4c4fc8af2c24da0a7456a'
        '4070a2eba702651b2dcaa0952bde39593e92b73a9bcb3c34ed945b18c9d8ae056be6a99a142c3940722f62ac4272c4dd88c8878531a23901d5c9de7e88fe5cd6'
        'bc08d009b232fd89cad4bbfdb661c0d51fcb1bc596e2025af0394646607614b89da031aa943a7de95517ed48901ddb195442b4d76da2c920ec81a1bb971b6e71'
        '162469dd86cbd398cf23e87caa412ebf099dd8eb1e06322f868129ae9aa42ecc43af76581d2d45832f1c2de12c7e28971ed525b2f7703038d20f07667a746bba'
        '671fc432b312990f54812e4b8419bb5fadfe931348bf0d54c52dadafe02d515d2cf0a892b2be2bd3095ed10bcf637e20efba604fc736fe96b3097f8a3bdd4fa0'
        'c96cbcc843e18ea997b9db9a415521328fd828aec6b91ba2a813672e37044acdd1f7e5af1a2bc9cbc237dff2552d6baabb079320cce240e6e675ab7f2894c1c3'
        '45a230eea7dd60c8de1b968ee4006fb7ccfea64a9c8accecd691431550d2ffaddd61ea364e9a513e64ff6389078ba7e6372e40fc276d80f232bcad4bcdb579cb'
        '4bd97125c39e366c8abf1232926c51484759e9c6cb6b89b63cdf576b7c5f39e9eafa9b80841a17f8cc3b9d89336a3ee2024eba74d66a82cb1667a7d41a20c7e3'
        '27b19e9b11756b57c70d3063fa7b845b204c9a7a9432915812856758aa8327fa461beccefeeb979c97429fde2d1c8bc34b4401c8d638421c9d0b14bf68ab4d1a'
        '0b274efe88544e2d130b6b8b0c90c575c022d9887625d09962e60525b8bb9914e7923bf0e0b033bcf8eb9e6d9584358c037febb8712276a0b17fd23c7ad8865e'
        'b06f768871919497b00cd95e0177117a790effc42f5a8cfd49f52c3e09b3d5609d40af950fe5f1bbf4774a5e2378234c773c0a59b528ddb431eb2d37da635fba'
        '64d27ae3911ea114f57a72dc2bfaa1dea12ab3a9432a5f0d1fce96aa26dfda62d6ca27c2e505b223c38fda16ccda04bb82504e303bc9ec9c273fc9a1192c28d3'
        'e53b5f64a171c6c7e64a137d9ffd499fa795d121adb2704f54d9e45f1c36e3ef0a2b930d46a7f5104f391569ea492b62dcc29f86d6fd83671479f29c77d0486e'
        'e583e1549c382f3b83ca8dfc08c3e5f86d6e80677f022c75dc6456180b1dda4e1a381676d3e346ade1f15014b76a62af803dc7247d54c3474a400e62956b0e0c'
        'fee15f812500b4f4d211e89cae80f35c35ca23754f12eae80df0ab0eec8dde9b43ec9a3ab63a5ea9423af38f4b6e324f8f7041a13f905c92089876a845da7f1e'
        '8055eddf51e5bd3a0135c0a03ffd10311d99fe254621c4153f3114c8d309b4e86e0c867474aa259425f75b12ea8a17e5ccee2e559bfb36d7323ae523e441808c'
        '7719c7f7e38050bee4e16e68f36debb4847f4905fd1671f3ad7c2032aeb8068a3306cf65a645004ed5fe53b19d65058f97d7c71014d3f9cc3ecb28d9c58b5f94'
        'babd738d214420275ea52ebb683b13b9c84b593bac35845f809647a7165834a100dffd642573657f629382511505a57fe1f705fcad66bdddb505d6600f03ed28'
        '5855a202b371c1f7907f96e917622473b1ff4fabe39bd05e424415a46ea8c1676b5f6b85a79c9be1cd67649631b793221ee4534cfb712416ec64232647ccba0d'
        '675ce852e87f147f885dd125353ff6e924f2809399793c9881088a7d68e36ff479b8fc1d71ef2238c5e7eac3fe10fed33bcd93d934142d7f6e6e7bdba0b7ce42'
        'c69ea9fda4fcb563541dd6cb512c2cd4954afdae0370922b057da991b029518f9229f6068bbc3374ce26f51756370b41c4496ba4f082c48db9aab82050e2284f'
        '03d41c344e796889cde295d54384c030338fbc9b898a27a3ac022eb04d1929104db39b02307869babd2368626ac637ea57f59ef52e2740764ce3a5d5ff4c4bd5'
        '8275054bf0124df75aa91d1565f974b482e5ac70d5d2b22db16d4a44ddf069ed99934e612cbcd7bf2ca4d2052ea9df34615acce7a1b7547e197a595d0b22f592'
        'b52cc0e5307c7cbd5f9ac925a1513f2017f4f0d5a81ebb5db072ebe66ed0cc6922bfb84f098822fb48575ba3f156eb9304c9c2c043d34b1589056dd811700d0f'
        'ad26b9144544fbe4ab27f508ac0bbea7777fba376ea80fa6481d9baf94394f5356bae606f444adeedb7b0ff18ee254653b4e89269d0be578638d22572421fa81'
        '4b38aa516224d5f6846f2deee13ca532ebac2e0d11d05e622d5d9fd98d6f5374b43357d2f3cca6342284b47955ff7002fc983b9350f445aac1daf07a998f1439'
        'b83a5c50702d0248854777211e719ba8428d6cb79da57f7e925192a60f2b09743c5f4334bc51754518930f6f8a76ad5929c28634add9fd6ea3bbc683c415d742'
        '850c307cd7ab44fc05d9303267c8d099520e37ce373217d85857e05752c5ce03fcf17b0cd09a3fa85b8c8f471684363ff051498366947c44bd91203347ca6609'
        '8816dcf3cba672dc61627cf9dea236e3d775b7000d03e4357dbe5da0d29e08fb19037ce2887267dd56f76a1a3ac731f2f176fc9f6ef4a079e53cb84da37591eb'
        '19b39490f153ec7319b237b4856cfe85c85b6630a7762a9fc91c123594793c96e1893cf4a37e0826ddb38d643fb4eaeba4a5f295cc7080f598ef999e9a14569c'
        'a3cebfa3b3ab75245591faead6f7efc4f6de46074aaa0878865df1f64d7371966754b064764fb4fb04f86374a37138679d98ef8a6ecc74beaa0c4e3ed80e0aad'
        'e85bb3496d09f9ed44d5ad894b10999e059559769bff96c9b47b1e62ed208d52944f6ff8314e2c2b59900fb9a165399fede798045e4a6373f491dffd4b1ac57f'
        '2b1df4d445d145f69143be2af825226964500c05e2223a289b89bb66f88c07b46cf9958326fef244d9b3e6d731c12f8dd0773595fede48482af836f071b02365'
        '7fc15f7cdccc9509c128bba1a0418aba17ba09dfcaedb9c815da795abc22f9f4c864b9acf7415c2e5952b925c8df72fb8ce2e2088c2088e085b8ea3c3308c1a7'
        '48a7b8e6428ad4c3c6ef05fbfba409d29f362af29247cbc6f424164566a9721d630b3a903c6859cdc520ff1fd785ef6e0694e0c405b2a93102ea038545fe9030'
        '85a3f6d0f261d2ac1fa03322530a4b072fdb0ee34442db2f56e8071bae9b2973109c999c2692532158992340ca7f01e6646fc63c19b136bedef9b72653685d4c'
        'c0a67e1f755c56f810b5fd6108da3f41e46ba0c39ea7319af36f7e5aa4f61f497b9cf66a771cb674b859539e83a0e39532933c1134d8464e3dc46f5a6a5b3352'
        'a0e110bb523681f56dde1003efe7e4a73120c010a6dfd63c603c352c2723aac17d06477c454d8db7867165c969f45c409eb59907e24e7ce173b79cc46a0912b4'
        '09be8f7227e184b210daf5da2a56eff359c612ad9738e0ba559f5aaf0415b3e8e1b77c92645657f07a9a257169fbde2e0c1151cd50c08bb1113625469fadc465'
        '5178942ca8e7f2cd62e7113cec1739efe6fc7a3d236c3467621681f59af16a09008d253624b1d19a7bb3f099801dab461fd9da61f433dd3746dda345a68630e0'
        '49a3267439e44b56548021c9eebfe14e666c6efaa8cdfdfa4649c547c9a2d6401d58135fc6d264b784f388c7efe61cbb9572218e56aecfb8a794e822313a7f43'
        '2442b2d6f4919c6de58d921d35bdb3ecfd01c83fcdde07bffddff3573dd32da87a93188763f88f331d2525f41e0842cb3c3531b225262716d8b08c4032d26ad9'
        '5fbd5a2c720fe75cb6317a9d729ff4af94a3aa1b5b2d8f13330a6b49835762ccaba9aec353837a04740eece3bba4605220ad158bc3fb6a03ce0b9f7e725ca147'
        'c4a3fe6c2a3225a64b6df7e75385a18386f1c8e520a618da303b67f65fd332d5241f4578245d0e24964629d6d83d4f5a7e6791599bbb2f66c701339201fbbbeb'
        '53936e4d4fe9f70fd1f1a866971fec1b7e81e52dac5b014b45ff7eed7a84d2edc3a8ba603427bd24771fb67d1349b8a9ee19726ce378285195a0c718c785711d'
        '979c7e6d8960da5e5ac9727cc8f983ad78be0240a3930aadbbc03b3fa456cb84b37db402b9718fa844d375e4716802031c0682cfe765ac3d8cb1bbbf89e79751'
        '9c7ebaa9715411c1b772317de9fbf65dedcb45bc6670dd342610e3ab7970dae2cdaa71935f102050bbf7746d387d908374e70481f42486f2f6711e98a431b1e3'
        '783fd2a89042402008f502f2a66f35c10a309690869f7c6eb79143eb091e926cad120ac7be4ac34e965396fb1457a100744d099b5332afc252dfbac02ebe0b6a'
        'ccc1d4d409680d4e551f3793e89a52409765b0fc2f8ee426001b13779a7e0fc0e64734662662c6b70b056bdba977285bb04b434a9b2ba6c7510a7d3c2d3ebe40'
        '028a567322d62edcbf3377de7f98de4b84f0c5180e8781be6c8709dd4355d0aa2d32e2e6c4d5037bbf7e0a04d641979ce3349ae713b39fd05e3e6037aeba1b0a'
        '189ae6b0db39803a80e7ac6bc0f5c4ca55f9223d647818ec4b5ad814aae982d6626efbf4260e42804bef61d7c69f78d11054d688c19cae796d038bf208849bbc'
        '7bb2d21cf06007c402142a65641d7d165fcd31b541d4d9b6fadcfa7e1fcc6b22fcd1ea6b0007aa333ff1f7bb853835bb2ad04cdb7e139f8382b0dd0c35413a20'
        '3d30a8698990e4df99d130c0f484f7d335dd7a1897426ef414ab35ed676fc9b61791704c3eace6ff5af4cf3ea9de3515211c63273e0ffb65966c2eda87209b1a'
        '8aea27f21bb69887f6d3f4167d5217eb54ac0f563281075d182abe142b98cd58b8ba6ee2ce970f57b7c233e3ab08e809f472ac8b7e0dbf8a520c413036e443fe'
        'c8401266c1b2e3bbab87feb2b7fa4c472a3ebf5b517be9153c06f7918fa6f35c4e0b0a2db59a34607ac52bc47a6e281758d844207972803ddf8ce1c40cefdec1'
        'b1ac045100a3bfa26442409f42cecf044d2e7da5507c4c8ac63621ac34c4a14bb85e0c53d90623fb2727c6916498d7d556969705f62e611fbbfcb894231571e2'
        '79a71dc79cd95dd62b78cfa2acc0f5c801423cc7877ef3d5bca9c4cc13ae0d5644048e0a5c8d41b9850bb632b336499e913778fb237232d02fa1af4d78fe60f9'
        '8a2a06b8c8027881be240c4bc7d710cfeb90247101f6a6a9eb6fd5863345a6cb654c55ed6a149537c0a976aa1ccec20e2da5654e0d3fa681a1662dcf2c4b41e0'
        'f8fb86588f865f542a4511b9cc6d6d3e547bb1b008db1ad4a12a7054fb47e64b5f6e71cd32f8f34f423a76d8a9707914241776c782eee618755e7c91ba975469')

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
