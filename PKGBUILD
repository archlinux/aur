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

pkgver=132.0a1.20240919.212730

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

sha256sums=('46291edb748b15a9027c8ecd7ec33e1cf86a7f7fdb27c47019ab27bac486b451'
            '4456d052ea29415c0c273fdd070349fba0b0661d48f4017ba0479e8722d3640f'
            '6b104e40cd0aab6321f35d01cae8977a5a6c842f0dfc8cc96d458e681f77fc19'
            '90176769aa41143d13d43881dbe28b0266d1ba59bbaff72d4f62b3d3526e95c0'
            'bf505b9c54b9edbc59b9ff0165ff66f2c2a430a4fc1e26eec9b006ec98d4b53a'
            'fb67bc6e13e25fc4cb901b8994d197464a33d42b239a5cc3b52ddbad4eefa168'
            'fbc485d443d7de74804293c54851373580aa86232157815ceeaaf443ae6c72e2'
            '851df10d8e77e157b8a354737f567d830a25b845093aede30791f9f2e2e67a75'
            'bdec8b55cd997e79b91b75c5cb4f6f22026587a426e2e57be824a0f3df2f5f07'
            'be37aec0ebd2847e1cd858a6ee234914e2b54d6abd8662f6386a1d5276f5a623'
            '7362b0c6ccc34f5fd3e915383a24a622c1329e617f0e34a8502642ab87795f55'
            '13609b090c7777ba6611ab28a8a89c799809fd09ce348eeaa3d9045a264d991a'
            '9559a94582eb09f5700374844b002716d802fbb4027b0fc7951fcf60e46f575e'
            'ad9f9654cdc880296a0e8a1f75ee50b0c65ac5e31dc7df670d2c3525d1f5c9fd'
            '398034ad508ddeb5e153bf67235d79e1ee6988a84d9aa8f3db999b107e1e1dcd'
            '3fb782bf5768c08697ab96dfb9c83fa76680f3ffd393657d2bfc7851ad2a2d95'
            '8d99d4918db1dc24bb817635656df50ccefe47eda1fd4a77c7ca4202efa85f1f'
            'bab85700e7e6b51a0770fbe1dfab39ac7766551803dfe40a51b9ee0f63bc2637'
            '35eabfca7b1e209edbb33b74b9921d6d235c6eb9ec03f35573168334ced53db8'
            'dbabd55d67474781f25bb89e92fcf27834bbbede6a3f961cd6e8302d77fccd5c'
            '36e6b81f4bbc3a828b889caa8ecf050b7559c688a1ca0cfae63ca0e7fd89d0e5'
            'bada7727fc4623be74fe90bd1d4c5d2127069c83ff16cd3a7e0796564f92cfae'
            '512c6e24fd4a75ff238c4867a20ba4c3279fa710440a7eb0ca030a7ae9c79276'
            'bd5ce702ef5cf1c53be08c47c380dfd4f9f6c6d8af51b990e099073ddcc4f505'
            '0e4aaf75726a4c69bdd2cd96ac90863c53fa6f4f80b614333ad490026f8145c8'
            '3be0dca52c5c06dfe2195e1c11138289882a9bf2b2003f6cbe290f763f1e97ff'
            '0f3d1ec245b27ca601c1f47387437f8b000b5edc34d7d47055e9d87cc2ff0a18'
            '03e8bbaa6dea4a90c8ea66075a6f3cb18003fa3cb9c7949ea0da36870ef89893'
            '09de78c97e9a72763baa8963a57ffdf81f9b811c78665fd9374b6df186e00159'
            'efd1b945691ba28757588969e085f4ff23643953167e0ca8c8f0dfc77a267f97'
            'fde1577ec8b3caf5b54048f1ba4860b0b8f91c2b0b50c4f3edb3dcfc11fc35fd'
            'e46051976c264384a837b7445445ede509666c5711848ac9bbf67f16f3a5341d'
            '773c63f593db94e64938a33f4a2db50beef796122875c3bc91d9de99b078bf4e'
            'e17d3556eb5bd10d86e70b3af6c043f5892b9ab70113824ae3c60ad8b9a69346'
            '3aaeb6d40d18eba3c4c8a448c8559b3c9fd7ff1c6a15c251fd8b113fe580d6d3'
            'a341f5a15e38656dfe1753dca3982326265afeab8a7d882eca064c3e2e2e8a2a'
            'ce136918db3cdee88446c5dfb8411f74e9ecc588a6665e48223f263969a1ea98'
            '329da6cd3dfd690c9533323ccf73b5d51b62b72b79e984e198758130a19f963e'
            '453f5c64c440b23ca93e54d1310eff30ad0b14486b14950dff204c32a1449f3a'
            '81dec525dedac33e5a9b1373b236bc973cfb21298a1b5b6e9580575d432a1b24'
            '47f2374423878e1d16d24dc6d555d68670d777451ceac3b5d3da6a46d802f2b0'
            '18dd49e2789cbb90743a2e82b9767970e5c580619a8d8e1c26e2dccaaae30a83'
            '443095012c3c3b8893aa5d5fc76b44ee1071ed0db9f491bbf459c0f42782b9ca'
            '61cf9fa4e11604efa0866174f776a744bf47a209e3e7e1f4d9b7a5add0af4019'
            '3eeb610f96f0ca4efd6807445f16fb880ffa955d1d450dcb79677c5eb8f54a27'
            '86b8774442a37981275bb4cb2c5c1f435aab98ed94135d086b4f064b056e5500'
            '05dc506f660f378fd286f85e5373ae748fbd52957633422bedb85074034d8919'
            'a52b086901992122ea1c2acc2fb3d1cede8aca739a3c8a7a8a643d76d9a1d62d'
            '3c012a90f0c6daf4201dd96e3a9690d4f1bf27f1ddbfee71777a75c940b9dcca'
            '7b6f1afdea53e6b01a20c00ca29aad65e16736e346aa28ac85b9dde3a4b0c906'
            '0b59172989c1aa3efcf155e6f4dc4efb2cd42a2e47858e7f2b9428063bd94303'
            '8df1fc7c04ff0cf57f784e13ad76546d6da51b1c6388759203c9add2f8f7db60'
            'c21746f3aa50cf358a4b06b469f53baa47629447ee9ccf96500fc863ca8a07bc'
            '6dc425e7bc86406d9be38e3501dc93b901e2452914663cd146661d8d56743eff'
            '6b4a52e7b5bcc1c35fc99d8f3fdbd2b82b6b06201f243691f943eef1ad15cf51'
            'd1b832c6b4f7f991300a43b0340abdc6862e18e4b4d21ef9a8120188cbf9e66f'
            '0ac8d39cc7f40f4009c3ba8f1924e7b76593a8d98499d882927a5179e1c4b584'
            '2d7312c607f9dc52c07c83bcabef81aecebbaa2e6b788d6ee8a899bbc16f30c7'
            'cc67445be7cbafab6244b6ea6d722eca38eab29cad4d56f4e25e3094ebfd223e'
            '4b67041ed4659f08124a3a3124fd8802e16e16cad011f5cb77b11bf34d72a9a7'
            '7af4bcf8dbb57aee7906db965e5e84f60eb619f3f25a629959f5fc987bfd0d7e'
            '8c7a24c364e8bdbca3497ad0f88aee8d66f62a9c18eecb91b3eb16205f92ea2a'
            'ce18ed22da0c82bd2fef27da2cd2f9204b9b8b6dbbdd25470d2366bceb0ec9c7'
            '13b3e8c1c688daeec97a27079f55113df3d2e67279be1c886d62668b5c8c8fc9'
            'f0dd374dae93f3ce80b41623a23474513cd8c215728adf8ed04ed31981713a2b'
            'bd6fa45abe376d663ba9082ea2df3be47de1be5c8757f5d1f1e4f5407bcb8216'
            '6fd8b92df96ccb3a9a9d00a7e775671d723dd10056e17fd5b84e36af67e735c3'
            '37488225fdbdf3893d869a003d7903f2a9eee2c2a5b10f453f6b182b942aeb84'
            '16738aae9f31660c1ecb8713dba9a321c02d3f554d0c754f0c2a6d52ec5d3eaa'
            '5971984ca18b38128c74d975c7b5d43f8cf6c52d91c3dc565bb41bdb4c3e58c2'
            'e152a3f981883c6c273754baf9513a035e2dc656ae398d9f9b95d7147fa6ae71'
            'fb3d87d60cc25a9ae4989e1d98166cfca07754c3f5b94abf363c3268113adfd5'
            '03936801f404170a0a79f8e93e07a9d4e8fd17f7700f791e826df91600d4d17f'
            'e3325a16618a65952c355de735d1deabe8ea458cd3c748cb99ddbcd6cf913178'
            '5d6dc4d479b313a7a2de150587700aac1c238a77b5ba43943c8d9a3dee871771'
            'f1f3ba5aab8845079c7d1b3136caae0c71c39cdc285015594a76b116a057bc4c'
            '84cdef71a56f6a69612217b8deabed100236a04b327fb8bc599f7bbd24c6cc23'
            'ae51dca829765e020987cbd25460272e549d6192dfc4257631bf156653b1515c'
            '05b83e267e5187765a107b1d53880db29f9ff88ff0941ccd1ba2b7f9f26e7dad'
            'aff795ccc975cb32e8e79454361dbd697fad37bf6a09d6f4cea23b1306e62bdf'
            '2f4f8c1219439ddcd7d17f050ae7f333efe9716a5b5ddab045163c3af4e4ddb3'
            'f5fa80d825879a77fb861bbd50b9fc88a58f88fe765930ec164fa830d6b97f9a'
            'fb2e31f216bc1782d75e6a69cddf37527d77a33fa44fe4e567ec83acca4ba290'
            '947a28017825006ee9b38a293428f7b1ace34288d4348bad0c07602d351bd691'
            '9f588b494ae18e4dba7ad27bec2ac55bfd1bfc6c7e77ecd2fbad83f7c19def5e'
            '7316bf3665babc7908322621d41581b538c6ce02d6d324c4b1b8dcf92c53c78e'
            '23b0921d81095f9dbabaf4ed368699ebd7667de2fe05db533d0d0aded5f87450'
            '34abd60be02f65f697db4e8cbd8575c98bed6eac887f0562557c4bcb35c716a3'
            'd901140658f8ce5ec54ee1672c7a901baeec5b1664e00cb82eff12b27ae326ee'
            '94cb0460b482d5d087cf05918b4135ac76032392ae6accf4235a38fb0c2c2a26'
            '988e726be5b5dce5e644428f1916c653c9eabe98569a57ed7a3d422b4be92f34'
            '7a9b4b8545d04c0850a21c7ac0bba62c212e12d15d7372025623ff751b786015'
            '4c3523dc8cba9a121625923fa73f690c334431cd9c99fab57d8a98d4b6ab39aa'
            '5586105715e77079296b35e0264f7eed2c7db01cff97b8753fdbd06223708f73'
            '2d32a3837674743212b66f6974ac2eaac152e2f4bcdd08b62ac396545ae41939')
