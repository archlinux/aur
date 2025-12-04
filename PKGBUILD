# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=25.04.7.3
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
b2sums=('d1d54b070bf678885b0037a750e13990784447fc1e4f03ffc33572d8ad85b1e4d303c6d6ee87fb90765b02b1bf4f5162726150828542cc6c0997ad7a8436c185'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'c343edad3288be96b517e7332cb2f2889391f9a3cbbb573e9f241edbd2e8a993d5cd1c8765e3e9ef033789eff322026e9855129deb2573e6e5ff9a010236dafa'
        'dbcb27b5774c7683b7c9859c5e3695dbb963bba80341757675ac7401113c5f789b18800f598eabbbd5401710a46b62a9c34cec427fd74a3c381d6267508467a2'
        '2c94e259649500f5f6fb9d273afdc468b51085c9b90c34971efcf8df7821bed6a6a6d593a3dcfe8f4e42ea5316cda6d418543e42f12e5fe60f47ff1e68d50e87'
        '40fdcc04234f3737a4efd0adf7ad810c9c17e77085ed4056149464ccd75e4335c8d74d69e8a3cc3820d0b2fceadbc96e7f49f2d63bee333313008bb20c245199'
        '2456ee836f22e1d0333c51fa75aa45130f2ac48501e0807a1fd50209cda82e3b9a6f39e8fe9c74a63d55c7278e5fbfb03676c11c40217159c4c4dc912b4a2eb6'
        '980a6f63cf2d28a1444eae2d3e31bc028ccd522f9dc08cecf3447d35478df8454fe1f0cd9733e3e14dead0dd141e0a616c8a68f212212ef3e1ad13cc34f7be5f'
        '45c0ad08827fdadf5cdc939e1569962d8e0a7c5bc2a923bb5b55c56969b35232ba6f515b8b1bd52d6f201519d289a437ed2abe8ce43121cb6aaee0e9d7a4b630'
        '9fcfb1948a9a2e241ff67a9032d6458453b2989a828ed6b2c89a423d52d130fc6f158f145a0c9eae08f3f230cc14b667b686161b4ded035d431a2f593a4c471e'
        'c063e5f5f5ab1e809a7490cd2827c842d93c94bdf7d8f706c95e4a189b3a4d8660d69166268db0cb2941ec90699ebe29224cc053067c6af949ada701c0ec85e1'
        '2a7b4a18ce59312648fa36c4f7197de4328ff5e444222c318824d6e2162236f5625c4b116f386c36a0f0426cab52c2f98e1da68c6fde9d163f4d692842f3667f'
        'fbfac8c3b7b11c49df6f033f91cfcbc35ae931483ae175d424db92ca7194ceda2228d042feb478e6d44c212a0a6bdc6bd6885979cfb90238d3adb68df77ded08'
        'aebfcbb5ec889aaee4287bfecc01431d0cce1de7bbedc63e5bb94bd59924904d4d618111a1c310d8674354fae401249e6d2370e414bf60c627f5eaf8eda1c61a'
        'e8c11a731a0bda1c52255d5b2432ff67ef798d81fc6bf17f72cf854a044ad4dab1db62f5f91c06f17eff26a4d5530ca35b544f03dd38adb11a542316248e3ded'
        '761afa494c1719fef85f6753df94a232cdc1740124004c2aa0638a3ee6dc879643bb8cd0e1629a0ea03d1c15265f605b60e3f659a7eb3afe6181088889bcb851'
        '314f250fcb960fd41729658335d8f5c25b17a5c808106ffb9ecb6593b44651ac7be25dc9f785dab72c256c2a93cbb6ebbba775852d7213de014e1504ff2fc0df'
        '82c186a360bfc854c0bd825929cd04e38f414e386551b0488233a3eaf64e5b48e2e493bc57868bb5d3bed3df1ac297a0316eea0c25441a4ad8a206dcc0455dba'
        '3c52427a416b02e6df515aa2134aeb93f64018342aef89b87d50f3596a152e01ad19df5420ddbcfe0f16270ab6aaa31b150ad18b36b5554bd570412aafcc9a67'
        '250d5c096f1ead9d87be48c6be1db334eae0c4499fe350e22cf3f6aad6d42017acbdbc0656af36acf4eef2e8a0a2a2b70c62ae3667e2fdcf676e85236c9e5caa'
        '7a592f34b7cecef6fbaf37585b47466cfb4ae3061a2d24ab48a3ad3d0f03b0a2debade119927347d39699f13356462f56ea18d29ae75643e83bedf13a0f8a3e3'
        '15139b73f977629fcdbf4f0350bef21f401ad1b4d1ddc5fde1e2d45bddb28eb7a69fd86e320cef8508fd93d187f2646480c6a5079a2b03c5274b20bf5ff3b634'
        'd5c935dd99632d9a97aa335a938c0d41489b552c8e581e407d1da359c98d3d6e6591a3aad40033cee02d2dba8cfca4f80f7f2f1eda5c2ef4215eb49859568efd'
        '85d68fd6022746864817abb54dcb367cf5d0aafc64ff79950820097dc5943830c2145620855450258db62b4ea1e4706327aeef45dcaa5741ed6bd0b31090ac31'
        '63f41667efecb60dc88e620522eaec6464b962afe72adfc2a45dcf3b86b194fd3c1740922c2cd5bc16d2fc020ebce2c02941a3a748d8cbff8480b38848c66c73'
        '48846a60830d4d6af0c6b02723633a9d8f828bbd9f8c0eb69f91d89385458ec331d5fd3a7b15cfcdcc02a343b7573c4d0c2cd739941a1e2c68f754ebb83b37f1'
        '633bd90d18cd34dc7d067da8d60972ff770e8460a27cd91cc842ebc2f6aca223b1735e36473a504f3a1063413bd4fa3e5d78445be701c21d91c4c7d99266d12f'
        'eaf65c82839e2c716d8248d8a5fa7fba752552734d364c1770b955a24cc7b84ca75c24c22437de82f10b7268f370bb15c99ea3a8aa91dbb59ccd4a8fa3342606'
        '994ea6d925bc7a5ce9fc690df29286b5ed788374de7a7b07e86e9d31718d9e0d2dcb6dcbc357a7972c3ff6769b0aa8770fbe65a0d25e2109ebc63d6fb94a07b2'
        'aec2d7d18b989ed43c6eff0869ebf28dde2a2895c8e005fb039322562884e20929af2fe16a0737397866b4d3ffd3f9d084dad7a150f2b07019e2a843ee515231'
        '97f16e187d3b295af4fcbdcabe220b6e0d2661a3221265218266c3fb756a292c759a5ff2fb6d456270a5d36333a67adc674cbde7b9499d9ae32123013fd514b5'
        'ad9790fd4b3ed926f0e0ab64fa089f3b44f828981903b080bccb569754a0cfabd455f05508b4b62575aaed7c1b27616e5db42d2db42335cb99cd5895ca90a165'
        'c013a679ef7b63017484af04fa944f213489be57ccf8c98bada771bafe0ed19e35e9fb4490d770be9ceb5efa0d12340a766282526369b956152f54ea6c299eb2'
        'c3ba3e5be94d02a9596b48331c42149183f03fe5a65041c5da4ae6c23d8edf7dcb9f2dece8117eb4969cf2e5642c75d8eeef7b811807e4d1538a800ffad20c7b'
        'a5dd504db24cfd9fb10d43841821e3a5fe45e6ec87b7c6210d920fe3612af2289d90084b8dca2f640f975f27efa49d18113249ae34ee312d3408616059aaeb0d'
        'f4cabf1ff5e41860e695e6378c3ddd5200b8cc82725a171f16148d1c4e7db45fb1b2e5259b2e03c66010a8d329cc481d9488e4bd9289b53d461dc3312323c8a5'
        'eb1efc86737d5af0d7ce40bfef3f64736ff215e0fe84a943ef217bf6c1114660da6b99903c3ae96bafd9f2ff6f8c065ad6b7060d10776869c3c30c583587f19a'
        '8cad82ee1be0e05265412333f90fa792b4fe4265d46c8b28979c38a53111c8bdf43bbb50dc7b544294d0fa2e448f75008dda5c97a41dc502ef33f9957471ea34'
        'a59b2d16cf8e656e24cfd2f33e960fa9c5b77ca07a880877702e366cffd0260f85ec1307cac555c98dc8bfadaaced3e3f20529947d1e0e713d0bf0f0b889496a'
        'f7d756f38d6c172d34eec9721f0f30ca9b09f99829dcdeef9c7ab3373e532f80d9c418bd24e0352bcacc51ac78f00d4d95cd664af57c08b4192cfd5ca182e16f'
        '8da1412d46f865e5517db318d33507f672faf6c910168c19224b476c22a9ed68d3fbd76695f7e86b9a97b3c60aeee8d3eb7a274b7604b6dccdaa711410483b43'
        'c33305cb7a2201ea58c8be4167c154a31cdb32b6f8cf0550d6785f2ec8ee8d39057a9e4e87f83ccb41a075ba18961cdf8c87f261c7b17d447cf83bef894406c4'
        'e81b4ef0ea09ee5d011cda58281cb72b15417396c10b206e2cbe1127703ee13752072237aaca2a603527646f30ee1b175973c6701bf8b78bdb3e6c940c085c7e'
        '61261e692711b880579775e7e0e87d443bd392bf4a693737128b2d9ceee48abb63183bd515c924caba3a796e3ac9335aa5a0b04b0aefabd12ec6c3ee72fcfb86'
        '71dbf9423982d03fdc1f090272f13268ddf6cf7343ada8f4b8a6c0e32b1e49f040cbfa0cf77486fdecf16da9ddc702e9c0dda9f2760bae5be8bcfb77ed3e4ea8'
        '0b49468c09df0358ef877383305f9e449d16089a8e173f61339756771312a85bff695b2385b76271450aff307dd9d13a30e1bb0b15152308752bb6d8f7378864'
        'e77f11cd0efcf209d6ef3fa1bb4176a345c00f481432989d6b231153b4c53bd00f8b703558b0c89e3effb645e7ab96f79f56c14f16b758670bc9c45f44a20102'
        '877a0f1df0f2df3d701913e633629e608bc2124d3d18c48fc5316ac304752b60e8c010a34ecf6d3d7d1cbc1cf27e8b305a543dfffe8af74ba38036ac98ec2da7'
        'c5bc263c97b6fd5f5b00a4d68523ec692b5dce9bd5557a5d11cd90f82fe85ca278d7bed1322bf37dcda6ca571ab2176636e932b8e7acb0de4495136f525b177a'
        '8bfed31b154cda89235c12034c831be3cc05e0d9e57592840fe8477f50b05b522ebef12fb8dfe8281572ca7a04eb1dbe59ee8f9f80ec3f9f6280fb6e7385e22e'
        '0174928760eadee4d58d587e4ebbdc76f6ffcf092525bed342428591d51155172d67f6269cddf937becd3b3961b388b502ff392c7e92c85e159aa33146afb602'
        '202c6538c6a81a170dab9ed568f7891917c14dc1fe8bedb5a095f2e7eb90e833d33446cdea34195a549fff2d278c971b0a42898e84a02e7a7cedf130673582d8'
        '2914dc48bec103d65a7e00345c208a7cc82bdd66256e4ee7dace3dbc933d9499b304e05402e8b4b8dde92b654a85091ae369b1a59ce0ae98b888cffc85d9f6dd'
        '0d55e5dec3ddc3274c6db3a8a54e696e664ffec0ba3d9037bc4ddc8c09e482a52c537f2ac7aa3e123c591dc743b5addc8723c4d6805aa82b53e5e777532daa45'
        '253740d62b1b7d48edf04aaea45c69db397d653f07bfec66c9b5c47ad66608de0672464d06943c407602bee17ff693ed321a5b72f0d22fa5e6663dada55eeb06'
        'e502afcafbd83387b13634e30c986a249331d0bb36ae2c07431f46faab6ff3ec29d16ecd3fd02f5ba377fa6985e68e89b82c09f65359048129dc1e24e922f522'
        'a176bdcb2958fc3b473efd0d2a051c398ea3aeea10f4ea841be18b4d29629ae0bea40b423ec9f027179a255d0d137686ce01f920b59652493446a93e3b72e225'
        '5220197286dbf74d9a2ddfe77c493923eea0455fdafd8252ec88cc362b0537200282c975d15385da7dda853d6ed2dd6ca650c9846d47c1daa019a5fdd3bb50ae'
        '7d38bb60cbb35df2779e3941c2e6a00aeae5c6f03abad2e4b75bbe828ad76e5a12c59043b3cf00de62a208fa72132f2b6f49c6f2d9efd926e326466c2bdfa0c5'
        '5f200f8588caf168e833ccd2ece05fc989a1b0c91896f4b49a68f7d6ea58fdedb807fa62df48519bcbe4771fd824d4cdd539375a6fe808726ad0492cecaae486'
        '216739235be781059afde6a70850b513cd2d1f5475f6e314623b0dd6334e4dc282869fe58023cddf85a11bca7c9b142a437f5e7a38ce21fc76a196fa5fe4cb00'
        '5af408d648435a267dd4892cc0364e80d3b6d6bfa31c4bb7b2421216495471653bb4687e914d86f2c4dd2d9d8e9570d2a20aaedf2b5a3ed5976f340357ec9ebc'
        'bb5cb7f1056632fb4ab99109b73bba98d775116aeb2e00c2ae08d9d344ccf6146a06e610fc7ec19197f98eb303d048cce9cc494acc3e26884e973da9c84aa829'
        '68722d3d3483e068e10d6b214f60b7678ccdf1e725fd29251409bc361dafd99721eb2c5b14755a1fe6efc557c25e7a7d4bd7675eb31e06ef5911c7011991501a'
        '2c017c278e69ddac7db6f08c8a75b889c2c1da82ad491d9e0c43e8a75e853603ac0c0aaef26483479c906b28d4be97a508280b4860d032d63cd5133d8daecaab'
        '272db7194fc9508b290f9076546dbe83a234280d99439d95e397ad0b0be43339ef7eeec597e2bed2d628d5ff149041bddced9044664839b3392041041e078d29'
        '26d8e344c5d92d3f0b997c6cccf56b6fa4d0b235488b3a708c4297b00bbfe7ddd608692bdcb50c7e36e851407afcb9c28aaacca0df78dc44d4c846e27c0a8d99'
        'f955f6a6b2d1380e64c566f57aaa87345216e79b1d800b74b4b1e688d414416088ebbcf8a9ced7af03e29957fa78f3f6f3dafa438b0f035cbb615950852db1ea'
        'bb487a1d986095df72cd158980239a040642cb46f3cacf56604edaf5e8e8205adb2a2cabce8c544e1367341847cf246d23461de4a7609070d46e8ad743eb1949'
        '573cba175391901f6ef408cd0429503d28234e3553c8f96d36d1ac6eeebaf255856ecc3fb86e3042b09fe39a8fa370e7a6ad5a8b08f3b1abbf38044eb0166b0a'
        '23614e04d279782ca6b26b535b0401fcc135dcfde062a356b282d4aa035bc6b7960f4c648959a060c88208348e63428f002934653748b48a97ff08da10489e67'
        '7c51da0d0e0f73ecb29cdd283b53c37cb5c4022e899b39f2efcc99700723d39f27522bacb2eab7246d0463295ec46e73958c8fc3d85690aa4e49567f651ac9cd'
        '667d018f90c4e386343d76f648aa2a7aed04e4eef4fcf12b528adc718ec41b04e0e9efa3fb462698401ddfd4458942bf9385dc6a11b1f02e83e78c33872c5219'
        'f2782ebccd422d5154310f050568f34b58f32876cac4c8295117d8b3dd0bc520b1572065c1eccf232d6d3d981e4dc702d266a9381f48102dd478730b3dfcec19'
        '5a4824b303d5e1825f95015f729813abbb1c4f173604916d1770aecab62a4a96a5ae02f8c992bb529c661ebdb926356b059beda62a49789c0b288b4cd4fc9cff'
        '78422c0128e5d307934b2b1d11230fe672a34567f95d943a306bc326244a14d211e1ae98748527540f57840b365e0d79533a6c533b9801c001418396b129839b'
        '00e099dba3340112b55975193862cf0b0fb70168b8f1fa2892131dad8b927954b0930ad24e33258818b5b13908593447783c19964a78d440236ff961cc2b8187'
        'a7367d53fec215053146ef2d791e5108434201f46f7efe53bc02c71c6b2df6cf3379a9d8bb2e28818d38316ac9f3242b5b4de61493f27a8b07d7b8a0a9e62f53'
        '8b6142efe1627d7e9ac86cb954c088eefbf89fd0e37ac2d087cac1ffd9b09e8f6932f7575cb0252b824407a0e5a40a70de26db79d2f8e26bc6dd08f3d9f604d1'
        '3e0e63b3edaf6555ab3c299362c332e8a45d97ec655f1c1a7cc83facfc8b77c9ace98343a6b2e6e191606555c2ab7be2186b28760160aa5eca66809684f3a99a'
        '3bd0ff476a20b32df80ff8a7f86fb4863a14f7551fcbeea5b2b81ff84c2909c8980be8d617f0fcc0c8bdd870eb54a71c280725e3f03b2344c19ee3a99b14c1a1'
        '658258b39c4595184684d19269753ff7830d39993735306182e98976c75db0555c9a724d9e86a949a22699221b04909a5b65d58435f6261075811b2fe69ff124'
        'd7f501571609ef8afa2a1e9258c11c5aa2ac500a2644875fe4a4aebaf1922e3458962ce2a97030324cf3fec9e519e4838f8afeb959169fabb6cbf8bf9b3c46ad'
        '693c4b9900a1306efb7cfc37ff622a3b13d027c483326b10c494c523b261dd69466b733d23f4e0f79f6bc6293df2d259f6726290cabf1068c040046e572e723b'
        '37243bc1a3493a126099c6866e969bb6b7997d236421904c3b1f91463537ec25b5fe2b5accdd87d1656a8a32e95d6ea7f4c765392c79831e3ded16c1c12a2a0f'
        '50f95ecc98b2aea85542e7949d3a2bd76f5a92092adc62141e0d3f65c7a3c5dd0ed6cbb34f87b5b806f275234af9685f85995cda4027dd05c71c9a04c2fda18f'
        'cdb48cbfa77e5d71da4e324970d0a74206afa99fa7cb9a85ffbb139adccd124466708ae4027fa930cc3dec18f676bca2be14817ab9a5095f602c1048f591890b'
        '03f70ff5973d840ca4cd7fa541d92c0667dd6b1a60760061cbbb5c1a556abf34502c61a915c2aaa9ccd1bf3b7dc00bec5079ec4152725cd588aee84ae83741d3'
        '538421b78b4e21cd78973390f7b6101a18445930973cf0dc904d1fc31f850f22a008b8c1b55c4fa6e0fa3b2134662a3e58f30cf98fe36957b700078f353d4f6e'
        '0da836059b79ae9092193a2492b91844fa065f08628466b4829d02448191479ed20ecd0f6109fa4153de13e09a6326022f0797416a486bf10370e695813f8e33'
        'ed84c59b2b0652f150c126aedf399feea2d527cc25b70ea791e77e50f526b8c279a92a4d66b20d9d12bcbccfbbc237bde9576fd5e9b78fc8cf9a6f0446780840'
        '5491febfa77c8b8a3647abb48f12d7111156d3416f6bbc8fddf25f5c20a1550e9207b85d7b7712128fd04f417002381812ebca7b5331f914ec386b32e744c1d2')

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
