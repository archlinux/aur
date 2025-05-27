# Maintainer: HLFH <gaspard@dhautefeuille.eu>

# Choose which language(s) to package (in addition to “en-us”)
# This is a “full-line” extended regular-expression, eg.: 'pt' if you want “pt” but not “pt-br” or “pt-pt”
_I18N_EREGEX='.*'
_pkgname=collabora-online-server-nodocker

# taking version of coolwsd:
pkgver=25.04.2.1
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
b2sums=('a822ce4c791a481b051f809d6faa89241bad8b471536d5576c82566fd8647a0b50c1647e4fd0efd1931fbe973358f21b275632365bce175fb05d91c66dadb868'
        'd00c5ef999954bfc7b1a4697c3007a4fdad68570dc5623e127b84d571ec1c56114d86663dc072b6998758e02843ab3624e1b50e61d630e03fc2ec80d701015c2'
        '765a068a6b368d0934c48493e060a9962c87c6c66f21dae3d23282d42239f540e52465d6280def3284eeaeb0fbb9194f0fe87f1e77768f4e3625b44f68759253'
        'e06671584a958b7491dc78bc391cb7d6f6f854a6e2f3bd21679f44803f781bb46741df3b1524ce3798105037b3ca275f4c88975da04ec25551d8172397b34041'
        '1c2209a447dbe41a1d93198ee45b513aa29caa868100d9b5534fc2a10c8813dc0b792c0956420dce7476709d3de71c23f488176d77017a1c6ff7b21379e7e253'
        '3766039827520443525fdda2ae35e531f5960b67657dd43e9fa94baf6bf43037b1362d4b771e43ce3b71c2fd889941cb97ea03fd55a8e0f8c7a36a7dcd070426'
        'ec5b6cd2dfbeb52e0fac0aa0f3854c5e0105b9021bb9fe00ffe9a46ae317c4ac1a0c0b2b4ff2a0e51f65bedcc41dce5b6aea7c2c19f106b3879deaa2863c5578'
        '1bffe2e06ca97ae96828bdb236423f557eea9648821066322a25262d4e280dfbce3111b3ba5352881565af8f3041fda7ec9cc1f4dd2491a76206509fb587c13a'
        '8effae0c7ed1085111d060c20111f2fac68bd72a1dfdb42842b28b7b04ac5e27522de3f87ab6dd1a3ca0cecfa01cb4ffa10f2796148be4bf73928a43e7d9cf1f'
        '8a499c19b59c4cfedb3beec26a00437dfb78630329e7df23f055bc46da9ebd67c617e2b2292153783954be7fbe50220c420ed2555a18d1363a4312735b618d99'
        'e5bf0186b40e66449ed70953f109c046469b06c1e03537603260354e3fb52e6875fbeb886ef9fccdc49498fb6f86bce4e1b36f896f5ce0eeca108683bef8111a'
        '140988c2406cf8cac71e733253546d39622350ac5078a7782fa711dc847faff9b8afdb18771400a7acc9f0eee57b4952b0f5aa0d5dd0fb75ca9f9f5b446184c0'
        '781ff83345622844e0b4496fdf8ba7564a6260d8028dbf966d5d5db28730661d03482ff967a9ea63b34101687572484d6c57025a3b42e31bd6da1d4c7a75071d'
        '13ea8c76641e3526227ce6530eb844560a8556c1c10d6f0a57cb6f025cc751816e5006299239bb7aa14b2906fed7d4c2e94a3bece335bc1b442d3a53ef2de777'
        '13e45e3fb1042a9d9c0665318c2244914b4e2d1e6b391a62ab1cd20287609bb106684889340081419f594e85984623da0117df2cfc75b6ea74ae138de101b2fd'
        '20bf5f424d2b4253e24472a22e72ddb35870d349d7291dc9d1c2f8293bc93d8e96bd76b96f3cf07532178d58455e6e305483bd10cebd9fe53bf26fa1ccdf9aa3'
        'b0645dc3e9fe6e85e2a8575de1ae20dc0eee05a7d55f016e8cb620c6c47e4944a2afd5420c0db0de0b39f37be7e21a1b6d8dbe5fab9c8b83bc0e2ba06c29be14'
        'a5af2c66886e1e6866181a46bd9c8a637483380088a06f79d7f43c8e1c9e557adde3b8aee6edce2ba6bc3a217e2b51b73ea0d91921b7bf5b6e6fc2e58d22fa79'
        '9c3b2e929bb4939ab707513fc6cbc35ed66aeb2e44bf0d8c664642e4f23fbade7fcccbe534b12ee7862d47d47455d8fb0c82f65578efbcc04b207983d5bfcc49'
        '98389c306b47e3bc6343969968695910c21acbe8d278fa188523afab77546054259d68a14cd02be6c219d1fec3ffb68e3f25ea514b31d51af0970c3b394c9f1a'
        '9dce1c8a12fcd8fd8def9926b9605c75188d2c61c29de7e77750fbd933df05588d27bccdc92d916c0d8fb0605e916f24c52a7ea7674055a91393fb262ceb50e4'
        '4a3c5d7c294b979de244c6cdd96f76d42f8c041aa3eb34ebf22bd9285cb22727fc88318d500e06b9cb7adf3530894100f9f6d0060264422ee3d19feb90d899fd'
        'ab2771c92041aa5fc86c84fd58c214b56a5ba940a265d8f24620484706cc6a9c4211163944454baf029592d76ac2d069ecb6366c81363d622cb2d09db5130ab1'
        '3be6842bcbd89c6b4dc1f5398b632738ac2362d3b026357fe9f9656b48f4397506d79bd22a1a561fec464b77bbd489d7959c5aed52d29a7ca836d63c0b2a93fc'
        'a8cb88dc97b8a27f4442f1b072f3f7fe36b28a134205a44a44c544f61cdfc75f7e019be72a8910a5a3a076d8fac340f839a4737404c0cf19645f6a8a385f0473'
        '5438696f66bd9b39a42a993c8f8704ffc725491a4febbba1d9b57d8dc4c79b90da5b18983d3509542b273b3494347ce7e0458ba67e204264964993b811afb9a3'
        '86c36d1927df77352f921867f60762f417443695c555376ba3cfb86fae6abdc012b8fa858740e05d0b3d723391f76c0fd6cc1f9b383be9619f0c5f1ce7ab7a4a'
        '1a236d785305095801c566779be2f21b5f789d7065718dfb0d145fbd6c36ddc91288f960ffc49feb165b7fa2a5a13f952d45bc67ec69353087abea219f50b134'
        'f1885e5d07a7db9f834892e9d2313fc60b6459fac8ee8a4b4e5248f902cf9abbd7082e55a187b59347a5e5d2cacadcc68f6a55a1ffd3a607be9acc77ecf5bda8'
        '6ba4461b6489ad406d9b211024095b24c27ef73ef9be10e6edde587f650932d95e877a227d24e1d09d191a0cafff9ca39a4840fc45dc83b3de00a99c9a0df237'
        'd47c384c3aa6f8bdd8af1b66a5c45b6ea76e67b425fbf13b7f3b22e50cfcc77ea01120e4683370ba6a832c452f28b1c7c83e598b29c4dae96a448b47c3c6c81e'
        'a503de8e3f878a4b8ee7373f3abcab4353554c972386bbcfe666d802fb22eb97871118b101be306df58af2097eac1a0e773e22f655c22c666fbda404feed0c49'
        'd8e721b9008f747494eea861564d2e2f6d7ac8762fba9b08ab97891b95e3f8c6504ffa592f1aa7ce2d73c41cfaac336988ab02db53afb07beb4f6b64750e159e'
        '35383539950855a85ecc2348b16bfacd8f5b72a7c0c2f778257531ba134c0e9d6dea12547cc5cac72c84e6c79f579efd125583590a6f30ee74fe56061c6c926d'
        '1091dd9dea4ee7fdb953e50c5474a7c44aba0f92cd844c8083967b252bbd3e6e5cb84176f7e2a04667424b7ba5b04efe915c9785b49e8077f9f7f096f2f1b8f9'
        '733844ef88466ddef37101c8d5ef59854240aa31089698d0e3f37d57da9cbca12e1f36d30e4b9cc155af065d57b3f583d5936c1d68f29628e5d5be6a55892660'
        '5f86786fab4cd103ef11815357ebfa0a38a974748816d16fc4284786ee3f868bd82fdfa97c637a0ac8e5ad5378498eb2989452257939ecb9d21309013e6380bd'
        'e990dcd499b0ebea257fcdc0e17781949ce5bdb244ec35c5d3bda081075f6724b9fa35b8611d1ab129ea4155dc8cd4f6e82e77c52bce87c6ded2373575c8203b'
        '16a91b5d050bd08bf65e51d66ccd860ff9a53a820c4784d88d6ae84987e741b12a3c853de1af31709dcf8438c4cc2af2a3f50dba942ffe07c67784e7f65024f7'
        '413ba451a53675d54fdd279acbad62aa8cb1eae728051903f824f14fc55087dc0d3832570d3346d2ba7e205c76dd38483f27bd99d7d57bdfae01cc881f7dee08'
        '177c833ac9a7c442afddba092f7411c8af08f4c3b4105ff868c6e8fb4b8f8d369d861cc780fb22d6159409437256750cd1703d9bfec2277d7086bc6305c06057'
        'dca3e1e570041eb3aa66fd99bcbee21d45a7c33bc8af376f4caaf585480807abf8d45666fa702a2d4f1cdc2bc587b9684f00f0164325e120eea40c1e25ad02f1'
        '731d5b2dc3c06f05889457910f311ed5962bc9d2211ae3c785bfc0805bb7297d34ef4cdb9367c296b66841fbb9230e409d065b84b234cacfab807e1f15e94598'
        'ef49141872bf9ccc777dcd4f0273194408c9c64d43b582ea5cd1e642f2692f0fcf77c5bdb80ca23952fb5ee671baa681721e060d4f42978a1c4938f2269c9458'
        'eb2526bda4b8b905709dbff8da45bbd41d8157a57df9ec438cdddba77e93bc947217d3705e1ae533bb5fd18c68665d7fcc977413586e16e32e110b36ff1754a4'
        '46c695ce124879cd079fe453aff850d017a094ea7b29c9345edc12c3477d246115f1f10ae0bc72ade7d78fe25e34285dafa6ce9e426c1e8d13f6587779f643a8'
        '0616477ec5bba1c6ae50d417a351b69ce6bf90f95a91247690d8cf67cb61e0bedf6f892ddc003a07d914c637a2c5a30e7d3018c0344a1e44ab415bb8bb1231cd'
        '3ae948747fe3c294ca792e743b197c831b8de6bad61efdb18af20e184ecac641cf5fc0ad659d1c2e5568d816039c27a50909cdac9160911bff0f3e9984e678f3'
        '963baeb2aa768337fad08abe10789b1237c07ae59cb2abf35cd087a15eeee72612cce7661937d3655f8814e8ef721d3b04c7e643330ce98434f4832af5215444'
        '3811a83f19722d8b08936a4122882749ccffcb70be537196120b26c6a971c1aaa47bcbdfad6fe782b245d2995786f985283588b653380a8cebb4eeb3344fd7d9'
        'e30a2beecb83dc7f8fac8d24248772a54bb4a035d975657094d7450bb6c855d62d07cff027c418f1e31da87f1efe7c01d6fd8da460678940fd69fa1264bf2d16'
        '65b94fdaa479a1526ad3adecdd9d5080f0a4c7b89c4ef475e6f8c3fb6008de144ce9cb93c394400491acc18d654129a226c22f5b67d5c7092ff1a9cc3f9f1e9c'
        'f4bfaf19e0d611cefc0aea34359cfd9fa9a0bb88aa48dae76c2f1a6ff97a61d763e055ea3eeadca82ac9a70926001e4466fc1ac00790ae46aeca806ed120427f'
        '4272a98bb15f8d15d6da6d638c33c1136c77d3ca4e9fb387fadc3cdf019ac935cafbea6804bc1ae34d15c58abbfea172f91a55db6ddf44b2a2469d76c2c89dc4'
        'ce101f76889fd3d7a0c066a7fefcce8743b82c420fa65f53e1b1044866f1de948fb3ab6ccf37351add242115e3fa9cb91e131b93ea63c9465bce31437c28623e'
        'd869c97c343b914672a76aeb2cb75524b0b499eabd426aa914e75b369db589eb7d0227f3fc5439a4b78f274f2824a558ef224c032664a68bd2eab2493db2cd8e'
        '5772c39a1e7333ca7000a39e3d0a3b19b89806af666b5871bb4931f3888b3e9a72cb250407ab8efac4b1e86a189ce86de3aa73008b15526c33db862fa7f3e321'
        '5ee68cdfbc3ce08d913863885911d177cbdb090373addf023788a4bfb1e12d21ba490e62e2ee936e2a3910d1be5452cc981189bcd7778ab5d712dcca0866993f'
        '59693321bea17ae5280b8ae8e8489b1d992c542d07a3bbb2dc55e871cc2197ff0f0a2f28320d13ecf9e15ccaa8929a06e83e0698c518f0b78c6ea2dd7d274b1e'
        '172497e8134bccdfc2ce9981df2df44e0ba2191b66ea972f656165d2feb55105d9139a440a4ec65e2c789d0339f0dd5c40e947e5d49f0c28142bbea39e4cd3f5'
        'edea5eb80342c1bf7c201256ba10aa578f025fa95d4a6c34f60e7e9ab8a66299e9cd23e2905942f9dec546547217e4ec7f61f3de284954ffbd280aa1452f9ef8'
        'dab902df479c4a771714bf0de36d730d8e1134e4545207409af188b93083648c75eb0686cf7f098d416fa5e26bb39d9ffd3d19528db7ba016fd13696721abb55'
        '65432a656bcd65d76b3b793bf8d00dd42a856e60bd37462f27c193456de551ff03896baf00912695b81ca6e05e1629a842812d0246ea831aef1f8a934317942f'
        'f3bcfc35aab6e1ed3668ec5b674e0acda4fbd4b0db20563cce8088c1588d53dd076906cf7af4ad4dfd2a390838f50f4aab5a14eecfff3a9d5e197480cfae4599'
        'aa0b32b2f739775eaf4e767b1b9c37c22b5a4cf8193ce8217115cb38c2a2ac4c564c29cac8b9ee52a34a93a62b58b9b165f9b7169a7d2282ce530b2f4144ca42'
        'f0188df5e72fa9f47c76935de0a7ae86ef90200969deb1e4b9c46475eb6d8e88d35a16e8b33dfb0192f86cc02480f9623cedf56b04d3b8571a86b5ed19dc7b0e'
        '06be282cab6187c9c0b045c62ef4ff61d4e787b57d54f232d6e7c761b0055dec970e97be45db766179fe0ed74583d3339f74da64ebe62797eb55f8fe7cddec18'
        '859f66127dacc6b7dabfd8e5a64c14e404be5dd664573e154b117d884551ccba90e7e40f3b78d4e97a229798f903140ddf28dce15c0ab62b1121b7ef56e22b0b'
        '93f4ee5b6e37ff497382e7601e731543adbc5450be4134706bb6ab3a3d3acd1458c8be9cddc823844f670bc292038892ceccfe8c2a143c19d9f217a3db5ebfd0'
        '2ebba811275503a4add7f65891c3435087ec4cad3ccc83bd0a41b098c148077ed595d1ddbfc36acda2efc1533ef0fa4c59ce6fa2afc75c41ef6b91438803a31a'
        'fae5bab28b3876c85851967d819b8e0a1212b3f153da7d4df2f1f5b689bee214f2ed0b9fe71b5e573d140f7b6d423f4344562fd77401a7a68f66195dac2a7423'
        '06b509e3d2511bd5b0b2ed2f96ca5b2d4f24b89f7cea4b0caed037761243765306c1c769f6eae1eb4ec097448a5dc3f2bcbe1d13092975e6f3ed7c91ba1c9041'
        '3f509417d31f8546a54c40b7fde74f71b2ae9336ba8aaf8412134c72cf1c215736173abcbb72876043a8beb9b204bd65bdd800212bdb45dcb160184dd7c93a8b'
        '53c62aadbc414a4756a2f719b7f0e761a4a9352c911947d53b4750cf273d5a77690dedc008952b866a94b1008ca4c91bb98e4c1afb1c186295ea8ce3cac0ce5f'
        'd3af0a29f2e3c7a21880c87281a6df26f7f257754810bb0275b747e0f7b5afe1568fef470a0a37124e6415edb104457cb4fe2f489b7404a17b1665c340dec427'
        'ddd20026b5787a86f8258b347453dbfae52212db52fb2add2899e30804d3deed23e6f917b7700d17481c3fa86806f909618b9479b0d0aca413302ea8634bfe12'
        '0f4f55d1fe36138f66e5223b2e971881a6d19f561a9d2b090ba380cf09dec97f42889678687da52b861d1d0332814607ae93d567192049bbb94c3b3947848a70'
        '4811625b467a6597598a44a952c1e459f1174da3d6a4c5630242cd33389c055d2b745626222d64c1ea4d43cac09d9a058048e8a1d84c2064c8a7214edbeeb846'
        '37aea97a579fd0dc51bcb04d7b53646aea8822acbfeae8791f4b66c6bc1b130310cae6c3b6d609e86605d95e16e27de7d4dd5c8eab18ab9142e8f5cf3436e666'
        '90f969e1c1d4b5de3cbf8dfa88917e7a26f3095e9176480e57953412851610fca10359ca63ee44ad8df9763b664e2ba192acf1e70252e3fa86a6168ac693c799'
        '3e33223febf3be4f8a46756aaca1e9074305afdc8a86f92ea76c0af1e8cf39d161ffe5bdde9d16f96873d64d8065de2408e788b4b4d7eb770f9b1b98d37cb403'
        'daa200e32cee3a47146cd703b8ec472fc1b72b5bfa83094b00d14575e95548af000c03e3b93c015f7b0551b7eef160ad2f5a480122cc9ffe111ecbecd7763185'
        'e1ce9fb5d8602651f8f55b9b5d87458e8708f5fb1abd43fb0425d37033418669e2f745b0a3e3020fc61e346a86ab1246c60b18e6015603029d1db6c3c73bb779'
        'af73958a01a50e1a03a1e35ec905b6ec06c91aaa30c8cf4bdf4c26832d76f58830b0f6b6c9f4c4fe92c3a98067ca5281e2865ced52980d6ecc2d6506d88c217e'
        'e522cde79bd4a8949b42c1fc70161c42be1ffcc1ba93864e299967f7b94e56ee9001babbd0c659305166979376b124410e786b30293e9d8f50ba98adacd6012e'
        'f90525d22f75b632b02694aaebd0cc9ba69aaf5830aaedad65fc103d485c3bcf47ffbacdf82d7189d41a5e6fcdba8742d7b87de91c4164da904204c41445fe14'
        '35a4884748c417a2bf197e7f6c80779010b68b2ad2109abad9a7f8e87fa3d75851d1ba1d5183f434805e4fd4ce9ed0d8512fc110559d1551e1e0c5f05086d725'
        '0cca0e33ae5541998f60a0981c65635cb061bf54f1bfbcb72cb9ed911cb35e6f3de4744c630e9a8dd6f316bac19f3fd97efe40db2ef033416e9780891f0dbd2d'
        '7c33b1c7c8307c6f19269afcd4ee50138e16bbcc622c816fef9e8f3a8d5729ea569ff4f9b0a74c562e5dd48b89d604420a48ee780c9a6c0d7d7914e2947094d7'
        'cf8c9144084507d8ed0ac55688d67c2028eeacdaf6cc96f21bdaec06c5e5bc2739abaa5fbe23b924cef3494126a4f18d49bf549c6fbf988609a3ef5944f35dfc'
        '3a15319a6dbd75837732cb95e169a2a88594b65834391c1c123e70662cc2c65f0cce31f90738d259cb688dafa0ad13d688a68b90e44f6140fd5dd67170fcb4bb'
        'fc8e3079397204e9d91f1f7fd26f01ba475c3e19226ae36e510efd8c7f436fbff40d5640d1d0bcb5a78536021cad2bab01a8034c133e18006b4a36db8bb7b062'
        '247cdb05239df8e54796e04c0902ee778bd3c24612d61e14bbcb5457b783002f03e5b2e9911df56d70c56bd2a14e09aecffeac9090c766fe5766583f81d60a07'
        '46a860c74ecaace64524e651d8e0fc3036ab380c4250e05569d4535463703aa4ad71a15a1fc7efd7b5dd16ab08bbd87ba367d17a73079c723f850fb954c0c137')

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
