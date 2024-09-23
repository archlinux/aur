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

pkgver=132.0a1.20240923.090434

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

sha256sums=('f2f7bb1ca3bc57aadab0c32802d87230ebc9daf3b9ea4e43edbe2523cd6f2070'
            '7cf3fd072389407fe90425b2a15a405c95f83afe744dbae9eac7a5ad2d9b72c9'
            '4d181d5384177898d4382d857b1ce0e5216272c83343a1424d1c6a8321bb88f4'
            '471d9dbadb366b7e0d9aac2bc14c6abd9bc78c18d7f4e1c4df5ef671c3b849be'
            '9cfa17ab938fe14bf1ebf3b4c86e59790a318ff77371bae558f6cae4b1afcc72'
            '87ce59752fa5ec93f9f684c4da431645a831aeafee19c334d807418a6c082f60'
            '98e52ab892d454bddcb87d60c6835a8af51d60c79a9144cbd6bb7cd0e4fc9c20'
            '51b80a76cf54e1118fbc8e3cdff260a8032acdb9ead5e5b84127a32b63bd1871'
            'd73cab3a11415f87db4c174c88790a692969bf04c92651b64ddc9b636fc4738b'
            '1519deeea52b3696ce454ea7ba2147856712f25276418418c0b73799670c7743'
            'b426ea9234cb7a3866baaa5e5c7d8d94c7026126b82284164c6bc9d964215356'
            '490e2d044962ba6fb78fe89a6f8669b2fcd17738c9357430c25c8008e0179819'
            '6d8c277c15a09495d8f27ee4b3e3002cd1845be14dc1e3ff02d121a93baa2924'
            '773e93212fe918fbd6e6530a289bdb63351bc7de1485503c033f978e1c4de5a1'
            '7d3e3419a826db92b203c129d7130e54df27d1dd82fc957fda08fbff4efb5ea4'
            '3720b2d800abee80b12016506f085d47e4fff5d4d9969b6dba5ddf760a6fce0b'
            '40399456498539e2068037d451f62e0b4045e5d6d140996e59251169ec49b19c'
            'ee1b4804d9099ba34155c5d274ff6221b0570f1509e15f7cdd18f57ce1a12427'
            '8f0be43ee32f233e70f1f30679b0f5866b9046d25359f5c42decbf32c2167fd6'
            '2b07643dd24898081f8246f1d8a88990f6cf34eeb450602126d010e61fd6828d'
            'b0b0f36698e990d968b2e65bb74d27545624ff47313771ce9ef8d2e79a4d129e'
            'ab467cb1482042e9dd60ee03948877b654864b2bee48cfc47d927f8f99d7a7e5'
            'f52c90d82928cbec20b4821ea216bd417ae049944a7b308acd8430cc327f12e6'
            '77b0c159f16321c0e44ff3f6ee2003e387e7639ba67f2273e494abd0f48510fb'
            '4dc5fe0098bdd93c66a86a73f2ff5c473a5b30f4778aca35b082c37423c345b4'
            '92dcb8b9ed4010365c0c6ab2fea3d53d81fb343f4fe42582dd104b9fe7e8d604'
            'ee489f2c7105d5218728ef888927526ac6218a6b824e47726fd56bf17bf6ad71'
            'e6b475e1cd1f3d9eae76ea14169e44683c2d1af0a5648fd24b9b7366cd4b337b'
            'dc463e7f29b30200fd32125fa03bacd426029b50e339624d7b2ef472ef69417d'
            '8bc0f096bdce65e783f58a581b938554c0340d835fe90aa429615b8034d3370c'
            'e25d893831d1b927013106bcca4e0c46dc80f54e98b910e3995a082229957ed1'
            'f0f7d6a3745047cd7290e208b9baf1cbbbb9a32e023f2f3590f39ea9108e82ba'
            'bd93e8e3e14ea4e4f85f3be9116cb376e218706d4407724620c581cb9a9b794c'
            '2349af2c3a5acfcedaa2b0309e66f549e52099b9ade1b5b460eed2df3fe803ae'
            '4a2a66d37010d1fd526d83504ef34db7effcb90c35d58d09017106da219f73b9'
            '82a8e3c3470310c0c104c58983ca83d4639296b541f8195cce613d2a5e3eae3a'
            'd2022c1c1c8cad452cefb62b48da5fdb11fda964effa40f6f7ff8679f6d08a83'
            '534f2ac0d0f95bf548f83dcdcad26435ef2d12e409e964e44278329a3c50a7ba'
            'e9d05efb114a2d3ecee625273138e8fab71e667083d13ffa1b12d30ca2a46e4f'
            'ad77af615154994347f7fbee203172e7c5458cfe36cae2f166e4e15add9839c7'
            'd3de61a48228649f8e692ab2632c5ce3bd34b6c4a051546ab50701dc374da4c0'
            'c9a6932f5076dd1d79da1b43504a544c8466aec1093294c25bafb0b614432dc6'
            'f17961153510293f8594f8af3b4fb8a755d3ea3173689c18076a1b89d084a34a'
            'e5ee5dbf59b25d7c587ce1f3f813a9c014186793551a35d4c3c59080de266ce7'
            '2833d43f48232a722ff601cf55b39df7340b88a861e0b30b90a7deb378ac6592'
            '1cba5f13b187556d5982f3e2d2a9211ec9e2785a8bcc5c842d16a5b8240b8b64'
            'a16d168b9937c4d31fd0e7cdb8aa9d1269b4420fa8a14a5315d3b2e264850fe7'
            '1bfbf78921393c283507ea90d888d62bbda214471d95096d51ecefdd0607dc7e'
            '31f727c71c71549c18a52e6bfe707bfdef629ec912b0b3054e5d807edac5854c'
            '757752e1ac70a8aa5bb84455ec51787342974443ada6a42e7755288e43cd46f7'
            '79058d406deb79c689a5076e6ae8c8feeb8872737173fd619d3fdec4a598a63b'
            'ac4d487898fabc6216dd6f7ddfe4e25d5d101a746e2ccd319c3b51022bc4fb1c'
            'c60584e34461b778f446b892edfcc3533f60258dbd953ae685c1f5f201917f6a'
            '6d5afbc9e15997c3822d10ed56d5411bc780f58f251f1f040e2d4fb9a309b1c7'
            '4528c6a8d5332bd042973062b6f107b5d2f3f716983dfb75611fcdec5c429a25'
            'b79de94bcba77210debab8585818095acf7374e718aff3661c69d4708c88925f'
            'f89332ce2190bb90cff7cf06ff3d432ae30a9995ad9784fe258772d481e29931'
            'bcca457cc95b2f96cf591c2003170fcab3ebcfef28ead4cda4ae126df3e5b8f7'
            'd23058870befaa3375a3ff45a5234ae8115bede65b52b36d0272128a276d131c'
            '0788442262ed5d51c88691b146e2613e61ba629f3a0b2ff155327731b2594777'
            'd7ba1cb2e6320ebf58d8a3c36bcf51b62c031e3061cc0bac4efa0833b3fa95e4'
            '6575e15ebea1003c1d2be95e60bd2494c2a5ce84ffdba1507b983f4634ed6bf7'
            '726d7ef1190463afc2f93a14ff59ea4cb0c3611c6b8107c6d34934078936a2f0'
            'f14e459b699cdd9a2e823b91af80c84968020f6472ae391bd99a2a3509710a1a'
            '9bedbb46eb1c4d2ab65d125001a35f98ce9c69ea0c4b492f54d8a5739952afdc'
            '3b88a8bd0407ea0701fbba1abdf1c013508f155bec67429eae2f6f114b89cf2a'
            '02de8bd8b99fc88b455d9b144e2e2944e43000cce846955d315749f1d694ec8f'
            'ecdc69fbcfdeeb686bcb3914c907060d90fc9536979048222153b11e4ca9a928'
            'c7e8502d26b8c02b0bc3c3c7bd57a453ea963aafffc7e0f019767478ed36d699'
            'f1ed84dd83697079df41fdd6f9505bc04f81e736cb0ba50cb4fb8c86da76bf4d'
            '24377766774b869fd563b9406b3906d06faf3694aac5533d8d1ab540dc6266e7'
            '9215b40d2d90bc2325b0b438e7d92279abf0542f89d10774cb92f282b7d73935'
            '505e71d6438dce99f2bffc0b652439424c0a70e725f1378d0f8c40b1c441d255'
            '7b28edaf3a016b5fec00f7c8c01d8c6b2244a4a86bfa1d52b78e6e29fbd3b711'
            'd27fff702f95cade82b433ae633ef23acf31e36ee61fbb1a52f442b7b48ebcc7'
            '3a7522acbc34fb88ab5b136df4df4336cb23a8fef735afe63d275834e958e95a'
            '7b91699bf85b9b5ac17168e1f9c60b17b97f6e1e062e9ab5b104eef07948a5e4'
            'a59b4fa754b9049b56f3b0182d2d6fc01f0bfa0a3f8433cfe0ea6c2524086ddb'
            'dcd8b90052da00f1260b79b6c4be3f8d11da9599390d351b26aad40f541cb007'
            '80f33331dfd3d79ddb3febdab39203378a0d80dfd1db4eeac8fcc7d890e1e848'
            '1582926a6de29089a49745b6f23d4bd31cfa8f38cfb27ae36c3013519995baef'
            '5f3a8725412c6b3d646514fe004cdbdd9d29ff0a2d3fccaf79f7b8ce3638ed20'
            '912d527b7b4adb101c1d32db58cadea6eb58f66bdf2246b1782437b292586c38'
            '4385c16eaaf2ed421be83bf68e5d7420f4ff0bf9dcb042fc55af6350a58da858'
            '8f5c5bb0d12f40e1c4e08dfcd0343563f60a7981e5022bf07a432265e025bf4b'
            '82010f0fba69ab0e4fdc7238f8ed411c48811665fc63366a7e3b27f52d98e414'
            'b0c1911f7976ea2d77694aeca094cc76eac25ea6f1ee68db6640b4f3dcaf8d8e'
            '867de1b5d8464e01c08886746a917694e34a29a3ec25cbe5cb5380ac0aeeeb37'
            '3793a61e24bb43647ef16d0d9ffcc69d3c87391a15c580226e4383467bdaa205'
            '1a73675f0293347053cf95931a06354351ee50a8cea65f808d0a5b4cca9e96a8'
            '31ee2ef442dfb336ea699bcf56902452188f3ea1ceac9075a59c10a5d5bf9689'
            'e0f86316f4e5ca05ba7d0b50b7cad1d418dbd90fd074288f4c5c2e1cdf0772d4'
            'aede76361c62afb56bb935818b4af50344ef86320b79b3f5d86233f260838a88'
            '72626bc12becd3719828756629d447969968e94916afb8530e288f98224bf8db'
            '5fb5ddd3cd159ea6410d4f6a0f6f80c02b9b7a15452f1dea77c3f7508a1d85b5')
