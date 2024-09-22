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

pkgver=132.0a1.20240922.091556

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

sha256sums=('1d2154baf543f33892055414f05957a52f29bc0cc985ead82ce51cb41ed78d0a'
            'e8903e40e401e90cc6ec8751b5ed13a65a38468515cf8f623e80a773fac728d6'
            '68d2e699c6cb6cc18d8acd73f497f4919cfe70174bfbf62a9411bb5c5a9fd938'
            'a2ca862e69e55508fb0acdd18929ee08f9cabd18029b6d16c7e39d2217b9b426'
            'b38f92d4f7a30d1a8b5f7892957e4b09035a294b970d4b0f0c711fc2ed900b9f'
            'a76ba6c5af44ded0f94ecabd3b26216651a23cbdfe1456bab4ebde538754adac'
            '87cca1ebf7ff5f0a8f96efe91210f563ec16f749564734d12bef6bcad4b63fef'
            '8fcb25c93955032c62fac9754b5f2774275ea4eef52f015c7eb35d3fc373a413'
            '1ddf7b750da63e3a48b60af8403ecc92bdc618da9dea3f2a8233b79b3ea126c0'
            'a1a250e597e17a7b15639dc3c537812162dbf44eab32f439df88597b31bfc44a'
            '20bba1475392a32f811c7a4fa52a1a22d7e7a0f0c48fba195ff74ebe20c76980'
            '8683ae00996cc177eabb141a927ce325f4b47df5318f9da11ecd99c5f0840608'
            '6658e066708a793e83de893abfa014f82d5269b87c9ba74e8acb4f64f1ea4926'
            '99b1ee9d5773d01a2d792e754952e634ddbf08b102e965e14f99a8598320859d'
            '5a2be37fcd7fc75089e437b4ab71d48babc95f082cf0da91f08abbf828189971'
            '701db6d42308ebd0f29ca54db51c2a6bdaffbdd5cceaa1d01c139d819e34fc66'
            'b83558bfb931e41dab98fa56fb837edbfea87b5c47b9ecaa929ce56c6dd98cd4'
            'b92b2516e4e6f85127dafefc11f1cbfd17b5e04b08af9db4588ea8e7d55fe4f2'
            'a0230186db96fe14082f5841a89e4ec3535bc2b6a0592e00ebdae4ead1b717f3'
            '5407e997bfc3f5b7577cf6a5f9729eb1a9cb47dbd5e79fbf304cbeb771e1dcfb'
            '22209d91c37883940319fbb810282bda56d0f7aa6f9deec23df05f77a56c022f'
            'ba9d472c1ee71540c89b0d6ad5f5f4b71cd40692aab82851170facf25032c47d'
            '28ef2088462d33f49b0d2fb5dafe4317a701b949ce8db816578abe9b717b9f17'
            '748d9dd570c87fd4c1c7b69d179a18a78b8460505d58d9f2a1e8df4832af8121'
            'a2176ca1ff47a73974ec359d88f4135dd82f9c1c60f4a7a6e154f13208f1bd54'
            'a3462f9c27e001ed69103cec31b5d31d6b47632d3d0dd153c5f315ab3f2a9542'
            '768a10e0648f62be1d80c64e08aa6f627334402813f339c39539eae891f1746c'
            '8b662e94dded21da4988f398ee307bcc2206b765840e0ef8c9f9fd2dcb6d28f7'
            '31b1f8c8938eb79a8a24e68354711a6b52f85f4bcac83d90730de170d82d4cff'
            'd44982ab95a4c040ecf17fd3017387338336c96a689e426352c1476d8ea16d48'
            '225f62fcb1ec9bd614fd2c408e87627ce7a001ccb227221da0b0fbd2a9a3db78'
            '37540f5066a31d5b204304b9c4ac7443b8a8918101556c76413a7b3bde130732'
            '2c9fdb3961d9db0d99fa4d755a2bbdf336845f1c1b55b2143fb9ca91ed5ba377'
            '643290bd86822bf4fe335e4c6291ebb63d50a63d2c17e9795d367d20d7dea774'
            '6774b17fffe7a4024facc9920a7be3cdc5cbc459de823b5d4f6f393bca20cd9b'
            '302175638475a72017fd840fbbb33ec629818d9e7f39940571bdf42f7b4faa3c'
            '2b60f4f65807190ab873d304aa8a75cefbad431e13746f2793e37986382b6843'
            'fc698c3d809912d4a4b80a9dc0e29be782faf576d738931968e4ce6847582275'
            'f526a1019c0126be5dda9afa00fdc60b31c558010320e467ff853c2a1a97b70e'
            '3ea9610820dbeb34a8855bdf3100cd2374fca85281b48d84819d94b1f47b1388'
            '53811dd4f376e7db9725b85196a657840d2af81b6d0dcfc1c238286ea3dd92f1'
            'ba113b5f29e75c5daf9244557dfd9f1ed090427eecf7cf042fa96ebc0cbca9a4'
            'f2a8965d876fc43abc682539721b82942dcd987c32b391ffd897e36f137b57b1'
            '378f69bad876904694607acf8e28ea4423fa48981ef071e8693c54c138bdf158'
            '2dfa06697aeb5128e21d6621bf0049eb4635d1d01f232d0fa47b800168479571'
            '009d06f5eaf91917c4f9608131df1370b2b0520d2a505f7736325ff9b9f2e413'
            '4f7fb8ce03455d130bff123b520a5f11ee5d77d3021000bbfacc06021527fb61'
            'ab80a128d4d30eb65e8cec7c269676e649c98b0b4b2e3573848679f6af9eed5e'
            '7bc0cef398e4a1ee0f23ea8c579e8cf9473543b0c70f256f87d42162f6c501f5'
            'a1d91de405205b2f582ab4e6947b20ece12a09024ea0f79585458da48a1b046f'
            '25444883a98f6980d04d992aa20130f13060f25ad61014855fa184b5b3e2f983'
            '73314cfdbd291fc1f601ade2cdb90be76f028253aa11fe0d6df900b957a80867'
            '7dced8c72846c68f3695924b50e6d47e805218e29a7c675015f606770d8fd703'
            'c94b76950232fabfe67bbbd34d6fab7a6e5d37141014840ffea2db5178b78ab9'
            '380fe6ef959efbfdaa8e35b111031b1e5720ee72ebd54b32d4a506c63246333b'
            '81f0814a5658c7cca3ee22bd7c614347969a928c2f561995c1435a32e7f0435e'
            '56b0d8d497e9afd81f4ffb0bf1cbcef11fb8987c005a9d849bb77610fc97290e'
            '94e24d90717c973605ac53855bbb02de43bf2ce76db8e1d1f6077c286527ac83'
            'd6b9ddb8d7e84588ad0f1fa1e4876fb79c637ba7776926ff669b2042aa4b9968'
            'f8da88e30fc512f1f7f96fc6d370b3b58c16be688399002ef1305c6a4b5c04da'
            '1e37ba91fcf986438717664ab478dfa244fc2c5111a25bfb5e3c67b273521bf7'
            'f5a9d46c0d7bf3d815b12861eef88033fbdde235bc99080866c3b9cac9e9cc52'
            'cb5435cd77c96420b44bfbbf1929498c7715d672bed6201db08a04b2beb00a39'
            'df06252ff7d2fa6114a5d626a99bae322c868a3a4e89f893fac8fd9abc4817d7'
            'd80ef70c02eb6457c8fdc0d976fc6fd7362efd6dc631c70c6115686620318aa4'
            'd38861e2ec0ae3141f41db16e7d9db3fe10ca422bf70f12eff0d349e80a601c0'
            'ca538293fe8a18f68be09c87caa3615d6389b1f7543f35c2ecbcd33803418719'
            '656c8c97a6fc1e9490eb69415b287dd84cb7c0a27e688bb07ae56bac5ea1e411'
            '741d5bcc284ace7701d9424507a05f5e2a57ebc28053463d4a45e65f833335dc'
            'cff92b53390031353c49b40a54a379ddb7b7aa316992c7a68d9b6aa5f41c0473'
            '37380878bce9dc6e72e54916ed8f6db300560aee45ec7ceb6e11165d98ed023a'
            '002c06b59b4346c4dae9bed7c10d49e273495d656486dd96b78a80d1552b1766'
            '60be9c5d4dd077526a5d1d16696ea4c39e94319d5fc0441a975fd49e63a41c41'
            '1d7fcece067ea2f2efb93d27f04f6042c37e56c5d087994dd0106b5e1cc07041'
            '14617a2eaa9675ac2478c75fe9aa14e9527277e3c3058333bb3008d648782e69'
            '5458702b314e0b9b3dcb41b1b364ae982f61e43092be5d618a5e28719cce724a'
            '31d409ac6e36dda2c5e6c43cbd5fd5445c701854fb5cb688133496698c75628d'
            '0e2d3dd262f06f4ecea6459b1bb3b5b8ea3484bc6f835d188411366f9af69490'
            '6191584f25cd1080fd06d297a7ce7fa058924af0780d324e205e9481e6e55798'
            '93bad2b668bb1ac178c5ee0dfe28ccdcfd3569cb8ed4e03ec0f366935476a41d'
            '445096db507b16f313d89549d26410fdee67a649f90d5770aab90219f5b1ca6b'
            'da42db1ef2cc21d9a2f0c3f37d3d939ffa2cf5d3f158f41daaada2d025fd4708'
            'af695ea631339446766f8a0d9ee7cf2540b560462306a0730d5aca706b0beffe'
            '8e09b4f82efc68613f1164117773d773436aed668d7febe5f9762ca7f0befb47'
            '8f1261d66b300918e971717b08d01e1d93b632d4887895485b7fc9ba5e3feba6'
            'bf6a38426ca2d3f0ab2edd70b59add3c4d679e52b3328665bdba3ec5035e69d7'
            '36885b527cf04cee2b432e4a246a2b4e8aa2b65538c76e7fae7262ea0bb073d8'
            '2fa6bed823760c233697b07de445d7250918a7c1bcc7e43bde863dd28fc6f3da'
            '52710cd629a3f55a00be7db229c3e99e863cd8deb87f7d167f37bc5c325abee8'
            'c7b7e19f01cb2028450796d12bc1b0530d6925be5d5ed883ac94e368726198f4'
            '72e7e615f613b81a3345891d69476faf8f667b2ebaf54a2e32ac8b2fbe94380c'
            '952073c2211f4d1413bc50db419e9ab3a26f4ff9f9487adcbd89d305ebceefc0'
            'aca04a8bdce4baf36ed6b1160ea7afcc3cb24f2d20a60aafa39e367754a8b483'
            '3a7462b3faaefbd1f7ad0a2d5cd7e8de48309ea0d994ffc24d65202542d4b451'
            '6eb86da62ac056473b96496a05bb0a38d0d309dadf98d20a54d8bff3cf36f07d')
