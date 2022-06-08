# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=103.0a1
pkgver=103.0a1.20220604213903+h490469b53dbe
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

sha256sums=('92b1cb549d462882ce6c83e676dfd37d21b071bcf32ee3337d451e0c69859201'
            'b76792fb5942f4cf3d397ad7d605f1c58db534a3c1b884d70954285cd28069fb'
            '6f45125bca86880c53ed09468c64682f72bac4c04e2121525018379483d0a2e3'
            'de3a9170a092ce42f280aa6d96d4438dace666162516cc5a356115e3b9899932'
            '99d0a4b1320a976d8f0695fcb79bda8e8d58de68aae777db63d9782237181f2d'
            'aa6e1b2ea5e5c4dfadb184d76d4d2a637ea90f3cbfb67632792be70d725c2c7d'
            'fc2dd0e7222825a36c87957275c416e4002cfba8d32d25518df4b9173885ef8f'
            '67d1a1b5cfc44025bafbdd4096ac7fb6e948bf832c6aeaf143ce7bccf73d2c42'
            '7986a12c97880cf9aff456cdaa4d496d0fd223efd8bd765149b12866f88314d5'
            '1b7504e323c7b5b7436e8f4b6d4a1dd2d6669192046834e4da8a7f41ff5ab724'
            '8a9ffd1dabd065f9073ed5fb1e6e1e5910c7a043c11230467b085f88e03be246'
            '0cabfaa01b457711c58cb1e7c3ad2fd07c931d81c57480606ae37cc55a7f79c0'
            '8ac3249f1387efc37b23ca5e9c6ef86932db571bd8eea6d3993e38c126ee47da'
            '21b436555bfdf24a0e90fe367dcf4e7440d5cae97fce85701bc00947eb27d4cf'
            'eae123e11803e86bb309ebd16ebbb7706297001770bbe2c04b1b7d98f468ce24'
            'e81b9318911217563a157760e6157daa75c52585560388248972da00f8998532'
            'a9d99ef76326eade28a29412cdc5d8c7aca65f3cd18303909f4ac7725873fbc0'
            '2eef0d74cb117db95f8060b95b48d95dfbe5948833f666d8627f01ef412c9429'
            '3ae1c166eb45734c096f4489797b25f286383329870cff895cfaadb03d431f87'
            '48a9bbb272383e5cc53f2d3a7d3706f63a6ba2a8f50438f27e815cfe6af5635c'
            'da05f207935312136b6e1e619626a922de283b0618ecb5c2c1ce32a60f04802c'
            '24bc79a6bbfffbbb39ec717351dd3f13a5264ad6fcaf7ea234805c7cd9f8bab2'
            '2d457499fc40aaa06cb83211c28f5356a18323ddd84bb96584644e0c1e1ab4eb'
            'e0ab34761f853fa8b626b4377fdca78d2ecfc6c94e664ec4f9afa153c59e7f52'
            'fd77a0a3d93d7533ae8b3909af64c763c7910efe9a65a8af215d814020d7b9d0'
            '7f3c6aff6232b61510ec78d04a86186c21f7d2e2d81876f550f0575326f9e6ff'
            '6a28aa67d31b0cab6d5df0ebf5ebd4eaaa6a64af03eeb1b84d39befc4efbb20f'
            'c9a1b4b911b7a683a0a2ef54bf07df2bd8a94da17526866f0cef741f22244d5f'
            'ab398a938c88a84c77737ba3ca70cd23bf54331a8a7520a5ccd46fc4131e50f1'
            'e6c2044de9d55d8d92131ea0342e0a820fcf9a8bfd625ae2b7560ced042cf9ca'
            'b8a2ae8a74a106a5f092a9361d519532cce8ee8cf2124e72a577c9d4551bd81c'
            '12d9cbb0818fb3d386dff600a9fe1625a42ad406da528ed658a1e756a05afec0'
            'efc3997ef119016eb4b8564fa7e66b62bf14d9ace231982d1179c43a9f420d3e'
            'c2c2ca544b22b7d5c1b240192ae6d09b283adae9cadaaa650455af1e944296a1'
            '9e5d8f4c0b519f70ca6105fe7d8b43307166b60dc3a91b12577886b7ec7a3da6'
            '6f77230bd72b7cba20c0db7ff1e04d8bda0ada39e0252c12a3c7c1daab6bffd1'
            'dc69ca6c35fbcd7d01d5c26ec4a6aec484442537849e4a605266fd2528302321'
            '961802bfb4875a8c2af8d9bd9b3dd9b89f473769ccbd436a30a872fa71871d62'
            'e52ea231e3f0190fd5c8355ce72b920d59a16453736916ae407ad2873b052679'
            'e4e52ea321c2eface2b0cded25ba96bf31a4836c45347f4de544a0d7b5f25f65'
            'e8e964ab602c06da7e8b6f526f3255f7b7d07fc15027d56e7fc9c53efd2165a9'
            '1fcfea31d728720b6bcf7ce0dbc7e24c6b53336e289c32d4f0ea8a6da27f62bc'
            '97dbba385bdf411b06a68da711b68dd8eeb8404a200e5c80ffcb9586bd61d94d'
            'fbeb9cad9590471212a2d2bfa470857060aec0e8cae209378086a46983c5144c'
            'ddef7f5bd73bcd42f730334456939a1733a5bf5622e5d28c8187d9992cc3e1e8'
            'a7fa88addd10876ee40390b9d0d7de562ff3cce72067f7e656b196f2116acd10'
            'b8e2ee10c5c7b8674f2064c7179a3664032276c531c2ee3164e98f6959845b43'
            '7ada9eb35a4bf32ab826fe864cee97672d2745e8e1e6eb26dd0754fbd0788d0d'
            '8e15d788e43ed6384c8a8f67949fbea21a9defaf7e195bc03d7ac79bc5c5fb1a'
            'd106b77dd62afd571a5a782af7c7f8645aa17ab3c4614872e4d7819df6ae7434'
            'c1b8929c01ea4b922c185f0eaff4f08e3f11fa25569ba0132d977ff39a7d2f77'
            'f8d8b332e1b8763c7a67462015d56eeba367982922676018e256372ee5df238f'
            'c5c261792921620b7946b6f7e5b2447e91fb3a2a862b2b501221b202ae23e080'
            '243f53f5077c50c7b4acb5a712af7f7720c6f09275de4c366b352d8b909eb9dc'
            '03d36ee31b1c263a5adcf3a10ea4eb4937bb5860d998cefda4d4f4026afbd614'
            '7ceb844ad58b2a081147d64dba8b2a50f59430ec5357a0878ff2015476d2d272'
            '0291b89864e22fec536e229c60086fb57de04a1e961860b2303f7ce40614f26b'
            '2038cada3719e919e7bf7b0ed67242a1f984ffeb70799f5e79851af3174c2dd1'
            'e8d87c83899a7ddc02e248387e55bdcd1a144fd0e5fc755ea4a36bc16c7b0ec3'
            '9b7495aa77c58ca3b3c76b23b6b66282d02dc129611f28b606078f81bb46ea86'
            'd7e8f893622c2c43a51e13fdb653217de987399edb2445983a1f180399042910'
            'b4475130ff4beeae940376c9ec282b655f950539e9cb2e727e0e36c30bc9a8c1'
            '2ee9068f436152bea9704208ab8e05b1aab7051c3af7fd8024ab26cf2b6ce6ff'
            'b3b7c408b432519a24d9a9e8a4604f7fc24cf9fc6951ace66d9528a1b001ffcf'
            '3a728321ad6b41c930fb800701e8dba0d93817ba4fbef7c24d200da235380232'
            '40c39f58baf51a2861793247e17254751f0d31bb2fe975277fe4525e9e02b01c'
            'cb91f56cd838e8a6812b130fdbd302eaad989cf699808463e4768252279cbf78'
            '635d860b6c8777d79bd9f7b1c39164c498b71e49e30959aaa0c4dfb6ad5285a6'
            'b6fc5e6272954e63145c614fefd2b04fb9da3fa910f055ea004ebb8088558bde'
            'e19a3183be64c3217d2a5b048cf14aa73e49811deed2425ac5603fb8864d4ea3'
            '199beb4ecd6488753ae14ba32c42b43601cdaade558285017466fd8e45140c1a'
            'f1ca04009fc41584b0796ffb0042d48501a2431456e8e52455aca339b278a61a'
            '17f40b37ed16b3589f8cd9bd60361684697d089f589cba786f486e5d59c92f45'
            '864f49db080de13fcce21d2850d6e37c670e53cf4682d827096863c1c3c8f9a6'
            'd7aa8740ed2dd83b6a38671b56351f84d01b3c031a93aea110f7eb31ba5f9132'
            'b124d6f883b29b07d00f080c17ac78c4df04a0434e6c3eac3f4f42202fd48a14'
            'afb4857be61088f87405d5bf339958440c027e611a49fcfb072c369ed471a380'
            '83a9b03d13f6aad0784b6a414c20cd648e996519efeff7602e439e210cc1479d'
            '1ecf68294666a5744793d39bb9904209bb956ee77ccfd92f72211518d8b67fbe'
            '87fb984748fc82a60e1b5f5fcfc319bdc46dacbf99d44e3343490ca7e797a549'
            '643258048cb657ba6b40d92ee6b5857700d9e2312569fe432212f7cee4e556d9'
            '0e052248c6f20e31ea1081d13324e28f2d2fb0e1d8ccbf1d527c6a9a0532f335'
            '529f5349ce784294d944a56ce6abd03730c688160e2fe5f5749e0fd19228eb8b'
            '0ae61ef01f022185053ed849652ebf89c9b1c6c85800ab72e5cb34c4d8b8e782'
            '5febdb8944cd50e775dadba78c02ca2b2adfd81340a08f1c73f78b686652a56a'
            '2e10ccd5cee4e6aab448a2bfa092786c30f572ca609ddf78e90a36105221362c'
            '2f51b9d99cc6967b55ea30d77c32d5da4525ea6a074d7d755589889889689985'
            '0a61f4dd80aa1e388b835b6814261102b767e1a5665bb033a42626783483cfe4'
            'b445ddf1c1049cbddd6423a128e336c3741bc8d693517e1a83262c176124d1b1'
            '16cfd9390e020020437e49d2d0b5a967dc03da962fe2dd882d513fefc39f2476'
            '168c190e4ed21cfd3c423fa3542927c2ad9d85bcd23004abc8fd7e2e5db2d5fa'
            '6cdada15a0140585a74cfd8fc846610650ce8a1bd854030017f7d387aa864ebd'
            'a502f60f0524da4a176a0dcd7a6baddf6173eac8727ebb4c7cb2379668a07642'
            'eaed098511919f8a137bf28efe97c987f018bbc983b9e5cf74be739907b561cf'
            'b381c8c4a941c124b422353c9afe62fcb44eccebaa726761315039151d94ce50')
