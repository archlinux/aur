# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.13.2
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
b2sums=('fb1a98adf48965be251602e7fb2e7a4a18d3f8b86fe02f24499ee4d08be69d28e11f368adeb7ca3a0e664d958b7ede6f45156c7ad617911292a971d6ebf969c5'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '58fad44cdb91fe80c7434b7c730830ffc704209dce9cecb5105c1bfc74121d272aa03b3d0204501edadcfac48898484bfeb33895b2b911e9c6310e92ac7086cc'
        '5a18495b002407ab1f7c99ab2a7b559a3c9299a44266d84fd4905521246cfb8525f9ddb3acd700e56a6d5bf10c2b4284e6b5b122108f92065b3d0ee0b35637df'
        '3db26a9d74f32c9a2a872f5c4c72aa97cebb222acdea3ce61544cb162532185af5981da57c094249cf4b4dcec832417e0b50f5ae36916b09a23123f58be4116e'
        '5d46bbecc5235137357175c442fe34b853de029ffdf9b4e43018219117e08992dab3eb5f82c951e2432ce90652308edd6cf9291f760965fd61ad723cdedf94a9'
        '5cd5930eef7afc33e1fa58707014c8fb35a26e8e3177847718afce26bacb4d042974820a4738b6be2f56f283236c6479dd4f6775cc73866882ff4712cceb0a65'
        '2bc7c799dd366b20de9e4c6265408c1823a1ea66fb6000afac1626bfd5fdc1075c4538723be63f7c6f23e38c4419de947b78852b05b5da0d73f16c7f04208bd8'
        'f8dbd68e470767945902681310e52eced208ebd2f2e908b699917d33a8c0d1552cf87e5dc61ae968508071d44b8b1679c4761b30d2954b0d97eb4a797c3a17dc'
        'd91a0c2f41c2a6d6430cfad7891e5f859ac0a45a0f68dfe5951653f24c5da1255c3ee1911f353ec98bed2fb47562be6a449d4435291a22637267286affd93594'
        '410d79448892975d32aa8d1224647ba23623d885b87990293ba9ff5094c3eb0af979866f4a5caedff1bcec5b8ae2b59b2ec1a5f4153b90d234f48b568f8d75c3'
        '378262a8b8572c24caacf2dc31b53b95b721c14123839d2adb69dbe55617a11ac79bffed7274d471b89284874406144936a83a78b0995a1f52759b5ae79456b9'
        '80d5d69b35d290e2ba80915365004e43d164bb041768c8f9e505cce99d0951db3fba829b28933f29d4c5bc133ca9f9e5d4219eaa17925469434acc823498961f'
        '320c324dbb261252e9c1a68dcc0f5cb70453c2e3df49d68924ed7ce48c02531573beedf2a01d45384d75922ad2496453c5723837cf6f45c1e2544996c33f682a'
        '46596b8a12f7de92b5acd292869fc8d22e9d721f6213f17571438a26fd8be677c151b56a601ce71a7c0eb4854d668fefe554fe82f33b61259057e95a37b6d7d9'
        '25690220c5404a1bf1de3f8b86b7e6c660341894a3ab24daecf258550e84d9905c62c371b1fdff5b7ef41c9c69fd4672daf24dc67fc91bdd74b0ed6930d19225'
        '6ce3ddb6af9006496f30f78a8adfcb1bfca2a0f3df7f54f716d5beebbe6d461abf549c87e31bc6d43e9f66c70ddb5ee121b3aed5ec9b0bfd601e1c59c976c4b0'
        'f1dcf868e1eb6b7fa6943e80f2c999ad4d970b3aae9422a10e806f638d426ad995f610bb05d9015ccad5c06e4a074ad8b161584d03ed64c89f111a2653712cdc'
        '2133b2af1984a7269c698fe2189997e825cdd423e3a3dd749b6cfcb4357ec0d24efdaf180afc486f262486b74f4f2a0c886f0f2bf1747f305c573a90b2e48997'
        'aa606b6117e83f927703bf0c01bf8879ed0edaca101ed301e78f7563fd7f28e356d611224a6b5aad5db4647422d4680b78d581b24f327b8c1f098b1d15dac15e'
        '254343f313ecb94fc8df3f08b8380b96be56cdbd0eb28a8f2f1f03073bb42cc50c5dd3574762180551e5c8ad44b04ec8ab8e24a48ec206ce028862333f9ebfc8'
        '4b807b7ab21ce7205cbf61e7bd2337c27069e0c23699482fed98716acd4a7c5f9f23504d28ae065c52b331ed833decba1a2738a9d22eb4051850b054c5713d74'
        'f77c6745806a9187565dc774f1dd165bbad6ba8dd5adadb46b265c95e5c0159ad5cfb312bd7bd60ad52e757a39f5e4300bdca6894231c4fbfe4f4ee90a4aa6fc'
        '725352f2dd91f61510d13fb3a36166a2ff9be62bb236cc70f6fbb55ff50603423946ef7f6a2360ae9eebd5fcc3e6e1025f6c99d0636096ca824f187d7f6fcd2b'
        'f790d42d87709ae063b2a73f4c9e517ea4490803860b7549b37fb8ff376ce3a398cca4f7fe799ef3276704a38ec0a8302525f38ab46beb6f0a773aa1fd2ac2df'
        '059c5da02e72ee9d101cc0b87307e1baca7dcc85861fba8472454cd3034453be441d76dad982009db23971d409d61814b0cfc0c4509f68c454929680c8402590'
        'c552636d20be8356284ecc94d459bce1c6d530c0866a3645294a6f146727168d0b5c06c111dbbd9275f28a2459944c1aa41abb8f874a73f8e61193e634914794'
        'fc311e5761200456c605f0ac7e9755b21c30379628ae69f1df83ad6af91865a5249f10e3d0f80b41ce1ee688b06a390601384f07029ae1f5966689d72cd3b2f5'
        '1d8aa5adf8791d15e78e4dd8e7237902447d1826669589c4c7ab3486b390f7514ae30906aa64d20035107154b364469c9482130f311ab1d2b9a8121e1601d84d'
        'd23ecdb2e9d7eefabc90bb31a5facb065dfe6c03b2bab3bdf1fac52d7e2149f530f11c88f30ae43930794419dc0a010436838308c0d2242f6020459428cc9237'
        '239909e5de0bc9146b5c17bb169282a3e47387aa64c114cd8f8a4c7399a7d5c78e3b68661058226633aa94ef245ff798816d60b7b8dda8f04d47e9d5501e2b3b'
        '144472e9db51599ae8af33d5bc2e88e3cf97c598450b9ba1144604628484abd010108c95555346f8067ad13a667ab09f2f254f297af3053b4f2208a16814495d'
        'a8cad9131201b168ef3ad75651289803da8d9ff983f901ff8e1ececa899dc1ae9cd169376d9b4c829cfcfc9b1ceabab48cdc8f19ae14087d30fa8fc623634ccc'
        'c197d539c4154b598c3e7c83bb7d0c55830f3219d0b8a97ed562b53cf7a1c8453746bd57685bc432d796de501c76a4e5f67f0ded63f8e09521584e6b52c9d458'
        '96b67cd9d4812202fdf52af2e4c862888708b89f18e2776c0e35f59ba614a1e51e45c3275b093528261e4645d1adb96a5d2977bc0e59490981be00016a43039b'
        '79699add7628e018fc7527a1bf506d8e1bce1b4dad65efe522ca34eee7620da909072893c5d1b6eccc67a21e517ddfbbdef49072850c1e182c899da8f7d7606c'
        '2c9fb6bf34aa8c28d63f66a8fe52c194723eb781356b8ddc0d43e2e319d2992fe45841ca5aa1d69c29c6058c1cfef47da0ad1b3d0fd86167e4e0e1c03a8bd5d0'
        'ea287f805f8975adc178fef93fb33cdfb39e142dc657807474bde919052087944e0f6ade2f88ed4254ae8d262c5e0f5f5b456c85684d77fa7c33ec2f5bac6a96'
        'd7c7cebc969b30148b5ffd87803350f919ff01f3744e7e87fb677ee4b4123869574a4f4284f6d4a641de1690a3f7e95761b0f6873447a5b6d204ff25df6018c4'
        '00f7648933dd775c87eb216793331e3663ac22dded6a6e0f883204214887940019b85ef3dd66cf56aab46c8f17ea73a6cca238b8da6d1f865450b49aa40d98c0'
        '6a8f1cd4ce9170a9357de08ae894f026e224c3b361b2954acd895053a33c5d3c100f5c02e046559dd91a3967ba10ccb8b62a470493659a6e96177df5c48ad86f'
        '9461150e81086bbc7cf55326f7dccb2439634c8eaf05114e472de13c15c263fd87aa2e484b5be9ff204ab03068fe86a1df04caeb67757b2aa4d8b1d844061e4e'
        '36a2a9f6cc8c2debb178e4cede5cee7f8d569c2f054cc0edd000a55b0dfcc452b9e8265e1c047f29ec615d12269e58c7fe462ffd4dfc5979dbfc27a6b8c75570'
        'e29558de04abce6a16fc51de6dde97fa7298449b7b6906205a152ec4ca4c671dbf3364423295bab9ead02b28ef1a29026000e2f2e9424595589779bc4694b317'
        '27a8a521face0660e16549e0c8e1ea566caab1636af6f7791258294f6f683e68e668fa98d6c13215d18a0e416b4f46a3942711bc6dd274e1db445263e3f9d914'
        'a81c9ee84e4cc9a25b0e6a3fc19644b9e12dbeb316128948d894c4ab8ce09156178fd6e5909ac16b483f3814def7e9fe4f764a050f50bef29b2b88bf3945758e'
        '420821a381e7e5d10a7020e0d9a65729cb712d1f20fde336fe7f523f7f22cba958af9fdc761c444adfde7ec2d91fc68ce1e62efa9b46c27a15c6aad885b09643'
        '76a2695c5c4415c5768b8834b07c8235b5d543ca6f51644482918d2b5b375dd29c2b56759c4747a0eb22345c7cd1eba7bde2cd75da2db0a0f00654afab8aefb3'
        '6518d30112524a5e96746f38e61c9fe4acacdeea0b77b91e49cd4da4efed7a27b648257a92bed5705be11d6139e384ebed7fba437e32df9685c04a1995d84c68'
        'edd22771747325b33926885afadef26855b7d954aabc442ff125420626de5d56dcb90ea8a29d728815b44a86f29144a6f77e9349898663c9796f47ff16b30e80'
        '7106ddaaabdbf5ff28d341b52959a6b2345c34a7ce498d555c994c0ec911e08456eeecfb3bffb61c9a481cc25c4a5f77362815ee0ff19b184ccd0fd4bc044354'
        '53e217798c244e92fc22ac4c77e3418c2879c3c20cad21e0d1f835e09353d80688eeba02c99532de14cb58159b9f9ec3c0599a647158f9166113d12a7e774fc3'
        '6cb5732c8de0b888c4515ca693e6ba8eb8c5015861db9baf659f6c2c0ed395dc187cebba668eb2f67a25d2f949f9d7a4e40b48a970d94944e3b9e0e8a2bbb1f0'
        '9ab51ef99c3c3e8ab113a9ad8d84272317230a103a1dee6969f431e11377b2fc4fbfe01186fe2cbe15eecbce412d31e337114b2fc6b7210a355ed2a89d24dc9d'
        '55cfbf55c161a522cccb09c9b4fbdcbd9ed66e9c5223c492051350cddc57d2b5bea6fe2182f36352de9c70dbe2717f343e00facd8de94483092e8525a16f9bca'
        '9dd97d21187f7dfed754d04f2417820b761aa1eab977cc418a3fb10c4d5a9877523264bcfe0666f6987c9762ece6bedb826f5457b8e4be6d7fb5561788cdf3b7'
        '02d0dd4940ef02443112323cff14002f897a62ae72c2c0a2672247295745074aef69476e8b65c306d5a37e46f0dcc1078b98a68af8fab615241c60c87da29e7e'
        '13c760e5ab0b6d46dcf2ea295733f6ddae42d0cb468bffc7b8a0263efd409f74acd28543bedc5de7ca9c9273e96de0c72717f071f730ebb2935f3a9eb23e8dd6'
        '673c043827b52f501367244ac4801aa5af95c2472b6091bb9a4d2210f5b5264abaf44dd2c971f49a1b22a821e153a3bf5aa2204e09fe4280ecca50b4bacf5210'
        'bfd498205e5a2ad8bbbfd7b4724806a12192ad372906f2f0ed6133bb67ccd078107ef6c412f7bdddcabddfa779055f8429ea67de1deb2180c93cae56ac52fa5c'
        'a51eeaa03982d60c9620cf83dc4bb5264a0ea8d6c710eb55f4ccb75cf3129d275c90bcf7108ae339dd427c602b8962bca610a37704391ffe14b6b0beba972fa4'
        '5046fcad031803e9cbc7a933411302a903102761e4200e04542a74955a3a5d7cb865a3e31c31c3c29ff7e5af4555672d62bd02a8c50bf54add233ef933af611d'
        '348245e041947df47e74d3925563a47245f9569d73de0f69f156eccef46d6dbabd7def1bc4a4ddfba0c8d0fea2c14ae57f30b22d3d47271bb98a850b1ff02c65'
        '7d6d3727ff1e18d522202bda7012da3b7484c9d2dcadf539515de6780b18d2361b33136547eb70c873b62f6ac6b9dc6c07078fe55681b93bb1df67e540a08f86'
        'bc7707f6da2bf9ec747d119335dd63f0d7402301ba7da537e0213ab1f1b4cfbc88269a57faf68089312c8708b6ce161c7d71e9a865f225cde37af9b968f0a252'
        '014435a06ce51af07caaee1f9a3088be8967580ac0c41da7e10a5cf6609ef5e449ebfaf4798d04ade317ff813c70b151d08fb78fee5a19528fd90198177da83f'
        '50ca7ff939a22258dffe881cf27c609f05637d8d14262c61a8e9373dc17ef6ce9478f4390179de77f6bff0dd932cbf1aab5283eec3bff8a06520456929e1fec7'
        '4608ce6cb5f0b674a2d6d648375f7b3eb226ebaeba65b87a9eaa16869877759cd51c461690d75ef5f01983aaab206e0fa9bb89a46856a3ebd62beb5f0ac407a8'
        '27ce992ac4edfe61179c8f35b6be3973281429e4653ccac16ae997ed6c7b248590a5d667ce4295af369f2edb76348b00945e1731fa58aa188e17ac31aa13cd9f'
        '500ea105e673420de7413142faccf335c011cb4e983a92fe2966966ed2acae773039040ecde4c578a35ccbf036993d7af69f7f160362a8db1438f57e862b0e2b'
        '476cf0c699809527b8e2556b2f32c2d51e92eb75814f1edd8b576e728f7dbaab9e23c3bbea934170c38727b6321bfbc580b7c79390a0fa203327cff2c3ae95b7'
        '20bca1734a3e04071de9d14636eef48b99871d9deb2c473b2a8014b9e8c58969fddaf6f7a2c4d82a30ee7f9fb07d8c37a1fee7a186c237704dffcf874e89239d'
        '8a7f19028219108dfed41aa15adff210120c350e993fee5e79609940c0b7e500c295c3be63262cc961a0a67466c56b4eda7687e9fbb271d373179c9d0c1de9bd'
        'c09c5d516705ccb875bf0fa3a58d94cd64a51481005db7946914c85980301f6ddbcbe0c6d72793c8010e2207a95a909c5fd628be8b7c2eafb2f46d45f2a28cd3'
        '21dbb0dd8454fe0c085cbea9046c0151b69fb2997268f62d0adeabecdfb6be0497ecff08471626168cf354b4e6d6c9f1a5db4580ff2f3f4e35835cc91921ddcc'
        '860eb8bf0293d6587d38a5b36475d59dfc4ffa01c5af2193ecb1285995d31c95d0715543fc291ab92acec7cafa5c680a5570053097df5f28da7ad1ed1693b3a2'
        'da4b0d0e3ee753e891b46e87295d75eb7a88bf9f837296640ac1eb200f7d694f3b2e4a0e0872c3fc48fd6612e9c54f1b57e2cc0b769b0270ffb251c4c4745fa9'
        '85f78fb037def7c7fb322e99777f8f5729554c7e15df74da313a9fcf3c3f5f038d7182744e22d89953ef8045b03f88dae5b2d62f26a80e2b50f4ddc5b807935a'
        '0d2e1471eb9513f2fe8aaded2c174c6adf169ac448ee6ec70a83a2b4a1c279f37ff87303bb7e66ce6d09dcbd92fc0c3dd71b1b672f9cb3352e4b256e3c083c40'
        '6178bce93177900a62ab691605acfe792176bd81a51258523c65f5b5ac3912bc5ad2add519eb3efd8e35507b95e64f986d60c497579da63ae8a5d55831febf32'
        'e7960c716fc416888c63b392b4758e0fe0438ef76eb9b053c127dd24beee0129440705fdbe9cd8caa7bb246d58f352fd02a958b4e9e38b2ee2f99372726e0f8a'
        '854dc04288f2ed93d6684c95516899e4e0650690327557367bafe1a2418eda831e4059a52994d6ecf0866511ad976ac95db1d6b5f57f6aba9d555f586ca959a9'
        'af12e24d2c9566f581209f7efda2911960c67135a6f4b0191f401e251b5ccdc1479a921066dadb4d321484895006ffe7078eac43bdc78a92ff7d7881143aac31'
        '76e3b723c9e03a947d72df0b0761a425d5125dc7c0a2ccb9052d9a5047fc81cd29698f076a801b3dc1bda01982c2babbb6649c5508f856e4a92dce5cdf253f79'
        '2512a01b06f8e71284cce95684ba1f3db1a005e38477e523cd47f4e56e2d4a68157d0391554ddd4bb2ee20d89a263cd4c2eb61a95a5d6e89ec48160d0553dddd'
        'ca42e257b283ce62b9d8994ddead6edf775478d04c004e0651ff5f20910cb5a41b8141480fc47e8920c8758dd375eb03ceb1f645a06a8be9713fee69f8b6b031'
        '6a3a449ba795b149084efb0dd78a6fc725c148540f587e6d10735befb83be7f6cf8d8e023904dbfc8c2674b6cfaccb7ce62dda01f924d37292482d30680ed535'
        '5a16bfc301c05002bee123241d63427f4be7ac3aeba756dde90192a24e2bb929c3e6d129677fe28616e7dd8e23f74ae2625cbf3e864d083cc169fa24ec2513f7'
        'e7099c0186460ec8deb8b0ca0de06d01d26623b0c1999305663c1d5ae07d6ba5c769c4fc10ae86b2191a2dc703ad51a05ae81cd23cafcb1e4d913f862c433571'
        '9083a554fc0c9ba5a87e14546359a589f12bd29b8c3bc80cdd843eedf9ea249f229fed1120f99c9010a8dceb525c2a3913dee83ea0eb19383c9acd8bdc6ef241'
        'ac3ddd96b2a2d3b578f5e7a616c2d8be88f616699ae82d0873047770061caf323175e1fb2bc3af725aa45838471bd39b036cbd7d8f89878c701285b12bd49cef')

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
