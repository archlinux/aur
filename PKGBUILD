# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=95.0a1
pkgver=95.0a1.20211006094130+h5131e85ba86f
pkgrel=1
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-nightly>=$pkgver")

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
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-nightly-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-i18n-$_pkgver-$_locale.xpi::$_url/firefox-$_pkgver.$_locale.langpack.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=("${source[@]%%::*}")

package_firefox-beta-i18n-all() {
  pkgdesc="All language packs for Firefox Beta (meta)"
  depends=("${_all_depends[@]}")
}

_package() {
  pkgdesc="${_languages["$1"]} language pack for Firefox Beta"
  provides+=("firefox-i18n-$_as_lower" "firefox-developer-edition-i18n-$_as_lower")
  conflicts=("firefox-i18n-$_as_lower" "firefox-developer-edition-i18n-$_as_lower")

  install -Dm644 "firefox-i18n-$_pkgver-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('a55364e4641aaf245a682aa9cd50cc6461d6de53a695886f6860a8377621eef8'
            '1c7830542f943673b966c17cbe0e463342981c267aaf43729f181ee8fdf56e89'
            '310269ee2eebe11173399114b16d4052bd40b5d43aa06daf7b7550771ed4cf47'
            '4b0a04de242ef6d105ff83319e04d0152d11042620086b98aeec9b4edf0a49b5'
            'c8724d29aeb354f2a20347cf73f2ebb6ea264f4038287bb95be0b0700aa60737'
            '7d1f8a9468c016af9a6bec041a23325068406978f5a4c2959b78092922ad637f'
            '84ffdb79a6bb4c5b77cf7411b6c201aed742cb4d3104a85e9ed3bdd9886b7bb4'
            '2b2085777da318e41d0c8b2b4d618c91fa82277a730e3fc0f71cfe7278554c77'
            '160e71ac737c6b83d10b167e2887e7e3accc2a77fe80cf24ec5d3e9611026a77'
            '4abed5200f1c3475a8c025b7cce73d1953396326325a4c0a72cb074193231753'
            'd1b91d2b0a2cfb8b32dfd1810ff619cddf4615160b5eb5bfbb04bd49d2ad68a8'
            '9c2b269d21f054b8da9b21b8b60643cd64766d0f5442d40344259ec1cb170fe0'
            '190204fddfa86b662e423018f227671284c6888e2b4c02d09d6bab02a9006d4e'
            'f61d51433d2ffb4e3e21cb7448792f1c58dd1c7b3a375efc26f1125e4d35f891'
            '2f1ddbdf85a68a9ce83e4685a6cef136fe5a8ebf7f12887e42c0f3be88c25bc2'
            '58b05b4bae8846865b9743040a2a6c708f736127e8096d010a11cf4b9811a817'
            '71f2dcd097133298f7ed5eb8ce352679e137a7c2662c9dd12e11fc365a094a4c'
            '4461fed20e1cba0d2fe22ad33b20b1171fd721869ea0a9a18b735e4c5aea3203'
            '7f552467e6a240315b4276fa569bc3107f9eb83b2f957af801f7d428a611fe6b'
            'a8555b5933508a59b6b568c9c5047a4142497164726546fb1370905974be627f'
            'a261c27cfdcf6af95cc7d8db0331bcc069bd562abba7ad699fa5d323b2f6ffb5'
            '6832d1039badd255a310004370ea8d2715c8722d5f0ddec5b27a65f8c2da7ecd'
            '6b815ba72685cdaab324ea8354ca5743395d9f844f7281e34253fc3110e657ab'
            '07de01adf333bf799ebda90aaf14b148b71bc1a387bfd1cb504a38b7dd62f6ee'
            '13a0f9cf136167dc94a2607b1cf9b6dfd3c41e7de70dd0d391b6c61a97aba3e9'
            'efa2de976a685f9446c0e050c8235be7f12885ca87f021559ca39eba116b0b65'
            '441988cc5a061fc004d6e36dc7ea3253f6a1260f423544e4f30a24aa2d45e596'
            'd07149e5343fa55b91b18ff1898ac77a964765bfe15923ded291b3291fc5cc80'
            '5fa103299055df2233317e486e41e511952b75ae4c842523e60e365fa2ab894f'
            '529f37fdc52a725a6ba3baad00b70c2fa830648d9e4e176fff267cdd630daef8'
            'ecc9ecfd0c33ecc9aecfb7d760e8453b3f59ffb0e9c1d8f8c4299878cc7c7374'
            '699816c88ace801ced46228d2fe260ce69748562f160a8a83bccad7a83d44110'
            '2e0b761377a45f7b5c90368cee1ca7ceb48ec7e8b26ae0008ed8a83e164ebc24'
            'b4488b0b1b0a8cbf7dbff9fac085dfa8e6c7feda62f07ea6600fcd91d54e14c5'
            '32370c9a6ad6d816c5c04948d4f019415aad8e37ab578dabd17388712e8a32ea'
            'a177c6bd5c7dded57eb80b1341410c79a951cc0bd79dc397532a86474e363b1c'
            '4c6a9bfed6deb2c767c69ffef0dd2ddfe9bcd8351c03ffd654cfcf4b84dfbc88'
            '59d137df2a49f4857bc486b8a1a8745fbeb3acef10cc4c28697168c7375ebfb4'
            'df06809d06f6ea34a851c3c77a0bffc1d14646050c629d012a10279a6da078dc'
            '3653b836a65eb4af9a3a6a35804ed81d08e967a44ac3ffe2b8ef432e4ea30994'
            'eabe5f8de87cc4a2e1ef28efc432659fb1f9fef3cc20d584df94ba356d2f85e1'
            '7fa3daf647e5aeefa163d3e0c82527bf6e2adc71220e15594900052fd16aa6d6'
            'c280ebb34cfa3d91591bdc7367cadb7d5d649913223fcb95ef0f147320872017'
            'c2e3792e9c95653d0cff6411957e187bd957afb5db8e3d932eb6a7235a6470b2'
            '8d94bdd7807192ad59065f95c3a029436cc009406e2b5f03860e5e9e6cf0300c'
            '912f1c160ced60a7ce4acc65f3da4adf0f469567071a40214c6d1cbe2b9ba993'
            '3234e84a96fd4d08a192e0e5cc05872e650d9662ccc9898e260ba124c9f9b02f'
            'fa13743d706984bf5f7465b145ac6498a35a84a76c4ce53ce213d8d4db167e39'
            '13266b3176f5af103c44f601037af5be57e64f1be1a85c9e48ef7ae2fa923d0c'
            '78af168ce0a196d99e3111b4c14929a8a09febe4f9741d85f31484db21de4908'
            'db98a95acf4e7d2dc11d80e68b7d308a580ce5035ea2d3c556fa6df28e87d1f4'
            '4c559370b7b2b53bd3929f2e61284cd1115027a8dbbe31b9c9b66491b0f857e8'
            '5a8292a94852196978a6759166b420be86928f6b6e8fd5cb8acf3029f149facc'
            '59c064e29a46c59407e08d0736de45168a8d2c34c24a11e855da3882c86c80cb'
            '43438e1fd514c753f7941a0b0445cea7620d8e7114ba518d4802872b6571e96b'
            'ef7c59d4ed20888a6912e2a00353f6def8098c4933a7bdf3f6a5584932edfec9'
            '7b7809230142b0bc2cac10a9d3383f9488729f7f629531a3ff80ac0e0bfcefc4'
            '55ebef9a138e4a29d04b27195eea3a3c47a4017940070b30263308f0b975de3c'
            'b0b8b6142235e3a8f205458d48b755e9206526929f74310b75ea8440ea58494d'
            '642ca2a82df845741ba26a357fc56fc0e7f776b5175ad54e05d97fcc7c9dbaf6'
            'faeea0e9903d8d9e84c184d3d043d3452023c9c01f745bba24b12e0a29593130'
            'cca281fec26601ab484d73211d7807c79d86646ed707d9d77478e9300fa9f9b5'
            'c114bde78403d344e7ca02f207c0ed30ea053b1e69545e76a80212e590b9f012'
            '3013b2d186086f65cd7173cc0d40c14a33b288450fd774ca902c46a8ff7ce195'
            'de23bf221718ecb66b90f9f805b069fc7a0458919c87e9e586660993106ac245'
            '4a314fad7b9f9c5ac8247d2b38388df7dd9314326ceae2f0e2e300333b610f3a'
            'b0ff8a37174a2110156b143131f0419c39dabdd195048c321a33d22e36980d5a'
            '988e368a90da009239afedf39f48da63b9ec498fa4e8f01818b01c23d6274fb9'
            'f0fa93d0398e9bdf54737d2088b2857e8dc210f1bda63d969c3e0b76b01f0885'
            '4594fe26e6f0f80526b0a76b9078402a284587d5fa1b815bddeb65616c37bfc4'
            '037b8268b5833e091fcb3e9b9c652d5563463de71707638f8204931d96663011'
            'e948200067548aaeb9b91c02b59d139276196698bd3e1a64e4deb2d81f78e047'
            '95ad5e832474434343d5851e7d78e44211ab4afee58cd22236978f39e5f3e361'
            '7ee788beb2d09a52ff5ae34872df15604b69fe82984f0363edbad34d05861266'
            '6ad1ca877195ae3f9a2341791d1c63d658a2c7cdecc21d2bc9626f62d8ababa2'
            'ba68a60e45d7f2976b97a3ec3da620d837f2de87b51173129cd826d79b1c214d'
            'e73f838719742263d4d56f491e43d94e828408d60333c944b1dcbd85165e002c'
            'd560de7be6dd228f77bb8a5653f90406deecbf94d7f9e637406997d2f11eab2c'
            '59999cc6d1173a70401fefcf9b6c6975429b5841a605183549b90d220ae6687a'
            'fe1422a2e9a9fdf49e14729c06b0f0765b0fc9be650cd583fae863b209dbdca6'
            '943eee64b6024cd5bc19b637fa092076ed5a9e6f78d3b8f6af22d3c2fcc0bf6c'
            '5b19fbd8140f5caae43b37e60549ca3342423a5c60bc2545fc5b920f2486850c'
            '0343b2d49eba23914c24e64941f47f031f207be4c5d84505c12954619980bd04'
            'f792dc3d1fb05365ce15bc94f9f704d1af3ce2ca3859828a747d2b5568e4cae7'
            '3eb6732ddbea1e26385e92a40b75f20d5872850bf29673e75d526b4aca1af1bb'
            'bf828bcbd50dd8da64c47b7101b1c7d794aba4cd44e6c34ed25c55d227cf1fba'
            '30b49f516771b4217b97fbe66c39bf4ebe1c01dae239873efae09b2a14f4a948'
            'c8190b742be50e54360044869120807fb90fb9da8d1319099cd1495fc1bd0903'
            'f6bac55c8f528d25da29a5901d8465e8622c30fb2bc6de70f028c9e781cf96c7'
            '1449747cf8c6746fb7ccd0be7a022ad63f51c16560e040f27e01550daa053618'
            '255fe140c41f2d743ddc448e7305081915bb06ab8eb2a61c243ca3fa440a57a4'
            '0a54d45eb953a35c218eed6d336df0acf0c6f771c4c83d598762b3132f07672c'
            '9dcf95d6ffeab1c254fd87d69e1f8b726fc54a9d35716466e22d525751ea27df'
            '758ab58e73803a193c34f9408c3e7114909e8619a286e2ead7a0f28919eb826d'
            'dc96cdc2f6776c1ff165498d2414881ae9ce909f2c2fe4fa6231ba946fabd68d')
