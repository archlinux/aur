# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.10.1
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
b2sums=('b1b95dde75b2f2de3659ab64fb4919148d6d892cba290898f8f47bf05972e0a02dbfc5ee7d143495f52ea1ba78d9d549a5c489b10c66066d01d539ec1f0e1239'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'f8f6d0463f5b7633005f1d0469e4be42f518bc12bfc48f45cd88d293e2d1caababa74ce6396c4ec17018bdbd58233ff2e7e3b9d07f6e0ca1ae77e146de3dd197'
        'cae3bc538852f355bee2d152924f3ecef2b7493b857049c34fb08b8308a6a7a7196f39cca29a571f2a9d84c01d41d5344eb4f2c898195acba30845463047081b'
        '9b37675e5b00e51aa19d85b3ba4acb68da7092c8fa7d7b013c4fe7e7025951e922382d6939e029665e5b1273730b1d7db6ad5fccae71d9d83c1c35bbc5e0791b'
        'bdc8f01291b5dd4a6b2a54f6dff1bc8d7ca4cb6b302c345e66c4d1d6f0b271ff31470a9447bf798dcba4b420c8df6d5b35be331a0c9b2438a496695b1c528890'
        '0a6dca3d9d5edcc4b9bf90d638c74a7e38b584763415677ee59313f88cfe95a7a46e560255fd8292a23810eb282f7deffaf378be8190e567ff5d42d0fe646cdc'
        '28ae132bfab0b170ad851562e9ec14400bd05b23312c23dad2881dadf9fdf10210b625d0a35fe21945c530de1360e3d83d7c0fdedb51894a6511e3193625c9f6'
        '21260b8c460c4035cd6823ff70d474c3e53d1c7cd4c6b9ffd31372533f52fbaa963b01825e15b7aec255b231f489ec105e21ef47daddcbf217a6a5049015ec06'
        '32acef00ac49bd2562b951c3161b4e1bc2565979836179f4aea2fe899355133f92d41a448caf11058928ed19778e82f4bf2e0d17ec783707a8a825a81ed5c1e6'
        '5b21adbb136daa50d313074892c6972004b8809a0c92b320a4468a74f874829d051430f19b4061b22ee30fbe40cee92a98d53366fd99d312b75f50ad2c15a234'
        'f229556fdd1daabf45a4b08bc5c788d28df6a094639cb1c6db679fbba7709e39ad0b1bea797fd0e013e4e3016e6f4d6d5cb0eba6ccd4eb9627e3a16ba11e2483'
        '738d531fcd0eaadd43a33f7b2f845e62d578fba1eb17183fc47cf7105753505c25c6b9bb62cb21a39c0f75f892c535d36a0f5b1b46aaf5c00aa12ae9ea7a4c07'
        '9e05a65af0c038d568ad1397f8b7d618f941498cbb03eb71de1598b614cc69e56a3ca2f54da278885bccf7abf1596aaf2a72418031cdf7005cc55ccc341d1b97'
        'b0bdb87b5f0457b085f4a4c40910bcc3466d16ae667bcb4144254fddd483221685f24acee1fad5b74715bf2d6c2c08f093e34fac241c006a7a1ec1a3792c103c'
        'ca9dd0bf734ef755ae69d18a426f80677cae71bf9f47dab600c9be3c22d048f859ad7aaff798a1bec3b439dbd90939b887051d2f726e234e8e5e276579b63e75'
        '4fae57cfb782850daec866764c9f591eb287d98461565ccd2a1047ab492f67125bbac10bef9344cd60bd4b1f19647cfd72104a33e8cd9eed82e2395b6a53ecbd'
        '2ba65bf527eb79742fd53f4f2008582436cfccf79d251f2e9536b8df40efe897301c027ef26bfdaf5aff028633a199538dab72f3b9ea2c45ffaa0e02da1f0e36'
        '034008bf647424f9139dede4138e4d6f24a7717ea3bd0317d8f1d69c91a80bc900e81ac3d07c370da5d979c857b64b98fdc4445962a8e5fe0dff26b667e5c92f'
        'dded8333ddffcf27c1c278da86dba1b69031a153716482cd15f3b13b78a5cb8badb73c54956341adbdf18b69923c87a20dd8e3e9575768e1d6e53f0e1ce25277'
        '34887f6f6e0517551b47b2a20b6ebbe4ea2cba35eca1e7fa50621dee41f6b4302627526edb48964827afe3f5337fa1f34eee41e76300e61759c7406757265b3a'
        '1d3aee67c3dbfa6a249a3bd23cc25dff1f2ceb235c6187750940d5ac49a91e5c1811697989276c61dc9835103899c6bcaf716d73e2085b16f3d8fdccca1b6950'
        'd6b522c4c72c96685431ca582b519820fbd8484cddfe8b927aba3bba741e296fbb068963f8f31d60c59fbc9e58a6250fe9d3dad1f54c64e4b889d1708e4d4b47'
        '1e4ec0d7e513035638bfb2c04be7fb615db705aa35c7f8bdaf60119ee7a1455351bce521c6d2be3ab6bc758d76640903d8945491280bbb8e870a0f87c0b9e55d'
        'd2a85feb4b339c64b42c21d526d4bcc963866e1408bfacbc3953f103306e1de8ede2a6c6542d30ebb8accec7f529901aecba112a38f3977c3662f98ee504a132'
        '1fe53b10a99690cce5fc4695bc905e196c1f974df4c77bd9c2aca9e7d7b4011b5592e47de3f2af7c34da5ac3a90a5bd351a2a82e742ccefb8332deee57ad5d61'
        '8d2a132298104f5123d1a44fee60aa514c2caaf2d9e9714a73092656524aa3ecfe932545d2f2ae5b4a6047bd3c271891797062d40013a974bbbaa238e4ca0d46'
        'b9b803e20cfc359bb2a0ed8a88b5987f81bce4d75ec9d639964314d55dffb817e56e5270f0f64ee05dfbc3b0be9df58757d7b288d19b052d085f590691971255'
        '47929eb704b1b3fe18150da2174ddf43cd913d1b65c1d3710cbb7b21f6560058d65bd051bb6bb2b5badd5d3155e8dab781fa6a16ae622a773ef47a2013b308e9'
        'cceddbe139b3fc6c5cd69994cfa10ba26d7df3a1e81913bad70ab8a8be9c766caa812a7a9b4e1b273bfd140ad2a1ebbbdffe801f4eb7f70fd0c4b9055e3c5dae'
        'bfe3c1c85d3a65fbff2ae10a8d30a26773e7913a023df69fbd0e782f29f8b3fca9a4503de677bed472698fb6280ee7ff0611c93057740c110a4b80366fec07dc'
        '25c487785d1c303913b2e24fcafb283282abca46d8765e24b37ccb14a6112d1a15dcd1daa34e4a34ff2096422991fae343458fa610f581743519cf6fb646baa7'
        '874c6ec958251a59a89716037cc755e8342e0174f19f2e3ba80317f7727d0897b570d9e2bb176474ff1cd1333ac027a308f5016b25e66f3cc4d1792c4132869d'
        '5602b5042442fae9e1024451aca52a80d976a79da110539371ee780afe5cb16d28171cb1c865f93210dfaa3a026b2729ac2fdaf3ec3a9ca436ffc1521f768eea'
        'df7b44d37702cbb53f8954cf9cb170891a06913cc261626b6adc0997d67450950abe49b2d6f29546521c5e5fff4bcacf4dfab313424a74cbd99e76fe7c22eb18'
        '1c91b954d9f2b28b90627febfdbbc94c753f254b39858391776b5ef7e79b7e4b76759dade36673f3f4e1e1347a7209b6d95d45609ec0d4710700f92019195885'
        'e79e4f0dfa1725948444780daab3fbf35e71d680d40560ed100129d6a863dd9bc5746dcc657d7a4153b2c27c5f38be263e81283a5d9be5214a92f4131d26638a'
        '3a5c45b61f8c03cd3ca4dbb3d6d03320dfefaf8682fba58f1718e5664de8706c5506003da7f660057e3c2db5429784ff2866a363bcb2134e8ada3279d41bf21a'
        '9b707d97d02eda14a2ca1ce27f1b41e22f4688d53ece7e56b630fa323e761c02323255ba8c149e2cefd63a8792647098ed3c868d27e03d23d21b0116fd33a07c'
        '8de8b3f2f83195ee799b859d9efdb7d71f9bbe1fd6ebd0ede04edb461e96a1328ed7625fab6135261007fbe5c7ea3d70d5ca21aec2907023e4128810acd98974'
        '6dffea11280580acc5035783da811740dde9b61e1a7d331cc96969ed1bb614ee00f7b8ae3f270ef64b16f70c64f2ee3650a46a55d58f52a54a219e697574c595'
        '10e8d8f9a5971482820eb7c9d8d59d86f25a68738e80b6c740d20fcdb6f541bc7b64ca7885f49df113fd76bb3578f9e9dada7e4fa4609a0714a70b670787895a'
        '053c1b9a59f720d0590d6956a61759142dd77c53324d72a8cb876cd8a1a7f3b657a2485ec8b7703f9f7f7b5a1c490071d88e752985f50448f4fe92b741feb162'
        '4b067e83c9fe8f8164ee0f7baea51b6d29fc14a686642270f9bc25a405a1c064d9ef6bb2c3cb198849579443df5ae2c899c507fcf6693064c37b0d7c17f12ec8'
        '67b7026194c6dfaa11e30e95182634ebfad50a546d2d77ea24c41af2e9dadc48f0e25db3747a4a25feae83fe147c2f21b1e2cb40f8306a71354adc1ee7569668'
        '17560ba569a12b3c5e017f6c6ff6b16622d0c50b66c7da8e8cb2cdff25ff1677fdb873e96ff1136db7802f050c64b669992a3181b3a91343d78829a90b8cae72'
        '8df2dca149b50735129dfd01ab1ca42bbd79f547267c03068adfdf743a3764402e8f2ce1a661b05998aaca70bb3d61b65b9c0cbe6c56cec9f667a9de4ff3c0da'
        '450a33b971bacc48973eab514f8ddb1c0e6b6af54e319dc8e869249794eee10e427feed84893817aebb7685f6686d49d8e6517e6424f7a8d7269842a86fb4071'
        '5c763ed03f570cfb91495c224251e57f404f27171d61c1b5bae0324e30657f6e283f6cf02e17ab44feef97dc5030b23e2c41c2a798cec1ae053c232ac1720a03'
        '8ea3d327b59349b4b4a0f8bf789a82c9192b990445a6ac7e4495547aa96231a61e03803c3f45e9b6168ee0b381b868bd302107d495ace4ae7305e541e519eee5'
        '51486869f61bacb2a79494b94aa63a504687058ea6754a32fae62a1b2fce3306ac60e52ba094dbc5795ccce53f75c67387f4b5a543627879319a14b662d52d2b'
        'e9bdb7bf8573d9d842f5d97e290d8f9b3a41e932637169d547e29d1df97a0f999ca6110cc9287962d1bda427f0b1af62b1c0087e224f5d9fa3adb5b086ac35cc'
        '90a9dfa700e8436d9276c3a061de6c3a6fd5022be47ea8cec74f9b4195e50d6041475c597a44d4e48daad6dfdda6a7a80a61218454f72f0e10bb2cd98a15442d'
        '391317a073f144b670d4e194e6bfcd80a2c996edd3386f9dbc8324c7e4264444e732aaf16d577f287f4a51fc0ad732e2a65f0810548637f20ee9072dd9a11b2d'
        '64be021eb3f1346b25c52621314c9fff14d7f793fbdb8b02d0b259293750ac0a2736cf5b7c22375ca3e5219b233e9c1f00c59ee9b73da80dd20fb0a1b374d47f'
        'c4e314d10ef5090c4638d8b29508c8aeaa498e84e50c564b47b92ae7a86ebc87fb738540a8068e98fefcac48a1a617d73860bb1d67b3125e9794dfdf1ab5cc43'
        'd8631cdad11a4527852234b48f8dc7f582053a674defe700381db6e7eae3deb24d2039e520bbaeab006dec8e48ef4dfcbee2c5e11e9b1a09c19768a0f7ff0edc'
        '43c35d60916c15249fb2e5979c635a00fc806cd3ee9fb44fbd5b9a45ee8dca48796ed4ad0c06f0168dc8fa44526f6bf873887735315a386e9c35cba25a0f7a86'
        '5ecfdcba236d313c260698e74dc974dd15cb9ca2b5f9b15c2d9f42ae9dbb603d487318896b6b093c08020a5ba7a4c1f6391e0f76eb3b5008079bfa22585ceb72'
        '2f91fda6941291b88883f2e9cd80ecb35ec021f94e86edea1dbb786bcf1ef9f64160b019da5d00b5cd24a80367629f169d59e589420422d66d8d4e424e6eb57b'
        '96c4ac58da3fc679b3cb1b839b83f1e00710647b8b161df23259c21eb6502795d3a09a04cba12211430265ff0577d00fd542fd590b1d286c38e978acd271e297'
        '47a7bc296054823f1fbb2fc5d0d5633c37aa332b26e6432d02ac50ea7c10f79490bddc064aa043453d405daabdbb824d7cbbd4db089ff5fe7203016c5e5b938a'
        '16e787e774ea262ec17c88c2b6b8cdb195f26b4059a5fbe02aaff0c4085515f382e9d92bfdfa8c8e5f2164b645e7cb0795738866654c2443c15961eb6bf9b64a'
        'eac6dd703111adec4b3d31e7f83cebc2389ca008844302676eb53ef2ac92cc8d60c555dc624cd57e3c93f1600c4f25ebb04ed8b7e14cc92d4a36b0535c1024b5'
        '5e5177c5911069e2e9b726f257bfa12166e2792c2fd50139b5ad83afd536b5e782bde894f9c497e912ba06890a976c7280b875c5237bae6f227a15d10f113c9c'
        '26ab3840f472b948a908754c6b7d5a3090951a5d7abe7e60635bfe27b85902785dc62ed76b09ecdeaa9b1e3ff5891543b88e8839e66ecf3b86fe92fbfc9d24c8'
        'ec99e74dfe5420d961531179f878c46bea858fe3e1458743b50133ca66a7d7f935b01f0168fb8ba15f0a11513a3efe248f0c67229e765c54e110c1554f5c1b4c'
        '2e1a3b9a9b4c55da6935bce4b21d4e05e33c3f39452af04e180d91820b0b08340de9de8beaa6c93b07c3c6e23b48745f928a7db0c1d8064fcfd3ce30b98535a6'
        'ec5e9b82fc72cdc7ffbf6e97bb6a916b9374b53d43eaa20fcd4b38a0b97598c6971fba06f8fe6b3183581a45d6b6bd3559092933970682eb36c2e11c0b8653d1'
        '16173c53d6fe2770c974b0a16b10f2ec48f0933e8fdf6b78c3005e4f68b9e2a02c00743d09101ea669245080263faa8cad02a24e37adfb6135f97a008c799e9b'
        '3191ab012d5bcae4546a3ee06161fd3c2f171d783753481d0b65091df55dd3519211796db196e7f253a79fc00fa3be587b8c896fb40ef4d898c153391adeb0f6'
        '4e71f67c85498f56111b3e44466f677dcca7072aa1a0b57adbe5e2d13a66c1242fc7effb56f2c9133fa40deabc90622641c62bcc99d0570d184571943e736214'
        '8d841acfffb69ca7e870bc61d4ffcfea9ea4a7db20847d062a57941245658fb0dc2da746c4dccce8d64ee69515548f0af755be1a81ee45899a1d1efa5c7b330f'
        '2c415baabdd560a6dbe43cfae342b74a9ef8cc32310efd7e82d3276dc5eb5a1cce34095d3719768fb1eb836563e3aab3cd76c98ac6cae1d0532678a1015a2c0d'
        'ac81a0273b3f06cc984345deaa5c9889dcab2ea6f4e4ceab8b2ce177b0974fa0b928d96872c8d6251d4f133b0428d5dbc569274a4c98a80a6b65078dc6e3787a'
        '7fec9cd9b1f36c80c50a8d93fac41468d01596646319afb93892c547be0775f88143a30e6b27296b1b8699918d176b1a0043f2c6be0a24c3e5ed1d5b3f012736'
        '54c53b67a8b2574fa72f586a41c76c88b768b472ea69cc6e8e0576df29f7afe48498d767fa01561d038730a4ce1d62141ce5e046779c87f075fa622d8172afb2'
        'c39a4ef6be524acea78dbbeba2b555e81424f4579ec41e3e54ea7815044746e2e46ec7f2b26b1aab7a91309551bc7a69a1fa9b1267737afcc8233db4e2d2517d'
        '97afc33fb13ceea5c5cd0024a31d4fc9056c6591f4cfc034d4dfa102a47d0788ad48c03b9d38cd33505594e531716f7b20f1a3b9308eefd71a692732d9bd1b8f'
        '48b6bf661c5307e4dcf83b53bf70d34fee7b0b472272c6ece94ca0dde9401dd818d71a58cb0eb4490732ed9c3553d35e7bbab5eb4670a9da2c548e3c77a188ac'
        '42e17ea983e71db801382f8dd410f547d715dfa9f7cc04f0d7d5f28717e3901f2bd6e4df6a6832f3139794e8f66e63e1dbed6a722b2919ff64a270212027c360'
        'd0e41594457bce8e5927541ca567e165b3f9c3e270729d00c40dabc79033d9e3dcb32d4ed896e0a5274d66e10ba408980d0b82c986999f7de3092f17f8dbea9d'
        'f19fd865cc81175365f86d86206e867f83b1918c24e73fe67b2246d667e7efca14e24ebc36ff4663bc9ac41f4953a4e2c865276359caf68c8499c3db5dede9bd'
        '13dcd8e33c9cc17f77353806b4e3d7197c8e39d41d74b24180e45795fbc046d6480a746ca47b60ef7518dab892d0e1a2e251ad47b1b15f3573094124e260c811'
        '6e560987abe1c00ad16457ed6033fd5afe84cef42dc633a5ed3d58d544ec74f6cd3cfcce09deabd40bd66a872dae01b28e13e6c42bc22f575fb314855c50932c'
        '48629e64b31e10de482f074ccdb78933996b1bddb48c43d224bec83aa971819d4d6c32451685725836f0845c528b0b4d618c76b4c494d7e946f402410e92561a'
        'fea295c5a00103d249083bea85bee4ea13f76bf721f2bab0da2ffbcdf1ad2ad14b37c83a0c88a2a1b5f3e42fcd3597ecd69cbe1331fee1121ef226defaeb8ae3'
        '193be6399aef63573f5910ff3da5a8b82f09131fa5a1db03f9d49cda8cd0c717d3094f8c2dd85edc17f69fad13f8aecd55a76322a7175d93dc993a94ea356387'
        'fad8547b20170f95f61d217abe3b65c1875255cf651e591aa969f13c1771c6f1cb7cc226f5b13d7231d7c4cf5ab297a1f60b8e1d1345b7107a7a4f2ec21b385e'
        'b556a9a0bae7374fc1cfb0ccce12c46ca540bd4c746854513b6d0e0793a12559fd0c3e375e4c558a105fe0e8a48cce0626b9018b9b078e2bc34b5274c4227aa7'
        'f3fc06654aabd56def230225a49fe194f4ceb6fc5704db168ce91fdca3dfb002792d6fd5ecb2d4810a503d0b7890787ce17ebb6958eb1fb69a688a7cb26bef30')

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
