# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0a1.20200712
_pkgver=80.0a1
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

  install -Dm644 "firefox-i18n-$pkgver-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('6bfd529cebcd07937cf52be0aa52d51b017e91db202f1da709b08e4a157e6cae'
            'f23628f326da2d3636135fca127640e82bf78b18ce13cd8f719e466eb6cd63a3'
            '40f1b6d11fb06110e62e8e2a55afd44a8c3eb0e7bc6d97412492371dbf5d6eff'
            'deed3263a1c9a8dc5a6f7a92e3e7a86e1d9645e5a481027790c5b027895df1ce'
            'aec03d059b1a406d4a30a6366f3f54a67a30e2564628f0f11aabe76eec0eda63'
            '5e4473de39b37ffab03e1572e4c9137309b7b7fc40f8a802ff8dfadce50a1736'
            'a49c95f0bb0179c463c503e8def3a907f85e3de343d38f2d92c98c752e0f2765'
            'd26959ddfe30e880ef196946e0ef6a09e8628bee121c0a1667904f600a08f99d'
            'e7973e806ade0ed965d2010959b6b08064afc06f84245372bebe0f487a43b262'
            '22d0f650944c7d884f72b1f6930819ea4d6e2a90aa43b4960181f8ac84988d84'
            'fcc27951a771737aba8c6187c5dd0dd8a62458b31924d8081ee2ac4aaa089435'
            'ea702c2dc2e06549c3b3d9f625ef28a172a22cdc5e2e9d96cac5177895823513'
            '7f1f5db77556a0f5edb20c91ce970f17320382ab2b7def575b36f9a0cc7f58aa'
            '312f41ca6422dd932985aafc5a4766a9870971f48c48509d3e589867ef616b66'
            '4d7a26a7dad98d3745cb8d85e8d9e7a7ff47aa86d68621c6c1389f8632eecd17'
            '0f076024602cbd7926c32a943078c8062711310954fdcc61cbc9ad9c1849038e'
            '32dbeede6bd4a027038455ee21ae6911e687d9e70cdcb13475c23ee35a157ee9'
            'c7e0eb6ea1fb400fb46708a44fc637ae133dc294370772c2fe191e8933df8021'
            'fd9ca22313dd3805e88970c47db733de4b1df3e9cb6f281f809646dce19664ba'
            'c6ae1aa4319508d1b6714a4f118c16f61f47beed3b061a96737584ec829a7148'
            'b33012bdd114c3ac3b7193f5a59e6be10898077a6713c7f4294945049beb9208'
            '26a850e85ef62feaa4f153c93729b3af1c61c1fb377666b2ddc947e7025a9540'
            '24f30e6dc8a2aeacba6600733d8498875d6e0e028b64048c6975b09ab730e437'
            'adaa00246cb4ede26527b05d13c7c57f16bb3f6fa3db0ea2883dc15399605157'
            'e905600dd30025ab761c6b24df0eba028baa4c0b432fcdcc5cee829230bc9bbc'
            'ca48e24e68e5902dac689e9015f0db690f2a0a29a12ea03986732d98e1771f2a'
            '59f1d379bf7131df0ecf29fb1f3e58b975e240716f42a3c9b65004517d352c8f'
            'ccb80a0feb25da75975d81ea28bf58ecefcbbc2e6333d7523192f362dfdda2cc'
            'c5d0f65408871fdff52a72c363ed8bcc70a972d334bcd33a2ce1324c2a5ed4e2'
            '00c18e4dc8a4ccc87648a99a88c3be1adb038b82d65d4651d0192b86679cb2b1'
            '898823ac0101033262a9a4f864d0f9a474f25c2551c96afb29cf56f5a37802db'
            '80d4526852dcd22a79328590bb7e60f4ff887cae66be918543713f1ec4f635d9'
            '63989881a69f7f4b41879f1e9fb62fd832c68371c210fa9a9ace56c9570cad43'
            'b3be2c986807415ae61f9f4c0ad94650f451840c81edb9642b1f1f552e6f80ff'
            '6dad9ca0885d1349de82db581f50bd26ed5bf48bdda30572907bb5ab2ef09820'
            '1c615a5dce3f08606620cc6e0a38d9f361ea2cdec7d8f9fdc7a1a08b9e885667'
            'd2501d6d172a4b430e89569a9e02dc65a31b593ff49223954c352e1216144960'
            'ce07cc6b5857327bb1eecb96861fe9cd99715f332d8cd085b5b1815ec7cb777d'
            'c503bf0f57699f95c6e85391fbb9d7cfc548361d125c24f6fc08baa7c959f702'
            '4c5f3aeabaa9935baa66f7b7c433add240f481eb09f6a077174c15365a6238b7'
            '706cbaaf9a95f2c2af10484375ac64d517f8daa0529969fbea1bcd7f480b395e'
            '000c270277c39d3c179f409ab2dc3cd50879e71f937669df8b5e0de4532d8b1b'
            'f6da773704c71d18ab7ec1ceaedcebc88093cd70794515ab2bd15ee6255ad521'
            'e1b8e219147c6ecee6ce4776527ae45cad5659323794df269271749bf7003491'
            '739e8d3b2c15b9a1a610b0469fc196028643ac6bf406b3f83ccf0113664cf80a'
            '586834e93e67407cd64e40c8a6ee2f99ea25b4e32ac83594d09170f782f0f777'
            '635e1b6e1e8cd81ecf95ebbfa444b23081f01cc511e3962490efbcf9859705c5'
            'c2cf33ccb8d9277bd6be5540b7ade955317d9301f5a2d20bdddb6685371f072e'
            '4586103a482ffa3ad6a393fda6ea8c5115b08ff6f0dc1103d9be1de8c4236ce6'
            '97a2fbafaca8ff6b387763fe9979e327bc24f4b641182c3ce1f1d4f06fb2558e'
            'ebb1955d1a562cc2f3925ee9eeb7492d508a669189477eb9646306da694da518'
            '533e9a1d2738ce467cc752d48685bb16b908fcffa5082d4a849f17bce8d5bf2c'
            '385a7eaf1ec53acbb33627d39ca4a1bd34a1bde204022ff15e06051fa3a208ad'
            '5e91c57a4a45ef4f045cfa056915fb3ffdb772b982f9accbe196cd2ad5ae54eb'
            '53c6819c79e8c7df9c8a0a641c64e1515afb5602419b79fe356b247574e7c548'
            '905d9df13d5eed980c710757f0798d0ff432d7d550bcb3abea9a65b0c305ae4b'
            '494c998692bb28952e173e7ef5678a1fa5b56f5ba9f3d93990776c45ef76a3ab'
            '7ea1dc1b0f603c7e58208b5e8bd32cb401514bc15ba84954621c3874a81e34be'
            '8b166adf1455a6457a2ca2509e65a17b17e4f9fe49bf6581a128937d715c5d21'
            'f230a73d2ba664d85af3ba66d788d7f45cc1453f71812d30c573ea1d621e59b6'
            '345a7a04d46993b041a4b060065be1267046f605aa9349300803ee27c33dddae'
            '6d43fb828c834f84dda70c9bff79ee35f899a9a896c609affb9ae8d62316627e'
            '26d4c7c15dbed86f0b32800e67f578a4b78c6e10b2adc4e82528c2355d40eec0'
            '3791c1ca162cd369e9e47fcfd2c009509584b548783b4cdfab39e713984f55ef'
            'c6bdd427db1ba0fe2dbc4deb51626cfe16b12ff26a079b9764625df4c8dfba98'
            '97d8086a01a504b1b9fd56df776ac37d3ec51d3492dc01d662adb99753ca86bd'
            '140c2c1e16375d42c85ea321056e1c6d374b14b82a09e579d51ebee26342d6b1'
            'b56df033e850e6f6dcf0fcc0660b8c038ea67da3eba7fd8c61ca134744c9cf53'
            'a1fc4026761075f20060e3aaf4db78d6f6da51fa7a256a362e5658abc8d536bb'
            '8dd09199df7c8250f78c4732aba14c3ce0c8e9d2b5809abdca4960b347594230'
            '261fca8eb186c18fa4752e75f4bf5b3543b38d91e853b95c8f3ab4badfe3c1c3'
            '251d0b42a7bf2dfd8d17ef20765573b8e4809cc9a9281ccdf124c64484aac8d9'
            '12ac53728278f3f81da3b577e6c79b21017d57a6146bb83df2ff16e3e50aeff4'
            'c2f60de4a3be43691d43a4f091c5ccf43d59a17f049093fdc979c08a79082fff'
            '1a39c7e7b93e55916b7d7d512b9a4d50a83a8831b898f916f41a1885290608ff'
            '991345016a82c33be317bfc4b732a05efa2045f05903ae4a0f0cc95b509a84d0'
            '261438131f0e2e386128f023c78495135092c180a7aefe5eb53f1077cdc22717'
            '223a8ec69a94d18af523e3ced5e3c4eefc8e4a077793893627dcb5e3c4d5173d'
            '242286de7cca51b9c4ed9c0d1f8483735ea68a5949698a3b9cb4ddefefcd80e9'
            '3d35451395956bc8c065827b075b8f77e8ddc93aa9158e61caf59ee914e67039'
            '103f0d232d60f475abc7b511a21354b90802daa17d7bd4a0aedf689adad2c75d'
            '04e7ef8da736e006b0a6260ba48fb25855f778c55a119b2f72a831996e07ce7a'
            '38ee8b2fa36cae54dc8d44a36097e327db06f65c519ea285a46ee887dbcd4a48'
            '340f319e49b762eb104d1e3bccea984f77a575283e7d73503d22f7b0abd43d75'
            'b43e19e43b7a826dafc12bf562b9ee9c4ea2229aef93d954fb4e7a58cac167c2'
            '8c25b6468063465eadb0137d08a826207b544fd0751de538640127de615fef35'
            '997dee4832e5eb4e97d05b58c854a9c8dccc9a20150f1bb042f5a8c6b60af08f'
            '8f3cd40fbe3ecfacaf98300ff3caa29d77ea34134e15acadf3f9428f5abdec15'
            '7ae8ede794fd1479cfcc661f893f2f7a615c3b2de852a3e8dfce92ba953e461c'
            '9bf51e2852f3e547a06047f03b60e101d0675f4341ff5f57b1d09953ffea8281'
            '9499bce2c5d0a1aab7c95a2592f74745bc6327e7721ae5a6660421c312c6cae7'
            '41833c1de18e47daede49e12b1548298d6a0f883bef732796a7db91ed1525ba9'
            'a60e28917edf074af0cc44b01c9c7b6115948cad4a8076bdbc3f1338b343400b'
            '8884ba5885461245a2c915517eb34f33e0aa30fa6890882a7a3593c924fe477f'
            '9457320fe478341edf64b9a768ee6a88855147799c2675340e6f39b470eb1e32')
