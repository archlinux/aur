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

pkgver=132.0a1.20240923.214412

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

sha256sums=('34ab748fb6ea2a2b4864343ed6341431117ecd42d640802db6bcd25d74d82a07'
            '93147bce80a0954866dd099d5fac6d9e3be1caf23cbbf67bfa8cc70273eec4f2'
            '936ebb9ae2d7dfd8bae8d3cf1fb744dbab93ac4f7263d2872a5d4fcdd2bedabf'
            'b5e077648a3a4ec4ea58889d2602f0375b22aadcee9e86f23d7709c050f0f910'
            '3c3c596bc82f79edd693c46ee233914a4c3d1df1f6528b501d7f333b03333eb7'
            '8e34e14ce9166c229841a5a54132b409b2a331743f865bbc38d924d7f1cb666f'
            '0c92b6205b17657f3329155ca4b78863e4335cd401ff3d43f106f9ac84f5de96'
            'f4d631f6ef381e39e5938dc58ba0e990b46445dc3979351bd0be4700b0869a84'
            'ce1b556bc2590a91695af1b1baef580756a6dc6031b3918e6b87d6496b05b7bc'
            'c935949b7528fee2ed5ce3079943c9976f1419060f7145d9e0b5d0ba8c6d107e'
            '2b807a3e35f89dfe16321824936e7cedeede79424f560124c6e918ec784e98de'
            '7ddd23037bf5e3b1d9b66942ec78518ae35a8e2c785c04f92978a75c1e71e485'
            'a14920555df0fe637967c3e986c28a19137367b3f4eabf714627de2d09a01065'
            'bc244c0be3cff2c264ca161dc573ca1fb7dde5450753f6f198737ab706c5401b'
            '90e5b052cb122e5314eb72320729ed4075e4a1ea7e528d5d38581877495c8d99'
            '58d5733dee09461daf540f6c562d800bf7ccd493a4124281f6c430a021c6ba6f'
            '8ef82ed0cf34b153850620cf602cba638f9054cd2b7e9914307f9e7917e07b0d'
            '6b5b3da87db583f240e4369ae4f94c679097f6dbc5ca44cd54e04c7783cce46d'
            '3c1bda509a51f69a2328b5af79b81de9483b4b8e66a2df419d85b7920291ea85'
            'fc7630712053a226b3411daf4879bd0a6708d390c77cd2d5bb5e54401ec46bef'
            'b04bfac2c3303d00a8d38738e161fa8fe3f112fe2809efe2a652b5d1bebe2ddc'
            '85f91dd242ce6a5d3e0e21ea96801ef85051f74f7ba2054a088e1324b6739e7b'
            '2520cf14876eb25044c9259429d294ef17b7be6c647f2f176a9edd998b32f085'
            'c5f1599cbbf8061fcb406f07f5112a4f4d9dc4f22eabe434db77a15cd31970c8'
            'e42141fc522ff53391c1bbd9b2814669593b164b3364f8b5ead44ab395a549d5'
            '19cc7b71dc07c04525a616b1ed220e3669336ecfc3b9299a76b71f6a5a5770b3'
            '94f5b08b665775bbfe4f9946482ffd36e68535c1e749887ddc4ba951d464a1c9'
            '8a7f1ad3aec450f4ed19920f79e0f0e586e3a03816ce865f9107ddcf6ae8ec85'
            '544c483cfa916a7a3adc5f265bc867c1ebf7edc1930e7f2baa15f96def69be22'
            '37f412562304a2e0bcc891febedb74504a42a815a4e28a3879588a26a7fc3528'
            '5769d5fcec4e556d5ce25876c3fafb68bad40e31b4e9b5aa2fd53266da17a662'
            '53ea52c4603786eb5757605b0a83f8a3186e8572517b14a24af6babc035872ab'
            'd29cd37386a126ecf7781de29ef731e38ed436d31ed3a0a9ab601fa9cd76a74c'
            '6cd89b96183580875b1a2926e37cf9feccf03a17dc64e34e62f691507ab39e5c'
            'e184c027f4f95cc36707f566a9648932479166c6d4e5eb2dfdfe8c50b88ec665'
            'd73c5f796014a22c2f07f994403f4b2d18e7c5804c6a2e7c8412eb1496be5e2d'
            '268e535f11598730620b2b934b57c3bdfd1040732efd82b10939d461fa469637'
            '0cdfde41d8c52df656cae1b804c515df4135c60e17f296efd0209ef58d19ce21'
            '5e1f0775f5c9984c4b0b04772bd3e18072e8330e4cb5c7b3070425ee176b2ab8'
            'c8ebadf982515a9aff378772c4e645c5562ecd8ea7224c08862cd291bb179442'
            'd974d84510541fabb6ff7f80b51095d78b8673a70bebd7abee2626617909a751'
            '604c2bf190024291feb821aa63a201296b815c75fd07b96542bd65296ca6210d'
            '7ea8e2d0427808e10adb435e15e91fa7ed9051d56b5cd5c84297ed3fd71098c3'
            '83ba6253f4c9aff0d72d5d9dc9a8cd8c92ebdf0e0122be26967bfe50b1fa9fec'
            '168c547b7a7e5e2cf055dc0b5b0ddaca657be042394404da255ae189b07b0356'
            '254a61b5f917c037ed89c361b3ae8a5de57f091be275ecd6a9d1162c5cf33753'
            'c47455f0a3481f2d2c5187bd1681c75d003d3d6431b237f508f6e8a375c1b884'
            '32a27d5423f0fa93b5ac4c44d66909f833976b873ef4cfda3a6372f1a709b2ae'
            '4c62580d3558eab07ca1fce8e045301af18d76dc28cb8b46b88759001269bf50'
            'cb4055a25d274b798df281130bcaf20306da8c2059892e0607f07150671fd897'
            '66185077affc4c520bca0c9fb9c8c23e69b2bcad5bdc7dfd34334eba9a475378'
            '4d2a969323e4d1e434d4b57f8761029b20207ed1e080c9d0a075dd155de6ac5c'
            '12afbdd13e7b10b057335848ee9001609ade55dd4c24bf60470559f40321c1e7'
            '2632aa0739d6a47f528663ac7d6d29a3888b9aa33592a59e1d9c74db5aad7654'
            'cde0b443f4b446755e7357722741dc608513cf82493ed572415b86a38031ec88'
            'd63e3b420beef831a218e0e154011893e1519344167179ccee79b992fd0f680c'
            'da7895f704368e67c28be19f53a37d976cdfcead80cb1f97057c11e59f933129'
            'b73efe74f20f4cd9eb6a8ff40a6e5e21cd1156525778d1889fd4da0d88834315'
            '2c0b557637b70e7479ab6b3af905a00c0ff5ef42e00f262271857ccb20dac8b6'
            '35c6ca342255ce0111a44fafc90d43b7308d034a19308a32e9a4466067ff1fb1'
            'a93daf469655219079a955cade76e352d783342afe02b4ad9b41354591824382'
            'c0567f33ce333be950ea03f64d4993180587b54a0b10ce4330f054159d09494b'
            'e6c1a5a325a51fb12d35284deafaa994e3c37a22142885cf7c83975ce19957e4'
            '7449d4efa870bf547462154929e35f12dead992122fd92e09b2e7cbc40c9cf1e'
            '73ac47466ce380e500454468ad1f1287dc31a096174f803f2618dc7fec98444b'
            '324c757d2cd42f9063a060c8572482850c1ba55f4b0ec4a0acb1e12c3e65cb31'
            'be0e32f7b03ed4520cac7919df941da49b60c12cc0b829cac0ab33a952133cfe'
            'c0dcf7fa65651885973f2681084412aab60d181b2f4b1f40012eeed8aaadf429'
            '6674c4370366cdf1222788e258e224364a25cc19b87a447046e1eefbad834a1a'
            '56da01235301e0ce23e2ac3aa552f100c728521c7919e82c03567fd157d311a7'
            'c86c704e0e7173f50f629767741816f277528c8c30605545ad26e61460bfde51'
            'd3e09313419553e088e563f144b119aa162872cfea9bd8f38e0b2ea27ea1c848'
            '96caa75e55a1ddc28f867a5da248b529150838970a1e7c3d64433e11fa9374f4'
            '0af5635c73fa2e2b222b65ee10d3c78cec519e916f7f1c80b678153efa17dd05'
            '44b881dfb7dfbb99396377844056e693b214f3ff843fbcba03d34db46aefe9f8'
            '02d735aaa7b04605465a057e628e1abfd7f2fe97cba0b86331340e3b10ef583c'
            '3368c66eeffaeec0149528b9cd5fba7a2b8d6d5af9a7fea59c1699562e249186'
            '798d56ec8a6a544520189817ca273c26c9c95f25679e85882809aa9edc674358'
            'd806ea3b92e9c30abe2078c2c6acf24845bf958ae9723b8a50a17f9f04689508'
            '42a3e27cfda5bab187c9f66a5f670b93cbebc3f7eea985b842c0a9bd408ded3e'
            '547205e81ac4cee9ff685ee81fe10195131b43cc60b94479a64fa3983701a4f5'
            'd64cadfbe6290b45decb0af71a9e691d4a108c56c885f2b0450e0295c08c3e2b'
            'b88f83f5d25801da71419041589fa0cf064bc6d67ca9efde207cbc15bda2f3bc'
            'c79905c96529f781cea9c1c814b7d4759a61c4c76fb920b7e4e53eff13f71a64'
            '2d90395e29484d24ca0b902586de414400a2a7eb59191d05ebb7b7f60bf9f3a0'
            '56baec6aedef926144f0b65c8b390097616607be9245163ff269965f85ec59ef'
            '55018ecfbf3cb44dac3204c5fabe19afac55fd93370336c2376069df0f8f8d93'
            '6b9a156ae7c810c22bbbe1d2deb5623b0ce64b229884873cddbf6d133d7111c9'
            'df9837b94ac07b857f63df9c1b21a1700f6ca2b7353b406f63fa554cfd3f9219'
            '7dd1efac4cdd3f1ec7f806f5fabc5489b28d5a3879b22847b8ae674cf8c44114'
            '0fa3a8983485f6aa88c4fd30bd8dc99de7991a56b4d96fec17f1d4a3cc98f5d8'
            'a4ba122642ba1facf284a7918396645f6f700b441e0645b98802bc07e69cd86d'
            'dd48a9eccfed22910e1ad3e982c1ffd6f1356ec624cb3fd7a56a118f351c6cac'
            '115fe3b99dc95207dbf8a593a6ba560d664b6423e4af4e447d7742f6eaaba276'
            '87f413d99e372cb915b486e86dc466dece9253678b2cf3e6fce99ddce73ab5b0')
