# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.8.2
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
b2sums=('9c450ced4ed472ae15beb91f2a00af392f2381e29b30d8b77b6a1c18457bebea7c9a7508106fdf87f0e1c577a9f49b79063e126458f5fc731ac7cd359b73e2ef'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'dd20c91e99f397d26e537fd0f993f5813a9010c54bf0b9ac32bc6f7ef53fb17370f2890c84fe32ecc2bd871997e595ec116903fcb3e47c098bba8264e9c2fd57'
        'd5407747ce993a0e90055752be8392c7c8667ef49670875dfd08974ad214181ae4ed91d19969c8f75151c8fd9e08453ec5248b4df96b8aceec07173368891cb9'
        '5eb48aeff03dc628e230d8a231b23172b25d9e9cc1dc0afa0ceb8d1f495f86b4942ab7a36edf9d0017810927e05bf569ae3db26065ec1f010987ebbfb5bc870a'
        '7eb18a12eeaf2351a6b00cc169a5a0f7a3e1539d3508b973aa2ab12a92d58962c43dbbdb563cfba75043037ebd1db9898c9d454b4f94fffc28dcbcaa0ef66412'
        'af053e0ce1ea1c54f5e1e16df1f2e0a299c5b68f1ea4153dcbe7fef1755562b1acc2636b30aacc506969e32c245282984e5e23368eb685bcef2c5c892e748ddb'
        'a7bc24b97e4eaae22d5d78f3651c190d985adeb0203faeaebb622c2d52a64c703f93efb682752c994f7e41811627f842ccd11c6623769eb47fe6eac95d2f73df'
        '19317644b0e0cb4a2837816ecd8227c5fad57f6c2f5d9dd03fe99da52db097a58e1718aa8a84d166fd30774a4d8f3c95decbdcbaf1d9d89f651627525a27f80d'
        '29ec7505a4b42076e6a9c6fca3c1378196f060ea78acbb4cacdf40fbc0a44ba984947d1ac8c548c1547aec22151878a40fdf11be0d994a7b13eec0b4ac91471c'
        'dcf13761c1766d7a6ebb840a0f9e2f3e8b0616d22cbdefcbdd80dcd2df61e106414ac24c7649f065b465563d5ef3c5ade2dad4a1f09d2d7ee3295db1ece3f853'
        '7f1270270c76dcd6fe1a38b994ef67736d5f0dee592515a8c2d7bb68b3d2c13706149c27e6c63fa8559f68e0f0bf9ba11fcc56e62aa4ed1322549791f711508a'
        'c86346f8936b1f2ba307d8139c4d98359cbd250282bb72dc3ac9d3dd541fe2735956cb411a4538410d46d1299431ceb0d14e1bcc7b5a724fa3d2489d94049148'
        '027b83503b6374b36479607f1a5b45e26f427c957c2a2109650a1019ae2479ad052ac1df43028341471bfe4515789cc27cfc9b88506a5877f205d5f02a8d39a4'
        'a981d4ffdb679e0f348a96c2e6ab414406ff5fd121aac3c1ad98936cf073f17c7e521693cb37a685c54e3b09c09f8636f1c648a86891dba9a9de85bf27ee2e29'
        '49dae317917800f8a5a7f9f003f28b09ad9d7eeb8ee35aa436bdb952267d3bbe4a1ca59a2b6e6eed658af56eab92b14d1c7f1506249e21e3f2dd8435e73066ac'
        '1a1fc65c8a520b8dae74773546088a9c4281cfd670eb912981ab4d5b7f77cc575fe28a7e8e9dcc5145e2b12e098fc703050944af3bdd7327fc5e73091340bf85'
        '0198bbad6ff1a96ce5496955df66b448c9074a538d910c18af3b9ac841db28e70fa93f7ae80567747a968045558b422baba11cd9aa36af674387136955229858'
        '1d2ce43121c7db4ef1abd0bff421c6e76b1e4e0ef8e7abcd7a1ee5124058e9f12c1ed8d954ede126e576e5b297b20747efcacc0f538203e16d99126cf48de569'
        '2df47b3a117ab3b50d8c4a360c734edbe741fcf8452c603137e3a326810df744579bb2f895ee0f76af4ebea09aa649024fa86fd6e698b8d7e7e04d6642074738'
        '824b2b1d381f4d339d063b52d08d045dcd3bfe306e7e9191076c0b33f4cde975b05dfe8934f2731ff14276bd55f9274d405cdbafa927160b9f40ae644431ac0e'
        '99616c530e75a4d2d9546a3e0ec68c48b52d12a7fe789296508a9ea3cbb1b46935ff5cff4f11887bbad2830475fbaee5136d8a3580aa867ff6dbf2e868a4b3ab'
        '0d4c6dd11dc6e260d1ce953fdb0f2d99f39bf47b93fea1313b2a3e968e355a3011c1d5b783c69ba38ad6024e14ef3ab6fd6031409e98026e994b3e382eb30d9c'
        'c50ce44e048d3645250f47fed1454e0214d6db4deed3ee14a58088680f03b8c6960069be115673fcf4532be9c90f666acdc4e1d7820d87ef4464d1f67c284fa5'
        'af513995d2ef9112747251053961dbe00724ffc7259d16f3cf74f029af4449634a6420e62beec27765bbd002d7e7ae17a82b74c888eaccb3b2a5523dd9b027db'
        'b8857ed4a74436c5857cf12ddf11aa8073cd95712f62f84588965a179b7bac724e8775b7a35c836c014bd08d4f45d610806b2fa498edc177dde8e75d33f4da29'
        'f61f82cb63ef3f4c5f8244d9187ad47012d5e03f9667e80fd902d65d1003ffcb159daa12ab78296c192d4a856fe9772f719d5d883e67ec09aab8acf15cabd575'
        'bbf1b541211da35b8b4cb6fd89e6ac7a894cb5c5848a57a539a3fd0ae9f524131c0ee342a7f750becae205acef7a9f487b0758c6dfb8c6491c9b0e79ad6c5014'
        'c54685e685cb30cd923d81bf48602dd3cde0967cbc9a74f474f294a9a4d4ad31204041ea73a299ade5a5809ab86451c17391953cc2088f8c3d6d2af68e317328'
        'ddfb315b59c6f029f4b8211ce469f24b4432821547e46841ffc491d623a977b5481da4d2445477fabc1fa1c5a321b22523a884a5a1a079c27f4b639cea392d62'
        '6771be294d537e8c94bef68a383d3504bdea949561f32cab2ce1427f06b4c8af438ff5a568e1ba26750a2626ba00f66cd49a7c4eb87c778db72cd60b9ce0b6bd'
        '3e7fc4647f45b47d15acd79b973abca1902d6c7482438848c24f78e2b6b2f82b1f6380f0e5daaf8ec557a89846c585aa4689b578b1298db28a6aae2cc4853dc3'
        'a6c548f46fac5f311cbfb5236d374970622161717fa6c28b45d85d6a5560ce0b783e8ad1711eab66c3c67ed8257bbc9823a34d13a2051019185539517806b012'
        '3a1a30211e31b6cb4b5d45a0c55757c7da7236fe81b4fcee3ffccc0c9e1de784d9f13a6dad610879adb91a17300adddcee283722c63d2aac2cd28e4d088149d7'
        '583c2056bc7c31017aab34e35bf3a8d49cf4e9756346c2deb264c9680bd368c1e5bfe62e1a50da5bdfe2e0441ca037fa1e3109dd85edae85492851d0ac7653f3'
        '60703c9647332dae9c7022ad91116275df87af3f291308dff30389ab294268f012e69f79b6ec6666739f9b3d850d1cde6411158a9faae1703fdec643e58512c6'
        '493f57e28527e13d7d1b4202dc422373f28ad20a2c4b3143f06368c41588d4b709a043e8ac5cccc6c99841877d43dec4286ba90d38b83de47204f290abe63375'
        '1fa797f1c720ce8b571a047de1085f517eee5639b1bafc96f0ddefb6d1ea925b2601437c80b40f0532fdebdd128936c95176d02698f14783b72a6915cba47bd3'
        'b1c7fbe53e7b1c021e23c202b3c8dcde8152e74a481250552d07cbf2488c0d8a8a41601d2093bb3aff588bb43d8da3630b75de82c528eac37a49ead655d5d301'
        '908823d4abca836ee5d729b37b95ef565dcf2ad3de6614eaaa57c36c304059097f96c7b21cb07915a4c5ea76e70bb042f70f8b8df6cea0a3abf5f1047a10b0eb'
        '649b1557730d07a7bbc5dbc77686138b815c58f32a7c7c1a764e213a930a0390139aa161cf8aa7a99baa3acb91901c10dc04686560d2e3e8e2bb47cee40a5889'
        '8540984d54d92b8b70380938fa288204b53efd919e7c32557a4b91ef9e2e7774db2caf4af90a234eff943b9fcc20d0307743f6e26be2d0a4114e08c5644d2fca'
        'b97905434ba693777a3e790684fac174e1643cf562a2b5b75eb7b9249ce9279006f768bbbaf4010381c56c1b0cda76cf7e928496c7e953c3679af38780b94b89'
        '5429542b1f193f384782ae5d3531cb1dca0a1ac2a23e2335ca9be0b1fe030c9027b89d5293a9e845bda4ce41fd3687cf52650144ffc3596ca9596983c8d6720b'
        '2521ecf6bb63b743e560deb71cff0272f58d83337a5dd257ba98902221f1c2992e1608133e1dc2c2ce8be7ab5045b585ed2db2328a7c22540c6eddeae7a88b2e'
        '9ab2d4c76033c8a33ec73da1b42a1d3c2e648619fb58eb104e49a9e2fe91c9293d053108402305b4f10adcc5f2435979a2cda899b1e8e3a419268491e034adc9'
        'a56c95b93081abd2f4e9eba5d9b1f83bf000ce96ddbfa68378aeebe1f3648c411bcd516d76a22c50a8635a397539870c993e75a720ecdbb3d7994d3cf02ee587'
        'b591d6c5977796bc35a16a4a8a21da9b8e908c8a72aceea6c970a332f247df6b4508a2f400eb11bcf9e9812f6185349a51e96ada9aa5ab4a4c4e75cb3d72ac9e'
        'a29337e37c83ab37360ec5bf4b6f2bc42f41ecea4ee0e47a8ac3fca4fd80b6c7a4c2424115b67f90ea4984334d11b9f2035dabf0913aa03569161f60cfdc1bf6'
        'b42a4fa098820d484b56c61c07404d33c814f6df6751301b5d5126d869993a44119861b613eece72119378d86787f932d07a06aec5e664bf0c87e28c3efcde6d'
        'a767730495fd15fd4632340464ee500b9a1dfd95304dd22127ab5fd62becc3034ea39b2814370521dcf0c16741218a306eb036ddd4e8c54ca963e6b8b9e00e4b'
        'e59458c0268755dd868376504444d492c5abb7a9e4ab9c5102b506f07792860d744b706853d1724c749cb2d4dbde9378df0ec191fbba1487f5ea1fd554057dd7'
        'd4751caa4687cf6ead8dcbe67877f3da061142519bb271317a72c39dada2b39d2de78fab2f5ac8912113452e227dd52b94f478579ee80d6d6c290066c0b2ae74'
        '419809c1ad7b0dae9254977d0785c275558bcfceb5119377edd6a790e7a4f86cc905cf7e2c46972c18ad46bf8048f649f0ca1b481b22a0b44f248aaf02dc6b49'
        '1c0f08bde787090ef9a307d32ec2536eb0b0e6dc78c73e9120e008ed40019d0b7b61702c78706f02b70669dde9e72f2e243554241470890489d1d870b2b11c64'
        '9ab188421fa2b85d96cbc88a25e392658fa81d54b64006ef16d706e4999a55d8643fc43042e3d2098453bb9c767f6e7ad2191fd6af3bda27ac9f46392d120281'
        'f3bd51b842875fc75cf82fc5d67c5b5e5d3c34e97a6ae4fa2719372db6c92a1ddda0e9570fd16df6a15b4685676d2e6a36df3008f23faba0d88813fc706c7160'
        '75e6f9fbfd947d18c4b3323fc4afadaa6d5e1404c410510a01512aa93196a64a00a6274408c294a3e4796199d3faf5e129e36b033d26fe4789973ec77a3be42f'
        'd1b6ea383232d012e25cd32cf91f057b7b26b63b285971e22a1d920749bf760fdf18a5005e29d4710ed9ebf8e95173fd1e50a36585f7507125908ed947a0ae7a'
        'e6e85e1bfcdc7566ddb433acdd29da140abbfc4cf95d8c2cd183d8e8fb240bb1cba57dd543f12c770320588c6384bd56e627a866295185a8e66bcbda9dd26e3b'
        'bf080697feeb8d0c8a225440b24300d112232485ba24785befb0d8a5d6f49e53cfeaaccf20c9375ff90c672c5c41bcf708ad5bfc0258185c4bf6c1283f689577'
        'bb82af589f0de679b513654faff6fa6d5faf9a0839b05d5c3133d08edb209748b4240a5f437ae5a243cdfe1d3c8134db00fe85b085131ae7c5e9c02c4c1f10d2'
        '77d2beec60fee3e8dd819efa451791159d9e3339bf02eec3b2d8e12387288dd151c0b3d7de4d8b26bc9626f9f7024a3fd3d7527df46b6062e69e7a87b85f5cfc'
        'b219529b980c5ea9457d425f4bd94a864eec7fe97dcecffeccb83476e83820034c110e619fd62e0acd3d9431c3790166fe2735891eaf1d09bfacb15571e9b425'
        'a4a165f4f3348902f191370ac467b349356ff72039b163441f872787389035dcd21eb08aa93c355a27f265f4bb43c66e00bd491f1541986fc104c7303cc1a3a2'
        '9c27787f0da3ced61e90c7696275c45012ed5f0500275c9a2d1e152d4a2f991647c02ebdf5aa2f6e4596b1a7b276cd371aa74f4625c8ff7d269ed2df77d36fbc'
        'be8cae65e9b912356c8a7efc9f8983c3bac49531776a9f6c6b54d4a597a8d47c38688d82a0cc0f44415edda7711fb536ca84009f48c7e7b30d200dc2c8c421ba'
        '4bfacf1fc6ae3d16775608b10fd66ac809c1c592e95f8e5b9d1c6676a42c7383af28643c57eb07a4517b5730c04256c7244f3a16b03f52b1655aacad16d46c1c'
        '24c917e1d1704c1598e32b441db678400d8f5487ed458793ccb456e4503703e181a25bfdad873f9af7413abf1e29f2203052164b0acb75583b294f7c033ddb25'
        '38dabbe0ec77f4b89a9b9961ab4aa9d249105ad0bc9586c175d90445c7db6b69d8f9a8beb4d32c272fba21ceff6f4677fc2c111c1ae89e242ed5be1d4d916bf0'
        '7b2578213c396cdba79e948f61fa0d95fc42d40421f729043c20f7399a17a8bfd0f1fcda69fc0c48e53fa5eff59853a74c9a7cc446ab6ed2e455cacb7c51f27a'
        '74efac80578abb2e255b5cb8bcceb87ba267a05b94f021c0dca7f95117dba3cc5deda49e2bb2b638e9d517de6c3d8e4d92e64a808abfcc53a7886c239899b3d5'
        '815039a12a9ab7d5b5f3ac73bd8eb54cfc89a6799fc787ad094f9c03c06b497bccca0d6e35079a03ef260c830331bd630813c5d94a9356057f247ae65fb97787'
        'c3965a204bc4fcc9c90383687f8a79c66f0aa5ed4d51ce336e755e450b42353a32ea5a8daf26eca427ce06c3968dcaf11b8dcc61488a162c3699672e350d6074'
        'ac694320ead4915a841db510e3cc29713bce3b01373e2c540b56884dd59ecc8511a9416d05e50646b98f4e8a0f01d4184c0b6a3e38c00953ac07ee987f7be3e3'
        '791bb2bb8e858dab6a0f88019d885cbde16aca0e6a3ddc184967f8198e087ab504dcb5fd3319e0ee4c0e49e9c80b02f22296832673a7504599060f4d20703810'
        '290c81069bf889464685b5dea195e00e7126ff44f435704b44118de6d4699c7c48fe38569bcb07697bb5f7f55cd3a9cba68c4e639f19c4e12fbe5d55b87e69ad'
        'ffa95cf3e609b4dd3baa4798fbf2d500877f58d644a70c043889d433a937be7dc91a51275e61099d5fd6a5ba572e7fbdb88e65138b4e2097e40fbe97e91ab48c'
        '8f4913ca6e3bec174437d9b310fbe7a246d4d0a39918776f5a75f83e91574dbc0eebae20689d207f6fabd46557fdad242807f603148f7e472ca4c533bb70d3a3'
        'ca71ad2cdf41fb1f73bac9b77e74b6d392499f47c1d0788249af0fa3cdfe5578705afabdc3add0388ee3f16da6eefc96794ab2d7bfed29780d44b83ef2f59722'
        '9323e997bde9d1e32b20bfd6cac1007b14e924198ab5bebec68e5a8dd1b39745143a6b96be4651904be09391c81cee696f4a4f78c98a4cc81009719fe5a1b1a1'
        '0969fe8eb395d80b5fbe05c1e1b1a2f48d0c6a712f7a4d224e6a0eb64695b86160caaf662d82f32af5c8776f0ec1fb9448e985b7f375d2f78eeaf17dc06a43de'
        '086231e027b7c86a1c370d580ae73c16549f399843e7a7aa94e4f1e7b7a8b8ac68f93f712835f8932beea5cb206b93a8c2a4198c3d13888609f01b115869594e'
        '3df93118de83a83a0aa63e84ac052463fd94e13011014677b5d494b70d5efa24581f7caff9f7d3a4396df35f479c2b4a026735b2de5457c1e6670c81165ecc41'
        'd108c9cd6a1f350f70f84435b23918117ec8886786e863afc53dbcd1612aa134cd54067500656512f2862316270493ccccd09b02243d6a42467c940b41920cbc'
        '04f5806249517fb9d16dabbd69c187716512bbf4c82434971884bc4ac05bc990c8f681b536f1cd7231c6b411bc051035c8fa0bad0e66678acaf11d6ff5b87329'
        '9233427c706d9222c68d2af0d1e2533f1325964d85baacf9437d87c387bf1468f51039557cb3fc6fa7875469a00e2c662984f82c33f9db7932786a7ca8c2be81'
        '4f6cef2777b4ff98be66ccfd2c48eed0bec43293ec865c2d5104a1303591ddb0f1b53d612e833a1a39c6bff8cf2c781d998b0fce76a11d3a5f10d9e36656cc42'
        'e84a2e8f3f6b72ff6ddda616a2bb158a416752a48dacf345f9a0dfc7b2d4588f9efd65fbb248b95115e9369999e34eaccf6c34390a1b6eaaad45b31a19b52bd9'
        '3216cccb0a934b5cb4a99ba2857edc341e4f4373778fc491988c94e8966cfca212c0cde67f3f23b096c13ceabd48df4e212f82a8ac8e4382fa5a7c7a87080eac'
        'c11427444fe150137dfea6fd27dfd0674b7092b3507a0be02e362b8466dd317a94e6804cd8d0dfa83a48efaf73a7068cb30692ab0a5ae7ae2b604ece2aa0c19d')

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
