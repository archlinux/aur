# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=23.05.9.2
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
b2sums=('6a3127cb8fbab0c6cee25cba3900c6fe4249fd6e71315582200a276ef9c6159147fd89303a681f26494b9b6ac08ff72096102dd9148d186f5c6dd1db64de80f3'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '07119ebecee92565974cecd94bf2248461d97ba9e380a0ab6a788c039dc3b9e64eaf71827b8c7de543b933c311ae28a0fdb1f5696db875eeaa25dfaccd6cd347'
        '92a39b2f686dca8615c19f9058b15eca0275958e26f99ef490cf3faa1dc17801d6e17f29055fd2f36881f7e6647744e2efcadc890e8034da69213171e4837583'
        '9c2ed0cfecca3ebe2cb26e44ff521d7c3a0b458a168b92fe39b1609a1cd2da70fe1b71e8ce879b53bdae9d87e39b2cda2018ecfb6ff6452651d0a7dfe82e3043'
        '73029384f5473beeb49c293c775d692ed6f6e0271b92cd44b6b2289e726b50b859b39d73f9c4081b5c62d6d0248caf8e6258c33ce6fa8a39b1712f37f86f5017'
        '077cfa7bbb91d041cf9a14fb455b5c8accdc4875fae37e348d8dfc89684282c6c5e128fdf23713277779d718d71ecff9dd41f35714e187d8504257ec130bcfdb'
        'a78d1ed0ff9e80cd2258c6e7ed28b6310ab13a913edeef02d4a5a01af80ebb5dda966367dd720a548f8ee02ad1fcb43b01009d5b768e7050cb6d1498eac73e8c'
        '566ab5a9ab1a792c819511dbd0a5579dfbf15a6f90551bb9416ba4f0b9d777ac3068c3b57ad4ceb54904b17936fe2ad2bd0ebb7aa97f5af581a0c1a6d898f5c7'
        '7d42518dc9af9136ff07b834bce369ac02b51c39460ffae0e51e32f20ec2b5e3f54130a1493914343d83720ff919010711465d4116b5b984e073ab24a94edb34'
        '4351691b373015db8270ef5ef4ffed30c6a1bf45d0cfac18a1421b1f22c9ae99cc289b9f856b728ae6871ecaa3bf3d90262e7b844c185f077d085eab77c33158'
        '58e10c20e084c862ab355064483b871f02fe8551b7d2cb744166f69b3511270a85dc395333ae665ee41455c12e54d222312d1a89d89dfbd91478a3dc61b9ea00'
        '7fd79c01de6388c83b99e94a6d626eb1c4ea437f0a2d91475d1e1be8c1dc41e5aca783305b7ca15fadbace171123c43a1218d11bd2055f487f584549931390c1'
        '69e530f88b167f4041d66949289a76f1b398308cb693c722e39911c3ea64e3a83a643ddfe892a45e8f46ed85795b3d2cf9b785ed3bebbf4621e0440729aa34dd'
        'ea6041052ecf96700ab2606c47350f72dcf11c6e91d84f34892b106c105ecd583b1bd6998172a8592693d80333aa75f2177a0a26eec2499ad7be8aa7d16da774'
        'ff466fe3037178cc8baf731694af84e1d430b154c34bdad44a5ee204eb289a257f461877b635f0e4b094c43f3c357b4a2eae90b3f0d2457470a1a7bef28798f2'
        'ca059e8619ad8b76fec3a0597801bc3512d60cf4f9f873a06480a6f106048ac72dc8dad4a1b791e7d3a6d93353bb4b20f608cf65ad131373c4940ed4df581188'
        '82c54b1cd25de6f2b0621149c96be83b7d92e15000ba94f958e2fd81949c6b3c2045d244ab8f60c1a63135d2711932891cdc1f43e8a0b44643ff737b4a639afe'
        '7bf63db0ef0224de7c263f8b7b7ed3f5e234143f8726f95daa20d3db6ef696413c9f893430891acfc2b38071e4524851dec02a5f6a6a601a16b58e1ac1c8f7d6'
        '680042427c58cfb0b1ad8f6021b494bc022d8010ce54b1e98e5e3fdaca35c170b469dab6332cad4509742a182b03c4f399df92f655ff836200917dd96a1f3b00'
        'aea7320145760fded8ca572948e995a5f4898ba71fada288fbdcc60283e7fcb52627fcf300cb70843a6f03e9bc0e81162ee5f5ba2b7458ce1ee6f013de978eaf'
        'd36052757f48d22ec859c1564fcd9fafc48a781a5beec1eed6faa88c7581a27ab7fe3ca55443905de8baf61140376b6f5d115cb6d44afd39ea05d8e86f620c7a'
        '72eb33fcab795204812f759dbe5ed34e90431e43ad8e028c0a0fa6fb5b951d329e8cf6c3990f74b10c4d627d9e6f847a9933c7adddf8dd642bed5085d444ed0c'
        '269d764e632515f80f76a8969d0c933f0425b293b266f9ca92cecbd9f25e6b0b7b257e7a8d95b3d46e9281dc8899cf411da06b67b779bc506fd138568c1d4049'
        '226d6c3c004c5bb1aadcb48adc88ab864c2a221a27802157b8da857a8b9c12e25f620f73b450c43f072e7b6b9bc4929306c6b075591c1197a1c00713fefdc332'
        'ef9c64e62f9c82237925270a39044e1ced6d680bae6276cc47436d59c1296471ae5892cf3e826c2c049b62d1652380b8a64eaa9f55e1e33e249e09413e10d5ae'
        'fb1246a3ae69fd729e16fe0b1c50b063f3edc1541bbf6bc50cff22f6932eec2a1ad9f63d461825b0a7f7bce01e455beb973f14692c4a8346c02a4a2838ced49c'
        '68d974f9e9e455251c4ec1e8f67805e8580e8967573b142957f0a65f3eff2b99e1e5db40d03cb89b41a9cf6493319a34dbe528ff547a6a500a32ed7cc109082e'
        '619cb02e6e81c1fc307b159476d158096bd6965fa8c5057987eac04d1ab78a12f219262075f18b17e6c31c582b10a91015fe1991c80d18eebedc6894be6c1aba'
        '43cdd1c2524c69edbe42707c7d8edf91ef7bdaab1d0fd96ac573826e2784db762bfa2a22be1606699e3c2ffdf8c864a3a183e162a8beaf54e0741d014a0fdc56'
        'be7866f9c2040034e611dce7e5b2e5976df286e9ff4d0079b22270a1d5c6293413309e19f872bacf3eda6c4bf7773109516826d185b927b7f656677bea1b7327'
        '497ee54d6dfdba084d83788a54408f2bfe0635f558a7b9771b2904e04b0f5e931cd2eb6c7f604f20abe776874f75aae63b4bd1305001fd7d3889dacbcd6f0fe1'
        'dc0fc4bef30cc6eb5052bc87492aecefea68bbf460a39c92bdbaa76509d8dba668697a67d9aabadfac4d52fe87c377fb75f199ea979a495eb71bc4c7b2fa0f8e'
        '1c6bcc5ad0d6ad51fc55499bed12c264f4363d6ce6593bdbd721c6a80298cd613d614b9a9c9e74657d3aa0655e17497bf0379fe26e5edfe25664000eb83d19b7'
        'c7aef059c64f5f8e7bf6a8a978cfb3a0854885958d3fdf46212ae6b98cdd39dcb07d39eb4a3066cc240fa07e362ba954095f48685904ad0c0021e644adca5274'
        'd907cdb959313ab8f316d7f50ecf94a32382b8268618ce16bf2f6d0c7ca2faecdb638fe46ff0173eab50dda21a32f301e9eb74a51396c2264e276f5eae104b15'
        '2766d2908bd009c45956fae394074de71ddf64fbf86db6ce927a958b94c541f64967d08d6586f98307ddf3087bf4750e66926099b6d13b00f631e28b9aca5bdb'
        'b45400741c727d45ba5ed5d891cf5cfe807a3dea4b2641230f6136a20bbc8b787f813e4d0ee6aeccc4a2d3e542f23ab4746e9b84fc77b93bfa0a11c3a26ed6e6'
        '3c7b0ee932423ebea74603bdeb7c51876673f9e335827f4cd5062e965c528f8b130d20df5d54b3db3659003cfe688c4eb98fb1de77f3db9bdafc69563bc960aa'
        '3e13488aeb2af5fcc835ee96ba03c687e1fe7470299c6d04202a1e10ef35b1e7b9542053a77b53bf297139558bc99241f30ac7b411fd80f905fdde25ae2cdd3e'
        '575954da275f5dad7b5f6a818c401462d84f378b3def33ecb6b192d51c157cebc90b0cdc0d5dadafefbfe9baffbca902b468b6e9f248ba580d2fd7907091917e'
        '58d4d66e815cb6ff10ded7f176e0be0787500ccfc03a030a93c50dfc5006eba76f6ba2e652b1c23d4145aad8cd6497c6c187c303de63d296a042697328b84952'
        '860961351e7fbf011ddc56c73a2aa25655bad99fc45962f6b7ba68ddf36c42b6965461adfcee8783a269a4754d1ee59ef8ec17dd2886056602634643fd4e8411'
        'aabc269efa1c070cceec50d9d280f8d16059e74353a5d14df4f52a1ef59bd24a8392f7811cbbeabb957e27fc88ef29dd25c54f0a0822ef150da3772fb59ae22f'
        '045e004ad115f4b1cf3a25bc6da1d336aeb6757567b7de05ed6c082154bc53711fbb89ba87b9522cb89ac04825e9ce6fd3708c2bdb912a409582d47a979182b5'
        '3753d0c9d84a2861d4774188c2a774db70eb4c46008e16ec2acfb19dcab40acf834bfac66029b83b2601c9b15a8cd8e83ba596c2510159670ed2bedc94879aa4'
        'bc6ff2e4efce1f5a8b85d5864897e1df539c33bb3f025be35f6e5081bd3c43f4d82ce17f70069c1d7442ce7ca0809433e62a59ecdb277686a79180617d0c9b33'
        '0b726e7686b6899fc54b5b925e31e172db687cec5f7123c569af3d387ad90be6f603944c8ff64db8d35013b3f2d85d8c47d158426d7727239645528c41c53892'
        '4fdaab5777095f46d090970a1b37d7d764badfdf44875d95f005a24d5d57c5cf744d77771dab5fc0815c85858a583bd893eeda6526162e3fce0cefdad4d642e3'
        '5fa5c71a0071ac417cd72fa5f6daf57be383f9c8ab9d5dbfa97a0919911c7ee2c2af293568c1c4ef7b34d737f6639bd7f93635ef8570a7c03bdd8f4afcd2e42b'
        '23d6a113f52926a593a2d756665ef9094dc283a3335a7e8f219cdb66a00be19a030ce6012fb63eaf982dbbb1b88f314fd86c8193ffe0b014b2684815f252ac68'
        'bbb57d42b4dc1a86e26b2aa9e57cdb12a63f786e916e522634c0a025716f2fadf1a78b45a90e35c148117be9a552b73881a833671d505e3cdb3e30e0c74e2abe'
        '10cae78276cfcb50b01243c561d11145bc483662c2c3d12b856aacd137938cca79b2398d1eb8503b7e018ee011d97b7df7b05445001b6e4da0d6ee77204dd55a'
        '40e548bd74f3bf0c8f9c596ce584639a3c3c0cc8fc3c89dc44e1a82f930dddd35de68a61ce86db1ec18a51752d083569413d3fddd7ed1ae1dba1e4c71b957008'
        'fb9c267aabab0a08dd8050876e17b93a43bffbb20256dac409ddb3bc70c21b64385f2550e95edfa9d5d198072d7376e2fd3427da31ae6c21cd70e39b1e5f234c'
        'bd39548103aad3ff63bf0711e30e13e9c7f789414ea157095b143855b457c6ee2854bc75a948ba73559a5ce8482e89b4f6a8ff20e5ded3ced4dc31d29349b0cc'
        'a8020e7cbb1f97c426123d00c6582a42eed670ff9c6d7e02179251a4b27ce8fbe08f2521cf7880d5f5f0f954fb1a015788f255848a600dc772efe343030481a9'
        '16e1056b799fab3c6618204d6df47e8825026de551fb4ab459a486a030dfd0e99ad51dfccd413125fafcc32afc46aa7d3562dcf5457060a5b7fbafa9855072c4'
        'e51208e5dbeff7cce1fd9a0276fae4fd43a085928fce7d8e8825d24467368ad2ae6129fe8781d026de5aa7878b93f698a32472016eb4e48d794b065a1a2a1328'
        'ebf87cab535d4ec1b4598a52d78e2c0d5b1d6943a00e1d89f3b48066b4760de15e56a6eceaba88dadb5a1daea8dd7fae09fe2d6e98236ec5354a5d1bea6a2107'
        'e4082abd99dd910ffd106066c5a006003d2a6db0959f581f1d32ddfacfe2c2d5ce07c85178f2d94d14d7dfdf0130f468469281b964de3cf6556b2206828027e8'
        'f33fab1cfb2da83a685dd9524e7efc12a1480d70ce8945d0a33d780a51f8d2372e1ed3ffb3b1ce3936d5c97f428dd7ab2db0d67622968dc87d849d4a8ac44930'
        'e30a915a615c59914e1843fe7cdb602392c8bbc10b03465160f6ab37c5901ede6b2c5d03e919b8d1b582353830d9085384f0c32a7619ec9093ea676adfb339c3'
        '5a0d78d592bba2600dbaa478fc8208894809053e3b67efb455cad36e15c9f402565b297427c49bacaea1b75d4723248e61f87eaecaaa8ae5148355253f7822ee'
        'd97aa7fc3be1c6d3214cb43ae8f14650e363b4b8bfb6a3eac2f5a633b5dc0dc9934b295a49089a08c31b6283f67233f34bf6fd6fc31e6f9c66e324f67c11a38d'
        '0f34216f11f6b9fd8bbe3aea33cc5487fc2464c4cff5c7ec7ebcdebffcf0fe9906ea635ce3fabe58de3f4f3e7113aa851acae2a3b4228c3fa8ac93c7b1955891'
        '854a7cf3001a11b0cd8deab7dbcb16f2d833162115b3fd3e7b03a4034385d2eb0cc894185c9bb750105fd52d87e1b5cd0945e6c3967db194d3b72564fb9a0c82'
        '13ae4827826b465ffc82f004b877b3d0aad9d9a3b7021d77529cbee3575b629a124b9f76a9a4f228576ba466aa2a43acd592532646a19f7c7f03495de86e0b5d'
        'af035cf4c0f9c512eabaf30f65511c176b949424a92d7d95507e127c28587f50caf9d36da0d35d1159825401698a52993f31b6b61af42ac40f8a543d79cef4e6'
        '9a4e33537e5dd33bdce232f06c8fa3d3878982f6b48ea862bc0898063dd4a1b8702a81f296c4a1da69dfbfd5f118cb3a114b1714972630de33ad14b7b2084d64'
        'cb2cbdf21a07e3b31b5a5e82ab4f464fb08e10c5b25c6637ae5d6b42cf17cf485ed8129978e94ba36c722d795fa84479d91515a81278edfb6cf594b2a0e69e7c'
        'dcc67fc8bbd96a97dcbb1ccb72b7d35f37183d26c995b80d27e51cc772005d57783c6bab2302a10f26cc7318a478df26c1f1f960fbebfa2706fe3522675d37e9'
        'bcdf14b65b858a022870ff33ae3b6d6475bf305cc66e34bfb534771a8e8f9d1ee14c864b70c5f5346dc00373eef0706c71d3dc8c1555f010e6eece7064dda2c7'
        '09057f81be882f426d806d31e59af25e1eb0271d70c9d958d93a091de52526d09b711cc114ffd7ec9ee9dbce58af2d28accd15d6a84d3729e95e23632d288c87'
        '2101122fdceb7aaa9257a90306a3084f166055b86b42a8b91105e1323ad1c1fc631a3274548a10b385084bf0716cc303875f1c84a83a3b64d7393bf37c4d9916'
        '7ecd4bc53f994dc86e71eac53b724b3b8297aef1950dc93de367ed33acffaf532f5cda911ab06c4b06bf9a6f2e3008985a3c4ee152ae089badd60b33512590cd'
        '6fa7e76752174e2bbb65a9fdb49a57610d28c6635a3d61bf330e3dd976a06ae2523e5db72db4a80b5f879d84b186b5d1f82bf884db9b4b3dc447a580ad07b1ea'
        'f6efd27ba0f40870d2fbc7620142f95fe2a9c327109b666aeacf7e95d2fc5bc1adee730177238caa04e1991af55c2c1f43cbb2bea28a1633b1f1d0431bb5b387'
        'ca4bae41d3879a489d0396661ded8986b41ea1c21854044e248e4552987435bb19b826d91ad53f13a4e7f4b1b98165c8ed8c36eb39bc2b28e114a99d78803c6e'
        'dac0376fadccc130898be08ace9d5369722942a539a5ffbe1e9e773f63f21441ee02b4caa1c9cf757697e014b30fbe54277dd5b54a04f7579929bf7b4fc44788'
        '0fedf83eca081ff082ed4de22422be057bf9f9b8c9431f391d4ff2a3bfab97e2cee22449ea580a2f07032696e33b96f6a50d2f99da427fc8868ae0a664c3bce7'
        '58598bd66954ef34efdb03f792d2fdd86504cf7a9c96bda99eb696552db250f36144dac1141c0d84470711e9cf68536816cb5b698ce5c291d0b54fd14df2e6f8'
        '5aa059e10907385484bf65522ccc9fbd411484b731b926bdae15740e1b05dfd506f53b4d6c81b25f864cf191e3f2d7dae708866c5cfc9bf868dab39bfbc66e28'
        '42c664e9d9b6131dbf7185df8557eec5289ec69c7bd24e695a1c4c80e52e464d4337f79d9a172ffa4353d670f6b4f9583566c382f6e12a179ee32c049b75de6f'
        '9630f2b3ee736a11e831ad28c2821a050955d729a06a30c16c80a71c947b7d1dbafa66df1d7b67f08e164d4899a879f343be513155ca2d983f9f9e3b6fdf4875'
        'c2da1472ca4ac8a236dd36300af667c85194acd8e433b2e549e288fd8de4183f4d029aa3b9a36db0bc46c93569889e9dc8eeeb20784e2d78a487c5865b28626a'
        '9366d02bd48c5c80a7f41f6835534e993a8a7581eeaf2cbe30a11d40f427f78cbbeacdfd534f0727848468aaf5970d900b8e34d7bdcaa709679b61d43d0e154d'
        'ba4ccd2e78b892c515ae5e33c822167632a89cc37f936600f5dd1d5dee15220171389341482b4bc81ca9f00e12e9cb8c4fb459918a715b671f9563ea6b365896'
        '67fca6b061da636bdb9582c9714e0e6299a8fe15ebf9675d1335d18d9e5a1a60f19ecf33813a29e93cdd6dbc1b3bafe589cc69496a6cbd7f960b00896fc241e9'
        'ad03da626d5abb3258f2b318b893070ebe5ae4180c5ef30bce32e45fa31debab96de7ac30733f6c17dedda94307c113208850d5e2ba9ad3ae9c1678c33d5a3b4'
        '737b91521b3486e611e62d170ea78a84a268ae5d8c016b84cb799bfc7f7c9dc444c8a87d97f648a8f8326eab2d7c88becfa2ef2fe826989140cf37bbfff91191')

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
