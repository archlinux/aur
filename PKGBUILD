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

pkgver=132.0a1.20240928.085335

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

sha256sums=('f77863b39ddf2e36245c327c19d1f5b1843dd3bb0e78f123d541980ea704e4ac'
            'a52bfa899dfa4eb93b9867d3c30f08ea5dae01de75fb0529ea530341a669e7c4'
            'b142e7943344bb7e116d04a00d4b371a7d459b5405c6d52cb3f30a769248fee6'
            'f9741ccb29951bc8b8a7c4758efb64962f783b084ba4a97410b70a38e79de7d9'
            '3133dba0b88870ecd7bae35cd998e9113669ce3cfc44e8953ecba2a7302439fa'
            '95fc31aa1365a53ad2c7a2b407150f308a43d3d9a7473f4c1d502071124ba34a'
            '9d9c8ed2874a290169439b4629a2e0d506fb26c973ee9397d8133caf38a11b08'
            '5e8acf1214550b63aa32eca84854bb791d4a50492dde30a306ff038fea781f9e'
            '5511dc55c37e87d6f9de37153ac7b6dc708654195174b5b88dd777b0f3b7e2cc'
            'a75a54277244e14997be917a40fe546ebc9aa339a8c064770e92eb5000584324'
            'ff9385836a5c9c4c03d5874300c341266eaf24687ce905bb62f29f6961187bbd'
            '18d0e195692fe1ba2370dfc72a9a1fe2cddd295e9141c64086c832a3caa6a26c'
            'ec90692c46cb769687aec827057138db647c8e8e74c09c34e18aa57799355c0e'
            '0bb94c53994c896c1ccd5efa3127fe680b5336f0130bfc70a0941e05ec9dad51'
            'bd6ef0bc68dceb5cdc3fff55b738867286eb9c7079dff8da2e995f07042ea93a'
            'a8723b163a4a4494b0a475e6f8a0fa840e2a7ab81691a27489a881f20d7268c7'
            'eaa38a11ed42746d987fec56b9e245e3e01b8b7b1832a2838c7490d2425609b0'
            '44ddd3f8b9abd9bfb9adba5e295ea741367c959bc0cd555aa30db033c4544ae1'
            '82858db2a089fbc2c45aea75f9e85338598e592fdaae87eaa8bd631dea86f1b5'
            '9dc51a1571a08898e25a7cc15a96da91bcfab417b30546a4f9056c6abc94afcf'
            '08c6bd89b82c51e34a0d994a54a76acf19fec397f651e83931ee447623925caa'
            '7e773cecec08722976e5bb037405fccaa84c712bddb74b989bcc33e6e9a8193d'
            '35484ce325184b59a9f57ff42be6ae2b1c6bd42d67da64462907bbb43056e028'
            '58eee99d795a727ea050b1678cb847f0f5c6b0b41232961854f9b8a7e518d244'
            '9fc1e63b3cdb0ef092bbf6501e66c4d75e2c7ccf0496a1395be3fb4e447ec97d'
            'be609f18c7fffba019360f97a612a0bc06ee8647acc139cf166bb8c29907b8af'
            'e993d390ab8b76cccdc10e13ed477f449067aeca2f05a255ac5dfe33a28bd9d9'
            '2ba24acc153c6b898d719a323e8db6f7fe780fa5990a68626688a9e63287de42'
            'a176819268bf0352d48a2b3daee25c174d485f7b5bb07c555671c05734ca7c6a'
            'acd01b6a3ab743902ce51a29f9a33b2ab1784738253911af500d01efcefa5a30'
            'b3c117be54988bfed06058d7db2f933c8c958bbd02d46da4357cdfc126c4ca48'
            'adfe4c280921fe2e2e876e93a45d52d6357752f0fee35cf77517458aa7839729'
            '5546e388e06c25749e043f810c3e08eede39de8cc9f6932f307d3635124eb1e5'
            'bf75d3d13493d49785ede903e4b1fa082ab7ead756bca49504200213008f0421'
            '3c33c78f03f6a88c9f9f00d0f76190ac538c30a56615bf5a8625bdde6945c1eb'
            'f0a374bf2058cdefec05c3bc6631a0b1d9e877ceeeb7318be18dc46617c3b07a'
            'ab24d899c5c3df665751ab5c1d7b37570ab9ce7a675851c91f3044bce54260b3'
            '989d8c61b29cbcb75d99356634cdcce5a55a2feb81dbbb6fad372cdbf9457da5'
            '641295e1def72d045001428f5ea14275ec53c19a0d858304e29536413e581653'
            '04cc8f7e3b75fce9de1e59881bf5e27d22523128228c0d3704397a62ee6b8590'
            '5449838ab125704a2af424ccbd0d7bcac738d56023564ec5eb7e32995e227faa'
            '2df4062acff29ee35a78b6f9b02088858e6f8fa538a01e5be81bee84549d6622'
            'ee1e1466330cf6549ee4eb03da0cd65f30169b1d84e86db4b5f121c250f52a1d'
            '8f1efd7055c5dcf940364eb5c4b6cc2aaae73935e299c3c7c92a8b93f0a20011'
            '60de5062e20619653ab5926dc85b76d19e3df68d76a0655cecb3882e6d6f4db5'
            '64d06351e3a4715dd9da0b1cb955b76921a7a62c0fe4d3f3d27e4da9a5747e68'
            '97161e506903d028eaf01f3a830f70b44bc863c0f117182b93ac140788aaac24'
            '1980a213aac92ee3a6f9ceae834346a3330f9147c81abdbdcd05a422e9f012f4'
            '3761553c5ef7dfc2f0c2600710e4ed5889103694250bc1c814582a541187891a'
            'c159334e46614d506c7c4a909f29e3e24f2d601faa16b6d69507c2b37f105809'
            'b00d148a10f1b08c879818d288aeeedc9e297cc9e118ca5495e65fbbbf2c1625'
            '7a2beac9eb3b149a53d5ed66202718d39b14f298ebee225c33833cda103b32ca'
            '63e49d296e76a8c7a12d601aa2d0f18c8a35a0fc1706c869ebc312aeb62c36f5'
            'b910ce0477e8d6aa0081709f78528a312577990e4161c0310546331076d52e98'
            'ba16076659f4ed80d84bd74b40ab411b68aa487872cb6848d49c68bb3381cd7b'
            '8cd4db319df800cb00e298884c391a091400428df838ea57400b2d3e6c494ba3'
            '484da1abc29ee5561d603f58e4e62c818b0cfc45a78b45e201e30ea4f334e16c'
            'cc28b87edac9000ed36d0f2fe3b0b1c65afc13e4091dca7ea288f3dc61d95968'
            'e011a47816ad22f88f4af3131a5dae5822b0bda555fecfc7e8c1cebddfdbd139'
            '5c9649e6521fcb2928fa74abaa4160cfccdff34d719cd7e0401e8a9441aa281e'
            '2396de0a7c4ed49da03b82c339359e85b8bbf47647226ff7d2647364b6678cc8'
            '27fec54bd9114e5873285066ad83ee0c6fb8e8467c414358ce2a26adf11b361b'
            'd17b6c59343ab872cd6803aa79829db3a694600f9714a615b0926e6effd62fe0'
            '2c91266db457beae57980d6410b6fc58d4f2eca0a11e9f1238bc3f976c170ae0'
            '1dda8a198af273906ee43c01e3abbd697911a3085ee1c218b783a44417fa8299'
            '37e035fb25c4a3a32a5a479fc7c4fe8008e31a82ead936d157a3299df9fb6a6b'
            '58d5688919e2dbeaf03c72cd94a75a16bd1ec36268881967b7f7aedb55c021cd'
            '4a1c03d9377bf854d6c631c280d4cf52107161c48091be2099cda289e64df8ed'
            'e2e909324a02b0a829fba3d7bf815c8323c42a350fdfb8c68ac91a186bab1064'
            'efb006932286739f25359536bd0d3db5690d29dc82a5bc46489e183160e6d426'
            '23815574cfe211d6ef49e13904bad3fdc19833db4864db906a1619b9b93cf3df'
            '32345c57be5d0ce6ba5453bcb7b765b02d3693c51f4f4a30afcc7e50f6c6a3e1'
            'ff502539ed98fd0c2921caba6541cfb7197dceb419c04c48e71f00c8a54a6b2b'
            '0f740d6a236f7649c00b4b7bc60949abf1e11998b140cc7553c847847e29caf4'
            '86cf381c3c8b7dcbb5d2fbed42b6896890689c4de878bfb9d9300610bdd60cbd'
            '0997938d7beedddeb3fa27988c6a73e082478e059db116151e910952a9ee24df'
            'fb9abc6b6bb40d6441fc0ec85cbe078090b1cb4a928ca092bf311eb93e739599'
            '257b809b8f524e0583a54dffe4fc6cc486cf2f4dd205a8b7c35ce2e1478fd30d'
            '4f1e1963da1ffc6e6d03c9d4a801bc9d92a8690abca773d08fb1d783ea232cea'
            '29555203dec593e4174ea419f2a5a2f144055660c64053e908b8623555a0b4b1'
            '41b2eea3649ff3ba37e38f99bbdee29e6f83911e5b4158e17ddac17be91eb0e1'
            '3af4fcdfb81cd70cc6f2acb98f7342d49dff515c954ed4940afc8e731a7074e0'
            '3191890c78f5e7a4f76aff004cce277b25bac3d00ece0f9ca0058e75e7a430b5'
            '330cc9dd01c80c2b31e8f9bb1b623c4c6fb30c0e8f5de319c3ef6f6f398d30fd'
            'aaa26d7a67ab59a9ddcc513d1076b6535427f9d85cfe736892eb149d54ad9cbc'
            'f18a45291038f589e4c65138472d81751ca45ec5569cc3ec5e5979287cb1018a'
            'bc274b98f8fb89c819d587f40fdd7199dcff0bd8d0ced9de6a8984af8a71dc15'
            '6c662b493a562fccf4bfadc4f18a45197baa2066d63d4cac4e59dfb1811b3e92'
            '9103296dcd9913af507050e643c9a83b7407fe6d94685b416a82df4de024d815'
            '57da25f7d2e085c4666cfa13122ba0acfc7097227ae6b9b94e64caae8a918f16'
            '94d8232b7cfe34f1a0fadaeb1a6794a7c17ddf163f4115263f94530de7dc6a09'
            '9eece3fd6a53f333c39b7cce304a14523d9cf8cb30b5397b093f50e6ff1b43f7'
            '55d8b55c6299d8648859541083dbd0f38b4747e2963793a6f90da150c394d8d2'
            'e0838ee987f88b8b8a1864898c959765423a9ad75174cbb850b32b90cc9cdac3'
            '84a144b00055888b1705ab54776b7f0974439c2ec72bc35320a8266780e20066')
