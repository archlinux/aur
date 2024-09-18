# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>
# Maintainer: Sving1024 <piano5432@outlook.com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
pkgrel=1
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"

_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi
_version=132.0a1

pkgver=132.0a1.20240917.213026

depends=("firefox-nightly")

provides=("$pkgbase=${_version}-$pkgrel")
_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=()

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-nightly-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-i18n-${_version}-$_locale.xpi::$_url/firefox-${_version}.$_locale.langpack.xpi")
#  sha256sums+=('SKIP')
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=("${source[@]%%::*}")

_package() {
  pkgdesc="${_languages["$1"]} language pack for Firefox Beta"
  install -Dm644 "firefox-i18n-${_version}-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/distribution/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('e32cc2a1d79d807755fce149329639ca8702c520031d91d2b298470ed5c6bc08'
            'aefe7085c985bd8426e69fa0abf1f423f71bb5d278d30fd2f771e08f72022a8e'
            '910330c2be136a3fee7c69eb8f8103b67c28659cd8107c64de621859d8990387'
            '2a92fdb173ee024a7f447e27a9d7fe3fa48e6f0e6dc237755b34f24bfc92b7e2'
            '6a31f512105b00d1e22c6ec33bcf17cf707229ea82ef1070c3cf79b0c9497ee2'
            '1b4c865ffc76765a276755f9dccdd6e0563fc2465a3c51fa0a4c0f972eb8743a'
            '82475ab794e640b9c05519841657543f44c4926547916a0814687805f3724c04'
            'b289b6067d9ae399d50bafcf39a18042cb5f579c1c3b0945232b5560db90d42d'
            '2d2bcd8eaba1cedcc2278e37677e96c739bc1789d6e9924d7bef72fca0375bc1'
            '98e4fcb96fc148deee636ddf552119b74ab278de75a6f3de60494ccb5d006971'
            'e39ee84528340f4fb7f4253e09557ea8e54d1e4967b8ed9cb4aad5b64121c83c'
            '3c2733621a0e55de698b699670d2cc25fa5800f93520f40f8160177c36285054'
            'f67bf5d30e2876976eb9959446b13e7a9a2897643c351765be6e13d2f22b0878'
            '278aa786991dff1c1093752eb2855dde333db12d1f4f4cef283a94fb82bdf1cb'
            '8f0bbd6d600af4f0052217b412dc58b37d884d8ad14503b7d0e920aa27b9720f'
            '75c765047cd47ea74082d04becf68d32c570050a15c3d9aed706c3683c47c65b'
            '56250ac4e21bc0dcde0e18d66aad61c542d2d77feed97a5e52f32acb305d7b07'
            '8c636f0b458f2a6b04b71849a6824162d8ce59a07d280a12814ff8406fdb5b88'
            '81465e20fe440f3b545d52e31b2577cce91ae46eda650791ebe5975deb726912'
            '8b671ff60bf5ef4b94ccd4e5c1e726953eaa3dd3426cf7ea22b1d4b532c67624'
            'b1924c795fbccda29f2683f404c4b1ccb700357fd8d15ea928a89180850b4d07'
            'bab9528380440985a14c2f785cca5e90866340a7889393fbc48631f39d979cf7'
            '0e00b3d5ae3ed155541eacf8c4653644bc13100aa31c7069bf1139c4c9910e99'
            '15341a9e2df91d9a1a01489842983400f74f35657054c185524ae4d3c6b421c7'
            'eb808a906c2982f07daa84cc7c680b40281cccd703fb6f1fe48d35545dfdfbf6'
            '11e56b36670cfa85f483d08211059ef5677a52acde5e4a4c1095fd87d5f6f249'
            '74cd964c301adf709c4534b56e5027dc52f7df97ca10d6de125b667594d0c366'
            'ded5d43815c5ac2abf66771fc15290462d66f8d58a5e242f9ae2c0d0071a7e20'
            '307794e7ad21e937a2062f865caf43edcc3996b7cfa0f504d6d98f9318feeb0c'
            '40c7b3e7ab78138d14acb229d4f6a3865d9151c364468dd8f0d79e5b7d4b5263'
            '2b0ed429683e510ae757e5646812c1d27d16b002734199ffd5856618eebae896'
            '2af693629d17127800a4d7fb82438f69d73c97751e8bf93648f4c617cb05a3ef'
            '0cc7ec5acdf051057ea1e907d41590082c9691d022c1eb524b7938b3844b4edc'
            '705cdfc72a523d23e4329ac35f7c027213a9f224b5b479b30d87a733ed16e753'
            '7bd148dfebc30a3ee6ba07404c731a407aaa9be21f5425df0c02ff47b61da250'
            '6705f7f79400817175125b9eee8f9b0d3999eb9f404aa54138763c4cd902fbf0'
            '0541e5a89a4fa2aa0d349ea1ec3f1debe2d751c609316959cddfb78c26e17253'
            '3bb0bba03905bb01470b9162fc6fd0b23b3d372c938fbc540341e8f17a5dc761'
            '6054b209d4c9419b998abc707db77508ced73e065fdc90749f7a52f02dec547f'
            '9ff99a3524ad1d47caffafc8596770917b01390e290d2555b2ccdeacc34687b3'
            '158842848a608faeb2c7458a2d0a00f4e7d3f157264b6be5de195c11c629d740'
            '98dfd4412f96eed5eabca6c5f443684e2a5a98deba99137b602c57185e4b28cf'
            '0223064651547eb9b73355f48ca583b6563f6f706c030e8df244fd2ce3e3defc'
            '163485f04d01c1b19d0e9b2e61c8b7515d6325a2fd39407b720f62e065bd2184'
            '008c148650ce9adc110d275365f9c9087063cf93b8e3582fde6005ad0a6f4f8c'
            '2bfc26391ae8271d52494b607ee5de2d9583359993213cb5ce9a6f97114b8296'
            '896dab755848a29285bea4e5bf60c1bb98bb37fdd86e937356c0d61c55161ced'
            '6583a2d6cb20a0cb054291e27088128a35b9eaf023ae441b5685187fc2244a26'
            '5344b84f6f571ad10017478d0904707ad371f403a8562f127d522c5b740a17a7'
            '31e51155d8144ac83d19d7c7ef72ca44bde67fb7c862e17d9050eff14cb62ed0'
            'e28050511f10e406cc88c8abf95915cc20f9e27c0edb31c52f3bca38b76027ff'
            'd1e0c5b1c22bd69265ac72d18201d503b9a2c76fd70f58167b9756a2d285b987'
            'b7109af04fe0845db5bc9a9d2b03dce039124f06d422fa9653ae9dd4d63147b9'
            '81d41cc29732242d9b09702bc0b23178298a7ce25c92df5d0a629703340ef5b9'
            '750930846de3bc72f5b75852a6677f52a28c72df963b35779bb92d20f39b399a'
            '54c6a07c79892f9ea5c7d0bf962228e31c6c8002af7105375f36bb8ddeaa56f4'
            '1577e0e4e235d6975e65795c918a8d4cc126f680d21105736b144f8d84e851b8'
            '9b6a9e91a5e8935c3570b2f6c1ca6a7f98ea457b252db4226602f39699680ad0'
            '21e6f5e54faa6ef4ebc4a04f2a35cafc949cda080ea588edadecdb2aba7ec89d'
            '240e8d263fec203a60d2f30d2bf05f6a39bd5193692858b74178b7d91868bff2'
            'd5e3e37f5d40be8cd0d373b4082fea637015dd9ec4689c5a4daec73509dddc76'
            'c256e2ed5d475af8099c83e219ab4843b90ab2f92100573ee3da46e57e143d7a'
            '8fc52bc0eab80d34f5545301ac5e7830a27dc5e11a1927e67f0fdd5dfc4b9e50'
            'bca99d6a12b0ee5db536fe4d0495990817bb2ff31227735b17474c0be265e07d'
            'd46235106e85b2f0cc2ec04965372e44fc4371bc5cec7bbcba15fef6ab458fb0'
            'b56e13540bc179f2185ae74f1558cdd74c7ded12f113051e88e80b7dbca16c27'
            '65721a5e428e2dedfd63a72701291a18d9036d324cefd1165b474787244dfc7a'
            '6c09539d27555f7929aac3706e264f17837c682318bf8069bbe36b2d821e973b'
            '78b0e5029b90c86e0c2bac0c9e69e5f69b98b0e6d44659813ed7311076de080c'
            'cef9a13a2696a329ade3ae475c24d6b1179d3c2ead6833e3b42d4aee55742aa6'
            'fe363a1d41e09b84155b27aa495b73429325d863e09274c2707c948b97f4127f'
            '9c0a232031a163cc4343e3bbd5dd1650631b9636e55c7be58a9984e9a2bf7ee0'
            'd348995c508aed8bada05c7c4723d00db35b3fa05746b1ea7ff875deb0dd604d'
            'f5301e83fd35cc891ab18a99be5ad400338b900d82cdf36def2d96ca6751c441'
            'e61d9c444c5c60af2fd9df0a5d11378bb975198ae8360438a069a6bafa2d32e7'
            'cd2f7ffb41b7409ae3f9c32f896b565920dfc6eb49dda4acbfe0f7e4317fe8de'
            'ac2ee33ac2e44f91278d6c744ca39440f99e07bfbe82d17754fa60969b3a32e0'
            '8b4644c7098b6246e2dee287e22cc6af335063ad415b73f33cfecdf6d8d61c43'
            '7d6f422a73c42ef42d1542b993c26e1a2898957a88e6992056435cf5ef52b7e9'
            'bb48aa166ec132549166f77534bc3ac38c37387cca2ba16323816b922114129b'
            '52f354568b2bda44f7a46ae3ad336dd178b9fa3b223990e1f31eebf7097003ce'
            '33fabf11fdd76eeac7eacbe42ada12d86b5e06396a7cf4985cbab2d73f0838fc'
            '0dbe0d64acca2d27045e2baf0e3939a16e891c58992b2951aec416808fae89c4'
            '5c36de02e056d168ca5af2c6407eba202e4ef78ca1160a9d5a0c89d6ad201aa9'
            'fbee450eda40161954f2ff8f2f8f73ef34bf129d173678f24768d6071f94dd8e'
            '7895acfb5e21b8b4da962071fb3199be367634e33d541e556f614787ff85e6a6'
            'fdf2a2a9350f45fa6e37266b59bade967dc8a852f9c1da5621ba1139e81ceee8'
            '2c9e3cfa6d23de5b40b95f98eb16219a754578769fcfc6e4448f5a14c63b8829'
            'b5cc343fe70e14d9836a49e99bee9bb16e3385d3eeacb22b3e50ebc0a2f49ee9'
            '820f820a8006242e119076a5f1c071bab266ef64464401bb5b9ec14f277304e7'
            '2a66d94e27a996674aad896fdb36c53e73ec980cabc9b6705171c87961bee614'
            'ce74f00cf8184888e89d8765a66a7049c72558327395ff231b8de6bdfd52642e'
            '7e610aa9905bc489d17cd5f7fde0f1ecca15976868976eb7c25a46d7fa8e4f9f'
            '39a91cbcc30de56aa60c149bc55eb0449e68277892f5306a408020de172578e3'
            '1c42eb7c1aa6a1036d93fd09afa2557ae5fe998f77d91c661e95de6acd583109')
