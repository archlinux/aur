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

pkgver=132.0a1.20240916.215224

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

sha256sums=('fc581fe4380614500e7de6fb477aeae5a3d42924d3572e2978455b4fa04986b0'
            '8b85560398c1d5d4a10afeb955afd8670cabe925d29a7aa3f5e46a3a6681a923'
            'ca87c63c7923014817fd9d82864eb8e2a0750ef118a84e259f4c70493b8b3552'
            '5b0cadfe2b8bbd070dc6c0820e801a9c98913997e306f59d44629758508947a6'
            '2172bdfff02f0d53306334bea52b01b8f9cb0c254a0456e8c8a47ce560b250cb'
            '68786b2332ab47b7170336a9ffe02337c5cb767f78b0b6c7aed6ff68fa099cad'
            'd1a77351859949545b55dd6100a701e0fac9aabdab21fcd1ddf5d094ab9b5f5e'
            'f832a76aeb24604d36eabbd747d9e0e6bd74071a8aa63d688c0ed1427eba1519'
            '653c7bdaf8fff53b758f9441c592ee9a365c9ec062df70ca97d85191627451d3'
            '87357c6fe4a483434919273765a3ad0b8eae77b27696b25741604fa935cf6d69'
            'c7db525792376fecd113d8929da20d57ae9466ff47810b988a330f34debf8ceb'
            '536184e5a5a37adef5df28240bb1b666092934941d5336923cc4e4fc1420d948'
            'a299941c622efc3cea814b9ca20c13324ece8025cf557de07867743c42336d67'
            '89742a5a171885f3069d26e6c38e8d5020a4002bf618f54a873a6be65b23eee3'
            '7708be4f50be45e515482e14c0cf7d720efe0950263548ea84f59d39938408da'
            '3883ff760df21e95128396d73ed0f1221903faf472291509fa62257d221c72ca'
            '88e6c559dfe4e0c0e4a2432a274d2fffb60d325f400adad9731c242ec2a856c7'
            '02eaec3dffc941a787ba9345de9238379da6f1682a9289b7f5666815bdb471f7'
            '08f3b146c971ef500f928a1b37030d6a08d53d3afb6a142d9cef221457c10088'
            '15d1e6286b406f0d7297b4f139b3b89bbcdad0cd37e2ed8b88d3163175c29ad6'
            '714dea0e9e7d310715db63d84a2c34229923c9846f65895eb5f609fd478eebf4'
            'c5e3dd1ad6f93ec667c934378675c40ad4509e68d4a4ba6a1ca720f33e440596'
            'e04764b23e5bf8e49bc316a1d4d1a277bde7c207e3c4014e65b0f213d4d0988a'
            '02532dc1c6beafeed7d7ab57d43061e5e2a4f8c6ca87af4fb03037bb79707986'
            'f5421b460124f2775a8f4706000a0280997319aebfa26ed5859c55c2d82d095f'
            'f18db6d1d01b16335793771acd9e26dad9eb621dca46ced467d4583300dc0429'
            '5e725d6ead6d6fa6510e79a3b2f074ddb98975ac30298e350c381478901dd2f2'
            '54200def076cdfa9e9d107be2e05494e8399495161501ab8d502cd511fefc0f7'
            '5801f340cf3daa79483e7f6ebc050613c028fd10720487f9d10fc78eac82b939'
            'a1c783eba466e7b2e645b97df1d7644b0fbb59ca572601d01e0c6e6d3ae01847'
            'b66a97ff5e419b65a829137bc3ec806c3b47e6f6778586043453e678f4a07d34'
            '939cf8941ed29f1c34aecfeb968cb0b7774e42d09b9477ef9a599157c2269186'
            '58c508a34cb8140607586d1705baae3d598bc897f9f258cc0d6ea05fa7f0c19e'
            '5fe05b6bf5064e46c60a5bf1343736b3911f065bb378cde1381237c31d235642'
            '818fbf51f794b2c72c1da8a303d2804b2506bb17e107fbfdd0134242e069dccd'
            'afb95218270e3d637bd45bb712397a844492dc22a4220e225575183168dcefae'
            '4b7d1f29cdd7f12a8376c4ed1977cfa24a9f3e7b5233a828937703b62aae5d92'
            'a5babcfd33aa7f7f426c3b756b4afdf6b20124ea3a726ef6e7507e7ff647acd7'
            'e702b5c4c0bdce7f7527e8de98554d031faa8cd54af187a2071771e70873ea8d'
            'f1ee39e2509ac041fab9d4c766b8bf762f25c56096b8424ca446c2c5e532354a'
            '0c79198ea5978c8c4cc86b5ffacdf0631fae04067d5ad37083c89a318ba19676'
            '4ba8970ebcb9dca4886db781097de02604a67a2a385c26f1c1c10666d70199bc'
            '70ad155555f6124fb1acf96060e3d079778dea0e7f43778c079925af3be3f4ae'
            '09a58c7403231dbb3887222cfd83d66768933db739098a671a2f4b629ca3d586'
            '5ce2481a4c8dfca063cfd9ebc903f90b1f4011e7f209f41f81bdfe728d3a4b3a'
            '4d55de513bf324a74108f123e4b4773ae50dda189349b078a283bfdb1bf0dd0c'
            'e1ab4ec963efc573d31fead1937073b667e4df380651bcd50f94dcc3739f8412'
            'fdc47d2d5b9557e7535deea356b552f878d4a503a2b94d3a69214198ee26394f'
            '01fc87dbb7da36225290e17ce732b66bcf484c53d673335a8940008a680bde43'
            'b6314c954f6b1fb8f3dcf7248b65b0757b36407b81f2e18c46dfd8c03d01abf5'
            'ecad23ca3b93315359298217a460a598a3b820c1871a6385dced3214a04f510c'
            'c34ae76b6985d184d7a03dd1de20878897c107686dd9fd747b62585fcc17a375'
            'b9cf166960acd2dc2d44351902319c9e5410368a70564cc6676341ec4314518c'
            'c84af000c42ebaa3dd7131a3bb6a0dced994f4290b1f596244a22dcc6a93367d'
            'aa25fd72fec8cc037c0926af5cc6a77d937798b96f72113776b9a8e660f3bee1'
            '0e1ded1f13309fe9b999b2b0a14c488f2ebea92ee28fb6c39a21c3460e2f1e2b'
            'ec71841152a8ec2079ca9d6f28573986417e4822b7b1a2aa8025045cad5d0bd9'
            '6637d7681ce0d708d832866971e687c22ad7cbd2909ab46e6916234b9b2d0b6a'
            '2f78dc9656c16a82bb7610ef9b706cbe5af9749c6a087834065d5cd72c639bee'
            'c0b2f6fabeab11deb6ee16d16c00dc0fdf3f5f324cc78f24a2788f9e0475a79c'
            '7526b1cec745c3929842b104cc4dde848e1d01b78842aabdaf284c4e7e62fb38'
            'eb5476aeee33e69123b62bd974a834ed9e8496d5b2dc12840c7b4a2ea6b82508'
            '196a21ba5c4875a3ad519e22fa1c7b5095f2b2080e2f585b20c99df77abdd56d'
            'bf38916a092b154dd3c24fe2924228566a2c13155b3e6cd707bfc2852aa6ac31'
            'b33aeee04fe017408239422a0b9ec29b96a0304359cc6da50581b752c8ed17ab'
            '0fa570c29284cfa58545b48ecbf4a720dc0f073faa6d878d9e09f5d2f17ce05f'
            'cf940f16afac3691e70fede45513a53b827472563973c49bf8cc6f5f2c30ba93'
            '3940c2b1e123ef8386ebf47d47fc587736fed17dd4cdc422a8a631d7c39301a4'
            'd93e1afcad10d34593d2ef2530076ad4f3f3aeb6b8c94014f6e62e4d332811bd'
            '9224d9c11335f2af58e2d6e06d1b811f7f206b6628bb3b93cb18b9c052d273a9'
            '281964c7e290b87659b0e836b070b51908262c393b558712e37558977e63200c'
            '78b37defa36f3adabc64f9894716cef449f29a23352bc288a49ae1adc2e3960c'
            '6234cff14eea7f801d0d052072f0f581599f5c77a9cacdbf2e5c8d823fc25a43'
            'f111ebfffc66f696aa578569feb1605688d7715dd745e6d506fd1bea02e84093'
            'fb087bc65970e447de5cdd1ca31ebfa006b16dfd256425c74c6c991f01d4a294'
            '25838d51f93732830612c56730279f8ab86e73521c767d9a4481b15a0a2b7118'
            'ccfc3536069eb367cccdd88883d20712903baab94b22cf7e58a5a476589f1bfe'
            'e82d0a5e7a95d4407ab72c946fdd4ff21d77ef2443346ec91f5db21c2e1a37bf'
            'ca5af6d4314e55a64d7418223f88f96a1c8a438c704a0d4c1a2459237e8a5623'
            '9d439397dcaa70d9a36bd5ad2fc87d4c52a03edba171a3e886f846a621579a21'
            '3b26811223081017f995ac5bd95d9e4ba759a3d931c7d093cbe8decba442a6ff'
            'f53aab1c1f152f6738647e314e8e2844cbc4d828640f1c16e016e9390e1691fc'
            '4feab333662dbe114f10df7bb15187bbd5236aa42adb03e8dfccbdc345967cdc'
            '1221670d796217539558ce43b493f6c71a5bfd0f1f97e82f703b06c700aeb3ca'
            '40c648767019db2b1561fe86dbba08d960807908d6ac74989b2195390f766725'
            'a4b544fcaf77b67c7e1bbe72e5671f2584603a6456711fc08ab745779aa88096'
            'c5b4aaf9d64dc8a2f5e30f5485de5ef0fee47a785528cfe0455e2d35f2c7d40d'
            '92252e66eb1ffcc475ef08ae503d0c618e416b3a67bc46e6b1666bfb3ed60371'
            '26e40d53cc41e0db89fc52a5a2b19d23849fe45f3fbfead040ee8251ff27314f'
            '9165de2fe731ec867e6b84b1460b8cc1561f27b06e73e1a3ebb7dc2284334022'
            'bbfb20207fd9244478ab0ab4c6c16d8d3a56a270db060efc2b69cc7e1ae5c546'
            'b765c494d52270d2f8eebd8920d26004826ed023280bc817eea9af3b435d7688'
            'fcb6e6391b75d847df3f43c362de532c928074a00cf5696276341b553aaf4991'
            'd1c10b951f425a07b3155699f75ce873824e3b616393bd931604370cf9de36e4'
            'e00a6f00bb4fe31320feb54e9281212d0a53946fea99435d87f40a14fdefa597')
