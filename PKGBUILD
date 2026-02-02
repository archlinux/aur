# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=25.04.8.1
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
b2sums=('284ec3f8cf74f9531e998131052a5b20157d65deeba13198ac0056d3b566d4732ab63b91d58dcd492755a38dc91ebf1ca01ea85f36955bf5a9faa6b03ea2f24d'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '4f9f9dd4ef167d2b13c4add14e7183122af152d399e44d0103e83d40671fea19cb7ac82ace46ef3b6b8b9d228fac7a16c1331645e224e3706b42f877ffc86ca7'
        '89eeaa0c19bf880327c2acb4e3bacd9f90dafb52f4039047a66ae9ffcb202de4060772da6bb6d40eb2f3a14c44811c7e918be612f9fe24b7b9b092f00e71d716'
        'd85b3fbde1d933b2edddc8064dd784a3c8b4496b355730df6028686ff71259d3033a8191e219fe518de856d3fc2d3dead9a6f5f85525f3fb88b748e06607439c'
        '432f360206d61bd119c409142e41e5542d0c423a20966d1de32f64e63e80d04015eb7fde976d4a2f3ed1e81feaddf9fffc6fd88a4b5760629ceed34f1a6deee5'
        'f79b8e33f6bbf569f46360d30e0596d31f52131e4cd2a528fb66590f6cc404ad243da272506e8a9664d8ef9b1f98343bfa9cd819481489e84d8ae96b40f506f4'
        '24ade6c2aacf89275c74e7c75bd39a64c768f661df2978896134c7036e2ba8a57a27dad68ffff914980455f428bb7c4b53011e34679f44067db604b85b3c534c'
        '1131eb9864d3aa90dd71dba3520b13bd54c35d2ac6027db6b998b70b7d93d80cfd398020e3588e9488f2701863c9b627619bac10729adc7cd0a9c5d430b3f0a5'
        'caaf96fc105d134d255bfe7bea9093b36c9fb003479d53097bbe1cad5177e7885a0d4d4efe9bc2522e686d2255d88ac2cc3f284dc4b2f9c3ab52e60cbb44221e'
        '64f5d0b9b277a251a2504b84fc88b2595932491518eb1bb4d7836e945da0f77ba0f539fa3a12851b6b0fec5181f7c256ac4021365e1bb0a47a71c427c025dcbe'
        '3e2a2ef19966427255f583bfc1f71cb01ebf32994a55d78f9fd6cd91a32e62b6235648cbf58254de034c4d145fe2f89c71f05a6bf894638b84a6013ea6bc5624'
        'a196f9a5a9d5cc124bf8b0ad2ea99f9945ef6dff670ab09743c2c90d9aafeb29edcca779485ccd56aff50a160437e9b84c29903e01565eb5cdbafd8b627e38ad'
        '7344d4f969c8120cbee397c6e0d7288c31fec2182e9466d192a80d2c4331001b11e5021edb98b1de7d98becb558c3d6a667d4ab479b6d5c9517dcaf442614672'
        '482be6d08d45a5b2ccc25870f1e59032c5b8ff9110e13c66f31529dec3ba63f243a070a05e7a97a79b64103655fef18c0a4876516866a7b562a5418a3a5ca0a9'
        '17480febc448900f717388fad0499b0c57e3d30225c4e7d0a4f5af33362dfba127e71cf1c0df14af44db593f737c9672b7c0966cbf7d6f786f618390fbca369a'
        'beaf981ac76383b3b069e250da3a60f95a3eee19f12970effc2590a30b92fe9a39332c927c1f105af09962b7836cd9817db27a21a188600c91f2b5bb5b6a2432'
        '55ec22e0f8eb58a3402b1cff630cdfb2713a267acdc53d827cf809b6b155edd28509a4d0868c3e6870e279bda4e51fe6725dee84f16e6ddd070e299bf3ebb68b'
        '05da5b78aa72a912530e6f4ec68166ac912b499be66fccabd9c9ec41e31cc9b69580be91be1147cbc7fc15ac22d567fde50657979b54763a454f2b95336d3b02'
        '8fc4a1e9d72dc3f738dc798f7cc1678023455ef0aefb3c7ecbd033ae56b76437021a613f5a9db0aed45fbb9020de26b1d5487007b33bef9e5be40aec7f1a148b'
        'abc5059e0a63bf6dc1af5350338eeb15d60b32bd7d189db641ad84bed683f3fb5167aaef23455ecf17db6de56dd4a6f5e90a79a1a9e938a67b3c97058ad5e911'
        '7d889dc484cd55461fae24083b99b350ebf84110c7ae15060fa39ac21f24961b31b5df715c1aace2c8c74248ac51813bd805860dece57dde69fb34bdadbe5bd5'
        '1af30d84592e97e9c2228b1cd904b3630452325cc1af0e354f29e0822e958f9299a06654eb023e33c08a371e3f27b634fabf9c86e1ffa1b609e5743170495ced'
        '009b1b20f9f99c5fa48049c4020e1a627e60c76ad83448779d975b3cc80a53e3bcf6dc8914124fa593849fe1af0130ea42cb9602918d342e0dc714fea7806ca6'
        'f058a1e5021d852116466fefbc925576455fd8bd1b5a9c739c716c97a6916a82a34a52bdcb8dd36237cbeaf97d4624fe963cc553797ba4ba5e98bea2ca2e7a27'
        '44cdbf10979dfdf7b932e0a8df699d5cdf30b92293d51b6ab5d48a56b12d975b6d4d983141bafda1ed19db1372631c40e84a5309cdb89c7d08c950295e957c28'
        '2d99def088a3fa6a6a7f8c2687e934b51d94244c18cb755810e5bd231a77ee4dd72eb6d5fe2d748af77c0c344a2b17a2dc05d4664c40420f9b772b95a0a2e6f6'
        '1ea84a94902e40e9d961d34e678a4fc234746926231e2a403a97c66124cf53d1312741e716d2ae20888f0218f01c2ca1056df7fefb4e18efc4c5f019b0147fbc'
        'ea7e82036d9df1457a1425dd480dd8453539d7742f3558ff2d2eb3ef336f56a6d62ee336b4292c316a1eecdcd926e8e41e15ea24f5ff8073a556dacbdf73650a'
        '07d4b360fc91adc5063cb0418cf98c2fa36c63a3eab04fcb667edff3f074e7cee0486ac852a3c2558b86ee0a66d83a6c51529508de308f393bdf99145c48e4dd'
        '70fd4b527b05902905effa8ab0462f17bde618f4b866d07c11c514cc1c26fba6f65b3f9969a25ec09d80104f5b34492a7de1c8f61ef94ddf797d82f2fc06058d'
        'd0ed4e70985f6d18f86b364acf880be5d76c10a1f6679b085d0cd0d1e8689a270be56556cce3fa9a1963f57e444053436693254bf964a04cea97ead8c76daf1a'
        '1fc863456d4d84496dd9433c5f4b0c57578b326d92adffed219ccfa9ac86c3d1ff9619b7e6ff8d602d90ece8688383b4ad1a39b1cc7e30f7bc28e23566bc2d75'
        '73323c9701ca7d024d770ad1b22089cdc48062cb5f5e8fc10cbcc9faf8cfb4a41424bd6d2e55fe0e82ea870cc53d8a68ae079fac974b3206cb827e87d019a733'
        '456d7b46cd281d6c50043359ffa71e0973a42c9819c8c616f0af15d45dc245a3af0211c25673f4d87b57ed587c4d78e21d8d419d04c3645902b045d0477452ce'
        '5ef20d135b82f57191582c7b6c87f11071b5d05b2269dcc6805e8ac13511511d5cb2be726cdf786a80ba9efefc1f2ee4cb09049b679a18d8d203e88b7be49b96'
        '90b00ad022a563e85867eb0f0610a3a89b58cdb2b9baf445dcbc3192657134db01d46d9d2c04faa5720e2cd58a2c7f71d6f8b46ed688216e6b0eea6fc59de43a'
        '4793cf77f2942cf1ee2ec1472b2398389355a86fe95aa30f832971da4f8422f2867bb9447e807b35ab9d26d9b3ba0b8bf78170cb2afdbb85c010af8241678830'
        '2daf88d33784956cd08ba6cf17b6f30f267b3ed2b255cfe79593aa23f5c2f1f22cee3d33ebda6b8f7df95a492beff2451ea6578b51e35a18bddecde34b529ca0'
        '31a29f5309d49fd3ffc33cb61be188f694dcd76434a1624c732c88654194ce2a374186a29a86e9ca78c6375e0dd25981f60c8e66d66723139dfea2841b032473'
        '8dbc7fde5d85f10c23e9a982ba2af55bb535715f34395290fb2d0955cef893b3a51bc569272b5c4abc8b3de8b987298666fcc09e319094ad33ecead282ef241c'
        '56c7dc4d70a7278ac4274f74cb86667bd49b2d59ec69fb75e8ae457069b234920f9dfe6f30e23730fb1e155ebfc4d35697d0b7a68c0d37e853275126e6f7f515'
        'fcb7fb8031a1f950f2a4fa2fd48479a708b48803fe06a02456a648c1e7588d04db81aff04a035f248f48398a9857391b94d1dcf18d808e8371283229ffc992af'
        'bba0e4aa327b3f34adae877857bd6742e5778324f64888d3e97eacbb502b0212e1a49195825829267e954837cedd43bbd6ba2f2124012cfbb09bd9633c5f5581'
        '28928abce5f1717ec4893dd7af82fb7fa8da5f0b8e32547a85a48794d82ec8e648ec9f3c71ee28134c429836df27b4c8cd3e0fc1260f96623af450c2c9ad8a79'
        '263d40b1e5ec0aec13614054abc1fd86cda4c1f4aa92904b2cef498851effbbf03d6258c59bfde6b24b4d6c742b771e6166fc46ddd932b34afde019f6f6666a2'
        '9cb158834a925405b9bf21514555d01ed1b1cc79aa1ea20b46a1d9bc950d7f4e4d7cd9d1c4cc33ce7af5dfb1687a966570f898874dca445f571d9fecdb34e0cf'
        '74d9d945565a6c6615061dfe9f87fbaa2ff2b9313d748063a07a29d3d639b8cde825eaf926383e01bef58b438e813c6c1559218e55a5716f2e2ca9eac74aaec0'
        '6f8a8970b4d242bb3b2e3267115ddffb22a340f8104046afdf4fdbd5e8f07d55e5a710b3afcdaffaba5e8d16a923ca4c7595c76f37ecd0d551428b7872325171'
        '886087cb938d2683802d13f2eaa36885c35203dfd2d8759c99a1ea0915fcc14436d9e8dd61d2735c5ef073563132c9608a920e65359c9416fb8fb587118f5090'
        '669aceca27503c7a43cf02b37219adb16ff9263bf7de7d8ba1cd8b965833ee98b02c1be75ffcc75aecb0ce794aeb80685890c85214b823696ae93176bec3af57'
        'd43f66077993f0c44b49691976b1d901e91c45cb990ebb1be38e499d5a1aac8edda52074f61fa912208d272aecb6de4e828b2a56b2165bcd49837c6d7e7f4bae'
        '6588d85898ceda60e83d4b8bb3b3ca758c8adda9722149a02610c5dbf203494f2dea22387a55ecd32b8a0d5cf398c18dbec1558d72b384aad1f1dfa3a8fec215'
        '9854efda506843422f09659229b0f4719c4a715b0c1c03d5556969a06ed38faf004ef399d456da509c304c53fe83d5654e1fd9e430cb7c5113d4d3afb462ce64'
        'a67a86139042290e58038383e447079a3e0fe4d1aeb3826449f36ecb575363c3a7a265eaec8970234ceccbd5b0c0b4b584a9de8cda88a8bb5cbb79ec1099197b'
        'dad0b32a1d182c20d994f1990e36a2666941a3149fd9c4dfca6da9b7e07937401aaf7b2358b75f1825bf69d340fc0824dbbfe9d90ffc21a264c40be28ac44bac'
        'fe79ab4bca98fb44727bcb245cf86a1082c632bdbf1594ddfddfa09d370fb301ecf6d8671ee2bfe42008bcb5524edb22b25e21edc9d89200aebe7e49eed15d08'
        '90962dcc446992e5cf76af2f934dda4f9d73e870d7cf83a79b3c151e2174e3353a54f2b2041eca91664752205bb1c18f60bebd2ad26dee34d483c686f1e65cca'
        'c707ec0fc034f8313c782877a26882a026cd53abaaf6463eaa853ec01b233417914dd8b3d1c6a9f2ca7968d99eb1c580e33d92ba6259c99d90b7349d5f4b099b'
        '88ed2e48bf843f5596c51df060c27a8ab04a601c0894c4f7ac1a40d5e9ffe195e6ce9f8938e6505a643c599366e5efbff8ba22a14ce6e35a3f436e4270d92fcc'
        'fe12a760e43052c4542c9dc1ff02a22234d49426b054f4da1aade832429199c88d97ba63c98dc8865076506aed6c8cd120082b0657d49bba1947236c6e65951d'
        '864d1c17d3ebafbc07a25e03f984bd4ca15abf0da9fe373fd006b53c174023d855321de71d943ea0939e0207bcca0d3dc84f6eb8a2a17ee93f0fb86f3fb6b33c'
        '914aaeced2b665760f912c08d135b35d08248148c2c6a60336e409618d663b286fdc99abcb8072aa672079b55fd5d3f553da3f914b2a3204d4becc14bcce1a49'
        'efddb2ff0289a0dea295b3d8ea9f2384f69422173be8dd661c451ee3641f92f4b627f6089de02e5f38b106d9ce58ce442b7de5f0a9037b040eec8ad76893163b'
        'f18f8bca1c6622724d3403631ffb4d639092de51224de4845350eca54d0b8f12b16ae38c1887fd18aec32be7b1a26a8aab09d92fcf2ddca8086a464ea37e37c6'
        '807b1c70a0cef4e85e629b7ae38a2d8a4f97a956b38c3dfd8e1d5250040fc64daf88f85f30c496e6ec0b128a7d74120821839407df18d4e0b7ca800e6a2f5ff3'
        '554f7eb0c36dae3a6cf5021abfee604aba359c8c21280d92a935376f91e314118e94f49eac35e4c3537d7a66cb70aa1784b674ac1a7f69e595917daa0a29f686'
        '56c831c2a4d10b48471e6c732191d525716a4e64a4ce22822d94468a576347789c579bc8fca19fdc1bd4aee37ff5cc0fc92f5067190df0e0f574f8f7f686fadd'
        'c53e8b49c49bec6865c72072cdaa065f86eb98cfe108414b9f2f2ccd2eb481438474e30c475184043af7c1208bfc75b2051deaf7fd8dca14269dd5f49b294899'
        'b2eb1d2884070dbba39cf45135d7b5c2f3f2d0b1fb9356170fe6fda74edc6bf5240a0a6907695f748ba9905f7068e44a8a24c7aba205dfbafbcddc6ba1672a7e'
        '8082bbd71bb592fbb45ad6ccbd164b63376ed8e80e4c75dd60abb37e30e3d5eeb19b2591e3bc5cc27e2bfb014aa6e785e9743031f8e904e2ad8ca57b650db949'
        'b306db73eb2ae2b7630bf6449bf2219ea1873652a3c8e5f010024af98e70813fd690891a5bbe6100633f6d029d41dbefad8b265b6109bc84c29294e8355dab4b'
        'd13dce71e5adb08ce6cd51161d64024460ea171dc90a828d9eacb38f9eb4a0d54dcd659093879a967d333cc0590bb0924b652a664e12836efc7425a6ad030d75'
        'ab44e2d2ce7e8a1a6a16769771094755927aece983de720d8c0121fc41f7807e67a2c9a46ad8e62627f425e8ff2e4df439a93cb8c66d2cd37c3d595fab9e8b9a'
        '742547b67fdb790dc76ad0e4d46fcb1e5ff77b7b523719b6f25751dacc6313cea4cbd2afeb2d22163f849a492de004d1f75dbd5369fba2a926d04c58c57ca64f'
        '120545155ea10440eb4cb4043318bda9db6e8a653c4751c54a89bb2ac7bc33528fd7a50669a3783ba4fddc4b9b584eef1a68e29ba00e183c61ca7733ad089cb2'
        'b3b724000d1a18090852cf725719a700951b91916144c459227096d4d1c412f933d33b216809915913df2505aa1cf748cebec74fa220ff9f20a4020eba64431e'
        '829c863d37ec434c1581267cbc6444a8279a3c59b7a93084ffe2e99d89cf6575618c26a5739697f13b80a24a5644df5de8fa3682c0663db930df0f8f1b719133'
        '39066458da02f0af5474b99d063d796abd7861b306e9eedc9cc09f4a8f815dcf4a4aee6b561bb9b9bbdce0ff4fb3da9c61fa59742683ee7a8961c585b0ebd5a3'
        '205ecd6a0ee080de901401815ea35fa0a74bb5fdb69700ca957847a2eba3c05c142cf39f34530655330f04dfff065722e4446f61462bc1968da47886371ee537'
        '1ee1b79eb430c1af1acb51eefb784d774500ff1f0539aa2d727305b59ac0037b1c3219c534b07f31027b4d051c1599a4aedfa64eca0338e08f223886330184a8'
        'fcf109a4c81b8d4d5987a7af993eb1318fc2727fa537dcdcf2da2626cd2fc71a936355cf7aafc898304e35eb0ae90a686c6d68044baa65321011f7a68fbccfdb'
        '6ab9e87fdfd7ae4f913847fecaaf5c4b9c874d3421bb50a2a800f69028e67e820e332fd15d769f83c4d25ddfd459cffd98eb88eeecfa3518140ba56ea84af038'
        'd5f2a7ecaeb0e0b72715d00fc87dacf6c572f64dbe19d68b1d8b69af9f9b28f29d36c5b2ad8c712c7d09cbef3034d65679327ac80b21fb905a1a1b1561e806c5'
        '2c2322090ca50226f6d13a84650b17a7cedc8fe0867cd27cace061f104cdd7c89b24ed82109884bf2d9abb7fafb62a9f320e47219ae597dee46642294065106d'
        '21339118950b39e6ff5dc044d93eda362625b96da667be8f86dd49b3e7ce6c074c29cf73b6eba086e0e115584d66695ca07708d082fba774fe0bdc25920e73d2'
        '55fe123490893dddcd8e381a81962f6961d16c760a497ffaef0e9c42c9081e11a5056837f5fbe3bf85d58550cbeabed991a91df0d625224c53b99fe232883e01'
        '82cb3eb5504ed3e29033a306229cb19392f81d5ee568d357d9d0727d0fe0682501a1fe339ece5f4ce365fe9fb2d1c9b3a34e1b513231c726591242c2a1b3770a'
        '192412dd55b2f42abbb1c4812544c16e113e2e2c5c72446360c92d4fe458a9018efcc8bb862cefc4866f3d38ac6314f07e0806683aa7a3d348118735e675f53b'
        'de55a9a58fe3804ef3320a8df8f905d19a3c778143692733a7138c28587aa7172eeb0cd16fcbf69752404b21bfd0dfb50b2a7b0e3bd90e97b627ab343d3286ef'
        '01f79101e958a4a1e7ab5c23fe7886eb8bcaacb85732071d19e3cebc4e27683d49e22aecbc1882449229b3530b38294fc8a569bffa5187574e526e1e8458ab1a'
        '0ec0f1beeaa65fdedf7809b5ebf6435c528e24043e9a88ab30e811d63521dce9d8902d557f6b6d2b33e4dbbd0e7e74a555e2c024d78427644c3400cae2d81641')

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
