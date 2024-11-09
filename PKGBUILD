# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.9.2
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
b2sums=('7f3de2ca7dc45a6f231312a651dc40a7f463f770d45b506f359c664e1ddadc52686c8f157f0388ab11909803533ceeaae40da05d87133268b8bb7e7939e11941'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '2400264da0aa1d3fa3cadf663e5a591fe4fe485dc74be36f5741505a2de975ce985669346bbb4d170803a5a296583b7c1d3e4081cdbdf83889d12fef45fe6691'
        '35d90cb43dd0b23b1b1720c94af7c5e51f2567c73cefff85728c3ca32d47da7a1cbf784ac97ee998b16715819608241e701c20906a5f3c74abbd3ab04f06c834'
        '0ac0be6f2ad3f9cb93a9c54d56aa3b191220a56a0677f5a46331437f99d8ad0787e5969ce1894b16757d5154d3e9018dd97627023dbcd3efd4733b399b9d1b47'
        '7a740a3d67755670ff068966c6c6dd92cf5d5e80614f0107460c5254978d8c4bd470df0ec5cafb2c309390a28986c3be8627e712969418eabcac51438bfae646'
        'a35672d8012fb6614cd9d791150368423078faaadd6d725ba4ffd9c61302062746ea628e49cae998b5901817b3de758f7ad4070660ec0b7eac5fde0e20a62e91'
        '817bcd324120fd609f3127fe500846aaf0e24cda4f594014162adbe3f6a52ffac06e8b0aa3e307bf37992338031dded6ce16296306910843f3c12ebb26132054'
        '9c5e894619cd9ddbb7a0236c9965c819aba9a363062098acde21e98788d5667d277b5a2cbc7b9f979fba04661dbcf0c7282c0e222ec1821dd1881dab70cda842'
        'f0163d0121fbb36f95e9f1d38e9d3143040dd85c3741e4c8d1ce21d23ce4fcfddbc706a85ada347db6fd26a10e547dbac58ced3e007bfcd88802c388a516c93f'
        'f33a166c7c1d3661bcfdf17a180130e08556bdeefac3e2373368574684c3487d4a43966b6300f694279c801b938e4a80b4d6d54ded86408e047fe53ade2e7664'
        '7d1c3a37e26c9ce1e6e76e287d24c9f5757404a74776f0c3de4fa51a424053afe3f6e43ae707b355c23b96ba13013bcebcac8cca46d7c7c4ec813e8599ec9966'
        '44816bea4227502eaa9b7bb7fe1ebc856cff03b3fb1bf7ff6327261f0acf0c21c9e79fb942d14b988579413afc5959716f88acd3ca0c934ed9d6a5b5d1530f4b'
        '3936b5a055b956ffe8834267c491d5f46deef96c563c3c2b3550b204f4ab4164546df6d269d633da446b0a1e4aed524f5790706bb00684c12bb8cf08cd74a184'
        '194a0795ca270d261a1da64cb0d51a6f227cd06441542f5627abbb86656ac18a5a9657ab6ea89820ac1a2d365af8675f128549ad28bf828b6a572f5e7059dfcf'
        'a2508e66c4443199636b201a2b66fb09a4c9e49169e7d18f26b057d8c483ada6e978f6f41dff4add4d59fa9c0bf933ef08b288345b1581a07ac11531dd105d7d'
        'c38c9afc0b535cf50cc5fa582c64cb81aaa3c15571606be989c9ea14ccda62c3ddbc224daf4d2499b06138ac35b430a49bd9eaf4194ae5177f6a946551f2fa3e'
        '7b6b5cc4005351858509facdeb86c82bb730be9e14bc8488983bf3066427bdf085e3cc7a9e56388b4b440e594c3889b90d13310402f92582963c69d3f77e6dbf'
        '026c629cb4d12cfd83b78527242a7d825fd7bfddcde3598b25df6cb257946b77126633a0bd328f194ae1c5e957453d0043afa90f5f48644f4f11df0a0c449ee2'
        'd6130da108ad01de0b58011179844897242cc7df5f9ed70e7cc6dfc97adceac10dfe51c863f5ff6f00b194353eb694a39e11868898caa746fe3f09645a90f88e'
        'a4926636fe3f108938facad4fa58744b6d1df1a78a23dbdfdf322e34ab7b3304d96336ca70d7c88032e4ecee0c61ca087c09bd292b03949ef623a874ff8a0870'
        '48a3675e3648b0fed8c12f40f46d87978627f02bd29fad504df96bb5db396e6d06572633cf823ba997ae6898f1e8265ee9bbef9c47c0dffc469d469982f8ed3d'
        'a3c63681dbef896f2e90fc36f65f70fd845a9d0f3374231f5798e21f7c95eaadc92ec2ddda64a5686134fccdebb4a6d4708b38afc6810c003db31c78cb35495a'
        '3feff92b36c9fb507618f2077c49154fadb759abeaaa0974e04e3eff2cd5b88b7cac835cc1475db682d12bca73929997f1ff9e0a1401cdb2587403b52aad609f'
        '7504b7cc007e5b5328d0ff578a068f5e7de6106318ae5653669d7673dedab4477e8249268fea942527f69023ce2ab1bf2fddc8338a0a7185a77a7b32428048f6'
        '2aacc0f11e956f0b0c14621a9d131cf6658502ce601b2b7c4852abfe7477a51b187644b7ef4c5b85cd1d526561f6feddf36a5cae4fb500c12057257f3e846fe5'
        'c1fbd2cc8cf199aa5f546721e1165299cd7108be0251e1632d7f7602a9da7c1761576670a3a7b298c57fc971053947dd2097a03764e40d972bfdc8f4589b0edb'
        'e69ed2d674f2e7c3bb192562f8800d39785ea6a1e394c19171d76aee5d546aa42d700c340e55ff327cf80693669a91fcb448d7f5bfb22c86d965b9c4e5974240'
        'b25cbc895288e0fba81c12fe450ecb600435f1a4285959e72f12f86081437c8eac668416a2ba8525e1871733d2bef32ea8e89e03d9b8e4f02f9806289daac20f'
        '862bef488cfa8989b47700101b08f5b9bb6a021c75446941023e97bc7ff0311c81c455de227280389c4d044c0d02748ad27c6ceb26818b8c6448e8ff20c132f3'
        'cceb22566e67eaf8c84f8d1a0c8f5ce93138804d77bbb77480669bafb1296442b812b96eaa3286e08c5c6b67dc589da7685dd360afded81e0f444bec7d5aba5f'
        '87924d73a3bc05cabc97af1569a983378320dd49d1c96f03c47c97e832400c5001f909facdc2250b49c8d95b45cd5e335fed8d3145d45ca487628747e23c3fc5'
        '99649fdd692ce274a378217b6f8a3779c7b9c210f4ec90853096f596710a5ce224ccf3e2d9c34dafdeef8a56228d519929675cfc8e68f227423b2ab781fc5103'
        'd7a176f3e27336088b2961eea5e82051015f6c01c9ec8b7d5a6bda0feb3e4f9973a65d9e2c3be1f05067cd44a294ca9145b0efc039c67e6e8adbcf07f9515ddb'
        '32e6412eb0f150215fbc23f03bba74b36b2ed12d61adc879590c758f377f6ac8b7bd468e11bbbfd21134f578abb0c23c2542ca78e5b06afd26c47f217e98418d'
        'f26a84c08f98920bdf40a69c0b0059b63811e4eee9449be99861653f186e1d54f84b0cf88df3367c549dbdfd18a5416362f99f3e65ac011c5a88dbe6ee943b1b'
        '0d6294fd1b87b4a49b7a5c674dd4dde97d773cdb8f27241247820455633ebb587a2f736840e31b7187925e601bcfe337b81eb84ee7dbdd8492159e350f1bd084'
        '3fabff678fe27bf2446c37914c01ba78ae4e6e319012497ad5e576a02d6a960dfcc524222ee00b2de891eae497ea8c12afdd4316a60c0bb5f2fa648bab0b5488'
        'df65d7c4b87d9d5724cf2aa9940e3fdcc6c86633b43eaae9171b776636aa070d4238b9b564d31acd95e7aac2ea76e5478612fbe4f8c33c060bdcdeaf47047d5c'
        'f4d958a4ff247faeab1f9fb73e38b364f2fb65ec1453459b1563d3f5a84b1646d116502f4119df71fd3bf6a2bdae67d3fe9eaca223600134ebc034bf59349527'
        '5d8a499a77f60d9665c6ed1b09caeb4c39e484a7953f18782d0068b9a28ab3bcac6e8b644ffe877e0715c7995339819c30edd66f2d04de1aafd3b40b38c859fc'
        'd939c49e59cc8c4b8336c5552899059de8de4891cdb0820815cc7b7187fee8adcc696e3c1c0414038955c203c519d65941f7c8e0f0f12c891e2d77c630410f0c'
        '4b9034725487c08effdeeef6c8476ade1ae4045871f2a5205a4eb13112462a867746cf65527d054abc87ecdeab2895e93889491fbbe06133dc28ad5e88a66c09'
        '6c57b4efe557a8c00972793670c45901d9d9b604bc5baa6112f4cdc3497cb160954635d2e0a20bb3a9fa1690531f3bcc3a5a5668db97b59a9df0ae93219ef90b'
        '0e104cf65ac0285444caa8de282c62a0f7854488ceda0c1a0a2a14a138f739f10061509aa71c610de0e823a34fc1a77d059c3b897496a76bef9258d2f29b6be1'
        '7ee33a3cfb33935a35aeda9544efb8d1cb4436c8ded5cc1fcaf0a8bad474514b5a9ae88851f501ec323cfaa93bcb8f6ffa60605c14c57031d0c0ccd08b16021b'
        '18eacb976e50ccfe14cb1c98acea22bf1eba1d7d62707717e67d7ef84cbf062dc82e98be2c4ff02aff417875896aa7120cc663fc1b6291fe07d5d7990ec9ad6b'
        '67a2a090a08dd963c4f7ab8a8537035b37e7028c99b5e6ea9f6bf1bf828b7f6e8e56a743cb98ce6fdf545db54593cb7d997a19999de5c0834ac8b0cfe89365ab'
        '4dea7dc9f3d8df96e2fe462f31a49c4454ad829a89b86779932678c0294ff07f21a9876a2cd4467700fb3feb19657c9b1217d6df0056bf9762bf89b484171a62'
        '738f5eec73de5638066cccf5b101708736e6f36ef0fac0a19f4f51fef79990e8203fb18f8cdd452b0a123a3c4609da454968b72eda70e078d91ad3a6b6122260'
        '1e0f7375758e75e208e5630e38091c9f3ec89ae9a8619f5de7f3e6a087a256517a5fdf45b131620662ddd1c96759f6d2dc3496d272a2b7781f929445a0a50461'
        '10eac13063a3462bfb90f911eea1c2f88e864ccf3eb12f07501a5415c9a2475a4564859785c1bc78ca94cae893bbaeedd621ceceb6b1f941f826bf535f013416'
        'd5b3d0308f04edd07dc540e9308c2e7d69c24f35314880140224e79b13ba2f72d8a3fac27718279849628aa2e91f7cfdba861f755860968710e72f861c5baa90'
        'f2ffa292d7209ec325b79baca7651ea841308f670fc061f551b0ea16dd4a254a4bde3af3d45ef0f13f3aa38b2b99147cd2af69856b966e5eb93d2f777b271b1a'
        '2ed52d16eaa1a5011396c4bb4041dad67fdc06eea2f76477b4bb41fa90f413542dde46ee8a75c28792438e7ceef77629965f000249a565240a44c925f9502373'
        '0719c2747c04d78aa3ccbfc542c72d9fc20541cfd724030beb99e628dc030c5e2ce83351a03460fce0626cec0be137a734d48e34c0ff21fd7382bfcdef6d82be'
        '8f13652e87855fb3eceab8b28b4dbed2e1e4e0327b7669ae1a52196ae7c0b3f4b7bff56b4b0caf6fabf78cb7bdeae524f0c97ca811ee088442002eac1cb7ea0a'
        '3c0d11740f170e087c88ec0d51f04dd001302fb2eae501711f5dfbc293237d94069bf835e233f6e299ef7da6f8f0c88e23c8f0328191e95203d28517c18ce0fe'
        'e8eb9ea39897abf1307f60d207107a4ea31e574bcdc8df9a6780224cf82d56d8eee681960ef143b9ab74f599bcd1b25af69891d881ab1c0033fd93558a1bfde9'
        'abfc5d98fa4b1f6d9c23053412efc1ee45c02db1244958b44479f1c1694193df15eaacaf81a2fd515ad7a09b88b53a0d4ed7e668811e02f4e0510d64e17b7fe3'
        'c2ccc62ae0b9ac9b07aac186c5e2e64518a6dc30148d9055a457766cb4e5e7b9162b970f841efbd44d80ad1b98ceacbfe8969eeebada171309c9f047d61461ee'
        '08596b3650f36bc0148d2635b06c7527d069b974b8c588f7db5eb7465d84b78686e5dc78447f0e7cd6bb21bd04600d49224f565503884f9cca72809119c69b91'
        '0e620b4e1ee9b0bdea0cb57b7440e4c0a0e7713d77df4333f2a03f26eccb7e192809591fb9a49ccc40c5e0140fc8083f1b6a90e696cf3b07001b87bbcbc44337'
        '25a20fb40ee9a59904db7f981f07caa8f04ec15099af4998957c8ce68fa2af4c7bd1fbde7d232833f068c67366d714def4fb34eef1531fe7e1272b877acc1e7f'
        'd1efd25551ff72f374ca68c358764ce47b2171d1aab04f7e4a200d390bbdb5fbd6a4d4932d866db61f71ba19c4b846d2c06cedda885d7422493267fc01f9c0e3'
        '12574d980f433ad243244cb694a30ef2b625efecfaad54f02e3f9cf5b1688e5bbc843e23d5d2177f1bfd608e569232f1dbfa4b833b3c66a661d973cae0cbb4d4'
        'd82fa5d3944cd984d47cec4d2dd90c5cac42f73976596100b95e4a1c5cefd26e11182e801eb969d6f4d2ba4a6e8afeea03400fb59388ff3d1ea9e2c9bca03eb1'
        'fb16f90aee19354623a97fbfd022e4eaae9097128c2ae518b20f6f7009e1b95d4561a55ae8250326548cc1b1506e517c15362dfb318199c588a4810faa3afa2a'
        'a5eb6d3948f41c41fb57af913882092bfc935f3dd57fe88cfbbf5ced75d26e44e30da87ec34330e496fed58210e4167c0c5fda9f81281cb413268669ca9abc34'
        '7e24e133e1f8e42de5c4ac28b4fa2200a7a80ff71a15bdfdfb4f87a5e0763ca6b37a3859c1b4327e8da4cf0e5041f22989c83a98b17392b860961ea09e36f798'
        'd70d1dc86a4cc05456c21f822a184e22b5030df62ca98437ccf40f774d6ab272aca0789537af6bf17eabae3c1787aae39fe7bb1720d4e044020c25e7a3d7089c'
        'a1fdc9edc4ea48cc8c59ef78d207c61bce82e9768c59c4c97976c0618a73c4cfd4daec4b218c435053691c3a2735c8bac0374e1517c7633a976d15eaa98fc184'
        'baf383567242cd20f3222a2d06f01d6840e577514a296f8542557d72e2daaa9b9823782ff18a37ef2163bdbf0b27681ae1d13ff924aa178cc968f707f8cced18'
        'a88b92615187003042a83fb78efe5d77d8680c21b37dc549c0f7092e799dcec0f190aa13a087b846cf4e9a5acdd304964f84b3ac3c4a4b3442ac892fd0902630'
        'b097801943d99688e621d5941bb68f15d5890d9314fec0dc60627c5fecceacfa30e846ea2a00c24f8beba0d081347a14fb92f9cb24ea937a595f9bd114edc2a4'
        '61b35d2b4d3b19e3e5e7facf87a78a2fda85953a281dd6e0452a19ed9b4d3789b70556320f4aa1e56c181403c9c5d74635092a19e828535cf9dd9cddbd790811'
        '8d9b685e03b2c75bdedfd11bb309eebea5a6b0bb87401611d62789715c3802a4607669680767892f995a89b29c35439c5752ebd450e910baa0d07673443c9e97'
        '31b92b6103b9e8ebc29c23a467c4d8383ee8758e8a00ffad9d74a41a27148098f06a33855159134f40c608241ff2d893a064fe61a7e206d24206266f217e170d'
        '5f7a23106d4e741e8e22237af802f319e92aff4bff5b4030a48432a69e0be155f1202021c1a8130da8798f502a88d9ed90259fb6c7f71b2e93980af1317fa9fe'
        '4e23474b8a6108e24c1076e7aa1b94a5c8a7b76ee8ceebc8ebf72bfdf18251677d6cb8699bb90414727781487cc0683b921ee254f93d16751e8af12c52a6c407'
        '5e1cc8e8794fef0c6f9cf8474a91993b8f13d1984dd71e02f0a894dec50d14c32c6c955dcd376634c2ae944ae50b89b295703cef9d6d43b4866f68f3f5615585'
        '17c9a67b189dcfe5b74e291f0e3f3c22fe22faec393d6ad15ca6a496c231b34a837e00068cdc8fc7349fc161ec80ec5fa8256e4eab3d27dc85c7fdfaea5bb1d6'
        '416b87eb30493b90964fa537c17c56c02e4bb8213e7f38278d4d05ad61f89aee590d32c2e97d2d8fbb29ce3c84d70b2033b8f72572ea39beaabe36a33b0ef1a8'
        'bce7e65ff19654686f9193f7fe915ca6a3d1d0d4917035a147c1cb8b8d35f329b56bca90bb063b8aca0d63822b1adc0df157e31bcb7fb54d5eb34bcda3ab9fc4'
        'd63686e0bf638a1a503a5dfd8b3f0e6c3cef53043bc6bb285500a99d478407d11fef64ac6c1e98a0e3dbba15ea0cbc75aa62538b00426d19892ec1e3d1089777'
        '1a9ab227cc7ac56be769e5807b6645d3e4e4711641be15d672c4c54e2847b55ad001f51a7af4f4f2c5f91f5657b9aebdbe2cc14ac3cf8faba5bb2e790ddf4d13'
        'd38a02612b5508f548b418fd22fab91af7af5f8d094b4298c899d90a456f4d2c0a3d826f5d247f57542fb2bac53d3949574812ef605346729dc74f16cf197700'
        'cad2bf67fa24c81cef79bdb76fe0f3d1deb58a6bd8cea6709584d4f6df7e35edc18bc653081b20948bba75c808f1b85b609707f5d20dca168d40a4cd2d32c122'
        'e2be0fb53e86a404e1da16a14ae0a84030063e2e515e02dbe0e618bee0dc95a911ead31054b432676f20be502fd486bff9f010ee1cec5cd9edc78102a7ac70f3'
        'fb1cba35758cfdf2a19413e08f347067e3d6e2006fa0ec2d3d997eaddde254ca633c9a163f325927f944f8e440c196a7a7a0900cbf373a69469e7518e53b54d5'
        '86924631fe0a55ea4e0a629ee71e03e48a21f916bb73b411a613566651d59ea7bc578794530596c6ed5d200297d7a39e49acd6ae1190e029e7cbe00017159f8d')

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
