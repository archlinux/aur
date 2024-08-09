# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=24.04.6.1
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
b2sums=('bae4d598ef2437ee27162ff1f4d80b3549cf70e6fdc7482a8f2186c51f9c5b33ca3db27e0819a8e2719a09f22b068da3e4ec1455403d8de00ea107c0d5ee1739'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        'ee21d04c481f052b4d2d3fa0237b1f7d23cfdaf218fd2e88660ae37bf7e727f919da4d6db7c8553ce54144fc982f622daf56f0579bba4afd17ed1dd527aa51c0'
        '6f492e8cbc3adf9b49bb15a62bf94da4866637b0e020404f80a9227be59cc5a52424807cb3bc3b14c24ba33993db8cbf1f1e0be1c9da352a4f2fefb72d338120'
        '88b170cc9936e4b2cdc393c95866fa2a883abdeebebc09346bc0711f4907278953e56e579d9eb9a6de06f028a1a8340eec02f83ce02d082f8ba333e3d08a242a'
        'ebd4a11bcd3bc9df63c256878499b7ac9b4797ee7639bd66b186582b03c06ce6ff60b3b16da121e496914f6282df44849146cab2406e69cd5981d86fdecfbabc'
        '1bfb66076b6cd41020f520cc6b1f4cd0b0319f703d55501624715b705f7b5f544af3d5fab2e6359844c1b6b2fff04a0df1afcfc9c364625c39f07a6023e50a30'
        'ee54672203befb386642207f35c6f6cbbfd341a3fa0dcdb806189fb61f2d936f9819020b555d847b21a475770f9548fcbbbc50cf4ede9051a20482483e276bf4'
        'b6d096a36e55c68f9c742b61dc6ae5db205645a08f007b9725b06ff1cc3964096047b7e0781fe7b38aa3e2924987ff2db3c3a5404dd8d8284135bc5fc5d682a1'
        'a520ba210240f124114370ab3e4f33d0918df45fbbfb21b505dcacca09991bbe50df72ef16a8be2da500da439912b68cacaa883ed2279f8ea900f9165bb2491f'
        '8550513ad6331f1c5135c15f11b76baecbaafe86f8bb607837ac67112c81898751c26ccc962279d5668407282fb349aa12533b15c5247a02d41db3df65e03b24'
        '7f79ba09279f83e6f8538d99a0e1ea71d6b9c36939015da75e3ff3935e17c4838f18306691647c3f2ee86012870ac918d54b6daf0f8c9157dbe898de1db7ada8'
        'd53584748fe8a7927b8241929216ebfd852e8d80318fe0dc3eaaf5569645965029691c6ac12a7cf1342ff70d30e86a2d098fc2ed62808e7f28f97f6b9c704169'
        'd408de8e31049f95fe7abbd9d3bbaf8523fab08a36bea44247944c734a51b071020663a2cb6839b2cc9ac9e7fcfffcbe95c429b8f9827535b4af4ee4436d239f'
        '08e66df30ee2f224178859927503d63a205a92fb38d6fa620e11cd462e6f2f4d000ac3fa37db8e49a7a5f8a8f434ac58bea9595ec8e3f2cd901acd1082e2314e'
        'eeeef51aa5a5063c4b7ac3da6878f6a3feee7439c197d689fe8b7d7fd9a1ebb41af6c23d094ff465b0474345038dbbb9b037b185a7259f3ab1931a5468bf9643'
        '1c77686e0a6bfcb340dbbd88591f28856658d08cf1f52bd02b25e79b7865ea846aeb7bdbd945ccc6d6dd79f93622079aa14c80beaab265036a334c5e08cb1dab'
        '07d6132a7e6ace89e5237cc8056839b463769952cc2631303986c2bc7a0ba7080cbc1bc855fc9877b3252e34dccf094a61c0228ddab14419b550029e008dc527'
        'a43a506c960f3af280e17ca4a350a1045aa6c99ed239e8e98a09ae5de1d2c02c6c7ef20eebab7dafbde5bfebc68baaf03d97fdb53e558472ce8cb291ea9b2d0e'
        '7c009b25a2c45acdbc03a8eec2a0fa8411e259d1ac122518645631e79704a2566420cfe1e3986bdb9183476749dea4d360af2735cb0d2c3a69c54c933fde24c7'
        '2588a9a4bbd6fec44f82acc964057d48f49ab030f124d6f80873751e88b09ef1376e9c4c7f13174b86006a0592c7d59bf05cf8ee334043053c8bb624f8542ce6'
        '7b4b2b372b51003cf2e9895ba83aef6a8fac15c1691b82725ce0ee4ec4a9fd8e68381a91fa8f8e67ed2288247ec18fcf297562e33236a04304d9610d4741e4ee'
        '00540497f81b1486d284b028500ab312f6491219b3c020cb502007beedfed847d49ee16cb717130de90c901bae14b4f224bdaec3874d7a61319b9128ac1d75a1'
        '8ca525a9e2ffe62c1e3f88c790e8449a7d92557ecc8a3074073d89172c4b868dc64fcc512b0b88fa5be7d3f1abb05a47612f4b1b7fa42e1a8386a5a0595826ef'
        '9fbdf61b4748e0677047cbb543c9289dc2b0697372ab3a5cee00832c34db656f96c9884813a6501d290f7d7764c955ec6b293cacc3376598b6840b59a5a0e647'
        '15d2f9ae67d513b173bc20d17434969ac4bcc9ff6a63f79b94f28a9de8e6bdb1b4ad88cf0d1527971415c147370b83acc13ce36688b9ce2dfb81bb21abe7a106'
        '44c30ff60fc0414e15519571ef3323666b39c0f109ca313b979ed86a81d349a047f49408f1f6a6df0aa614d4567b8b635b5c0337dcac8e5afdce2843d897463b'
        '6f98bd8484b505c3e0da00ebb00ff386ba43edf15f9ba5c52c37e1871968e01fe28ce1fb32fb352cb70dd57f5c77c44b8bebb9b801b139a534798da888a86d9b'
        '9f65508a6b4112d53fe28e2e90202d47562846cb1eaa9b057aecd5e8cd07044263817738ecdfb4733301a74536c38aaec14583b7a4405dff685a00fa3b863bba'
        'f5d40da34dbc73e556133def34eb35789b504b8504f87062b604fe0c79e3c2eee5cc7986957c6258705ede2af242c1f12677bd710010f1d3dcf3059dfcbe8cc0'
        'c98a736881680f22e52fd162b305ab0e389ff449945a58dad053ccad76af82d435981c01f834d2c38d1a5af94130f79081e868cee8897d649cdc6da5314f2be7'
        'a8547d09bcbf449cfec144e7ecb2efee073c44d827f7ecc57a1d535ef5610f68c4a7d27ddb4add0cfdb65f868a2d0244b6a40d0893cfd8b2df5d40f788e10196'
        'dfc99bbdb42e5928ddefa776df8181fd229455594b10121d57f4e65f82e59ac12e0920b9826166ff0fecf64a585055cbccd11dd1b8d8a330c582daae227a82dc'
        '556e5fbd4a47c8ec3f3f4d2f4baab35a6159073c1733e59da42942ecca77379ed7c2027f3c9e58831e56395acb4129d8c95d874f52627083fdce2dd391cafec7'
        '299398856fa374e37b6de7125b67ebc9098469080336040e39c43c49462cde9d426c7a69080d7e085f5c449081c433d317db5e067bd17f69053343b60c4ed6b8'
        '8a764168202d7cee37389f9ab0ba8c2bb42cce15b33accf863aa8c182f9f0add2c1de9e4bfeb586cbba872648e5c75af755d2a933250f4d5583e9005d7bc9335'
        '25cd4b405d74393630da88f8560efafba3d6da41daea3cf98075bf355194e997718889eaa50e57e013b95d113008a26463eda2ae0830a453fae9d229d511d564'
        '85b2a4287c81081bf842d27855710c223185110d357f5486cb2e1647bdc2362362348f679c64bec6d4ccdb84310ce9e7db85ab2fb2ced732a49a43b82ab520ca'
        '9f6a3946964def4fba5561d4cdb97b25498a31a7d3c5f8df4b008d6e4ee38b4559cc53681a0613caa226e1cb0e7edb197ac386e884d5aa8e44d262a30a2c074e'
        '60d18a6114fafe5293134daf354109aeb9ec4ecec92a354d6ffb18eea9501720099ccd534984028a85b81351a7a9d3b677a74f89b0685eed980c42c6762a8896'
        '187737ca555881ef23622bc337039175ac2935c3d304499f5a2a2c850bf92e07b395832c1b9d0618b099b2c26253d4539362b6c5d70db28bffa7fa42f64a9fdc'
        '0b6587e4fa0df4615d73b1caa730c4da1c1d8f88a1e2fa35c774aa1c5471af0765d0dd057e7274a1994639f79c46ad945ba0b58ee7f5ee8163840b17580ed4dc'
        '77301ef35a084e0183a611559b78e85d61e4d86db539293dac82e58c81158e4add5a9779fa4be96815de7d16e55d3848af54db712c9f6d41b98a842200b8dde3'
        'cdf9003072a44c6f9e4a27c75c52edf6e32b58f494bb9e7f32485ca3746c29c0ab0e7f218897f9ece49286fb2f9f0f0c169996ad7de5dcbb0aa3b3bf3ab9c8a8'
        '94227603429f6dbb56a5a2a34545312f1883fa84fe8edc5fdfc3c35eed29ae41efb2d514309ba0ea20adee80ff55917dfb65e07f60297bc78ca65c8246c01353'
        '6e038905e4e78e058af82d4b001a307bfd2c0cb112591ddd02d922ea4f2f3e0b0676da2aa2986cd2d0024a2783f035687fb380236f4b7b2f8cd4ba38f261cfc6'
        'bb3921b60ff6fb32f63b927715bf3f3c401f7e1478a632f7ef28da3ad10b22dd9d3eda1a45ac8c5edd3ab26828e3fd761ffa37245adfde14e7800b07521f9bbf'
        'adfc2b26358481d50e2ce86e30bc9e95b629e8472ff64befa9b4a7cd8334697ead2b541b98fba7c26eb8d83dc8ae9c791f468dd8725e807882475ba09d17a9ca'
        '384c7bad982ff6f349934e216356720986ee8269cf15da73d64db85f5b32eeed9d9b0f23b650b68343fe5e898b488d3724b97f8706f729113604741266609d2a'
        'e983a6a1746fe86daf9d56d7682302398071a1635b3af39c2ba2ed81e1214ee32bd16e2c3b68e58ba1132852250ec6d3e0e936e3fa6e660bf73af1711fc97440'
        'c29b989e0b9448472e78863b6c95166e4914f0cee2d775b6e65f8071c6c9dd5cd044c3776ed873a4a7c742c04909de4c17ad5ea4e8b2b2b7148781bff73f0aae'
        '52ae545e4ca6495f1d9fc75532d8c247994b85c989a043d8ed2d197a1a3c2cfe194bc836e607a766a68b5ada148d01c72f85f08d4ab24d1f086555b436b8dd83'
        'e53b7ae2f88b327c69352e80d487791fbbd0d0e5a0711ec736803e05261942f648d4f30bf29461609b8667a7cf315e36db8d2068561305af0c52d01963f59c59'
        '7ff6ed233ac4e9a6f8ceaf4a036c644fedec70d3e4a5b61dbada52d8d3547ee1af62385969c4eebcde1317a5dbc0ec5f7a3e47d96212a17d6de202f6fabaae28'
        '2a28de09b5363c16bcf974590fb47d581a2e61ffbe21381bb58629f618be4cf1263ed0b7d3734d93cb03a63177ac0ceefaa9cf5cf9f5aeb16e2adaf1e2f940dc'
        '60c0bfd60e16a6b4726ce304d63ed44bbadacb5aff87ed60ce7834fbae88ccd59c18e1f1c19deb3639378c5f978fea4bb56a244d5bd4d46fa9fde50b1381064b'
        'a024d56151c1754ad56eb649daa1ed84a99b33df182e686b011d17de304bf69426cb7ca794ecf66b641462eb2141c622e9566886a4643663eb8624f9b1b95afa'
        '6ebf6419475922a5441291dc840ddbae186e4c9980b3ac83f87b9ff4b3290ff76001bca1b44f9e4bd6b6edf7e686a4d2cb2a3afbf4de456a35a1d784641ee343'
        '3e0b4478e030560322971619c73f4a2cb02ab449b931016c5d0f915e63453d2a41baa5bf15758e6f7ec8d89d6a6261da54b993fbc06dcc6be3df064aa36b4b2a'
        'c447f518a0ef141c1e52e6b114ab49db073e07b7287539da0f0529dac20c7042353ffc8fbfd61cec2d7308d2e444d30297074f17512f009d381f04c6a56a63c2'
        'b12d0882913ff6eca47a4181ae074ba12d9780848fcd8c70cd861f79bf9c30f9beb69ee38f5f05a45747417013c66eb4ebe4cd11490d7f89a4af4cbb5bf9a646'
        'e20051932ea6edd631c5a23d2ae4d4726be2d2732b91e45d9b14ec93867b2cdfdafdbf016bd84cc8527c379d190421fd1a04319dcc35cf6db74c372fe0e6363b'
        'f570c8a5f0dffea7fe4dac4a8c7e52922d3f02902d2a98fa1bb80e1b421bc934d41367c611f8f17a5a1b9e12d3204e579287a5131b6de0dff8981efc9e58ab9b'
        '1b73a41dbf24e022aaa7de5b5d2eb447539984eaedebebb2d5d15066f35d6d6f8508ca00205c6b80ffaf46c9a409082c564f17a6cada272d7d0471e4ecf54418'
        '957872cfe92d8f75b9a02f63d4d5baeef4d8fbd77862b385dc8a7353aa82475fc6394517fb6242a23476953700e3aa3402ed141c0bd9a6446c49c23bc7293b8d'
        '34f1dd701fac6ea584f4981b2da13383a7f3e13e85a751f4526fa79f4b786de9017ab1e333b8111fa41203ad9da55454daf2567ee095e5b931652bd6a7dee918'
        '34c68c36855a21256c5c3e1c3eab1e42d519b9741faf79d7add9cc6187caed7f9b8f79c009e3585884e1fec08194ec7e3d9ccde9172b08f3d397a73f424cea1a'
        '13f9398a309cbfcf9ce84ec95226b6a3cdbfd7f77cceef8238d61d47d866ba0b35c8aa09a17c347c4c873595071e235163228966272e165dc164eff4ab82c716'
        '5221f93458e761b564cee4f109217c2bea58505ce9cc00928e83047c30f2989f9ac6f44ecb2306af7d04928de4414081b0a88c12ca16d589d84999c727c53a4e'
        '9bbd7419cd852dd9f3323450bfb6248a42ec6e219282d243d6151ec91fe9f4489c78e913c433029a3e6dae3ab1eed671172c43542d42e36f5fd2e777f0d1c4ee'
        '18f03aa78cd2a784fe18254731e8428a56e3af200f277ed669134212345245078cda00d96ef627068a996a56dffd884f49a0cac95bb9390d4563d173389f7c32'
        '775c0ac7a16ae97471334a72e6b481779e128bf8c26417157329a212f117f90575132e172c33fa4dd00e262cfb58e7653fd075be06e581d8ef9c0c1a8e51b043'
        'a3f4fadebbecaf70d09576edd053de5a60651f6fa3985eabbb777d87b70863a9f6da4d6c1c6fcb0d72ae29e8fefa11f30a00414263a08c48a4c6facd2c2d375d'
        '7f4deb891c5e951c64daae527727639571bcf646191c862766a09de8b61471e05d7671b9cf2135ac77c4091ae42297aae0427b073fe38b8bae877365f3231974'
        '86c99c33992a41168e32e98c5b5d4e3441012b0ffc78f4844dfd28c0672d7964d3a98ae6f4ebbec9abb855b5c11d92958312a9412b47d7cd524d85a1e1b67766'
        'cc690b10c6bfdb280be38206a94b921ef0b02a785fd840abf4264d42f3d18ba93ba59cde85d1b6b1515db6ccdf6c44a19250f9732ac1d2b0744c9f6ca717c81b'
        '8b3f72e7c7f719142ea507c5aade789b5ed9628a5bd8cd73f0e487c648c8cf86bdc99234adddefd0c186264aafe150149370f752fef189c5e29d7d0ae31eeb08'
        '3ece92c09599abceb31f71404ae5162f09f5eab177486a8066d61b8fba58e5f070616854ed27c8090237377cb2541547a8f8822b29ddf27f918aff9447f9838f'
        '02932eca9dd375b68bc3f6e6a7d58aa2f0f3236b756cd38873c3f660e2b4834a5fafe62b70b8a085005edce129e1f1cf324087d987c9846b70edc6c6cd9551a2'
        '647960a319f1a6aed51786246e6a899f9fe8315066324446bdbc837a441d2d158d9da948e9c2b22227fb04eb0b366735adcfc3c1803441893e3fd9c4a8acfbe2'
        'b97011f71ff67dab681d0247a56cca6dbcbe2c1c7164320fb3d111018a3c9a84086e242b0824b61fc1a3a227a6e3b8a1f1070cb7d55b0f24c4cf6d0fedb6800e'
        '748193bbc7c300f6c51914af437fb341218903e9a30bd7691e3aa39277700f6121589b9715085a0e3d8b64d5334a4a9ce6a490712931c8cd8b0605382ceb8a5c'
        'd0d3010e5121e07576e5b42b1b5d52426b87dfece3cb08d4156678ae31d21f4588e318fe07afde2566be780f4af2837b6774070f305fb76e22d470cd37e0bc8e'
        '42e1a48caa40d237b348e3f54e7f8c553964f9562e8448b6cb97744999b3739c05977ec89af48429f6ad974a1cf0d3ae3468c489f560ce56361275d1996ecd9a'
        '82dd66997a811febdc7ba690fa2ea7dad1be2c6702844281b416af3065150fff3b32c83c1cf31b45771d787ef7d8b9a6696e047a5c890b425f606b6dbd09c14c'
        '1d07dbbd8764e18feeae42f5353d028e0f35ca374e97127f3f79967a841846103552ab249ed2837f8b160b482f7263ddcc2f8074df45f7b384ac9fcf809b9fee'
        '1bcf978abfeae7d0cba5b61db2bc7d0a02afc92dacfa14c716328dc55f20f09a64c520969d9e306702a25e7435500a0a38cfb6d2ea23065ec83d78813ef99e45'
        '7ee1487f1bc7eec405aa08b4ee493b42cf53cc7a4de27f2e02bddf6d6bc803fc01339fa7cd5ebb9dfb62de0fe647d68a3728ebce0baad8aeb18c0fef4c9cbb3f'
        'c333f48a3cb800d4e59343c5072e002e7df1ab1220634a8fad2bad2d6d21b8e52b6eba5ff72ab264ab6d9e7c1121d8e3b9f4d083ea4254df985d3cd2c7452f2d'
        '3cbdee4996dd29ef32c501a81efbc9118920c5f6ee2aa28e9b8a21eb0979a85591076adf6ebaff3547059ad2ffd139ea033d2cf277a58ab6826220854fcc751e'
        '9b66af51509c28f4d85bbe88960a7a2746afc795cfc5de47d24b77bec493e6b0988c6d58b553af16c00920adf038cce41d48d9dd9b942de778fcec88c7a014a3')

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
