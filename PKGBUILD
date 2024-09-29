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

pkgver=132.0a1.20240928.195442

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

sha256sums=('d50c0ba4500822a3cbf7eaa617024cc8f171e8279a3fbe38010750dcc1ab6677'
            '1c767178535d34b9a6021da8f56411f44c3b54b4fbec939bc0f7419892b2329f'
            'd5bc75cd562bed30f9e03c3e92747e14026b87f101a7d3402269eebc7f5ba9dd'
            '11d1ef04fcd5ff50a0d78188723563fae57abdb4fb8fa1ede2e991bacd0a2562'
            'e956772142b2fac56af883d6fc2d032b270e10581f9d1a9a164302cf3b49d0de'
            '8d262b774ff18c73593bd71c6142e6cbac8432071541f805214bbfa0f7c88a51'
            '54d5f56da137d8c66fa5c8528d7008ca405fc55475fe071bca6c50c74ecbd688'
            'a8a35d6724bcd52bbcc341fad7637d87f21deec4548f6126b9ffb810ee45a238'
            'fe99aa59bcffac0e27ab4c60d40ebf8a75cc87252471a1198f2083e998427b62'
            '2ef5bafc39b5f2180e2ff8daf83f41a6a81d52560616ef3aaa9881969ab623e9'
            'acb7880c69126a1683495b71b1ee0a6e9cf0f532b131515c15b214ebd5fd7118'
            '03c614dfd075cdb6d7f3eb6cf4889f9a6bee561a72c149bb3851006a4b2751e7'
            'ff2b4b2a8a52056f6c76e721ec7b6d34a930afa4fc01a01aaba69543bb1a2412'
            '58475322e3a0f40f1f2b7043416b94401c91e616ccf5cef331860016d4a3355d'
            '01931d743e275c3350a1d272ecc5ad66ca2a90836f9fee93501ff172f8bc0154'
            '63f1596f79fb129c7a6b1f04c96afa4df266542cc8cf62b42614136ed934b77c'
            'fd8a4f7905c8e67b88635eb84ce8c10eb2b8e2b3ba87950db653e9a6f29d1114'
            '5408fb21c58bb5dbc357ca5d51028c85f39df047bec8824600f2dfeb98dab506'
            '788f4446ce9f4699e37c43ecf896f674401181dcbb7254c4352638f4d45a0157'
            '342ac4447fb7aeaf743d5d825c77ce6a62c2d968d0718aac00c02b8bf173bc38'
            'cddfa3006e90c044eb29c0b0e962f896c739110c41c25e074e7a23d8385f3e40'
            'c99646d1275db953ed56a9ebf0c0cb00530ce7392d78c0e95aa0f690f50065b5'
            '0bf78b356082e6202ab73768e469aee8b0b6371d77356b9fdc5c7b144b0f9903'
            'e103c6fb5758b07e033f5905c56ac2496946c2d7e48b2112268c1e83ebb107ce'
            '19c0999894a64c5f816b051bcbf6474dd52b81391191ff52af8c1460602234b6'
            '75f915640500cd094d2585d1ced60cfc3ba404129940b3ad2a98dd8fcc50063e'
            '706d9901c798c98e7f140677e3870e2085fb8d45d912542285bab059a9c358c6'
            'b6e2d0e2371d1330daf8ea312ab61118c66d79cc0d5d4226d8265a5a4c63a285'
            '51db45664a3e8939455c1c42f164552b1959c1bc8da3dedac25cde2e0b5a0692'
            '9494edeadc25fbffdf25d876b18ee4325292a996e8531881bcdbdbbf4aa5698b'
            'f7979a5251451a290999e569c71d441bca7846a587a4459da4c8a364be397558'
            '5973aa8b39b74711684e9dfde988dcce1705635fbdbfe79df7ca841999ae3f34'
            '7887b02e18f57438bad6a8bf3a7dc125f1c9d722e533701f3c92492ee5a92b14'
            'e36c5e21068ac5f26440d2c2075e342e5edcbe66066ce39cdd9f3f158d258438'
            'e2761a2864f1ff5f0cd87162bdddd0f395b325c22480c4f624f2f633dd057ad1'
            'c13de993097c6f599227c9b4714191c6cf68a95d626c99942fdb74f4bb9c9a9b'
            '8f29fe99d6194fdfca5f7267f86c8ad4b1fbc963861ff2afba58256939f142a0'
            '88a7a9e59fd55c22040d2452b2acca6da0fa644cdd083393e0ae231ace1c82fb'
            '735635e99a69f7bd1d0d4d0bb96832d48675e7b4c25bd2c81fc579c7804b936f'
            'ef4d5dc1a5b03f9cf6dbfb41e16a436031f8ca5a0cc0ec9cbc7ae5168f6ae6f8'
            'd253cb9bab2b23605ddd5a5f189e9bd9062815887169dfda755bd8f3eb8219ad'
            '84961e5ea6a587cef3f8d4af45b912bf2f981aa5191b7706cc4c46fe4a61d4dc'
            '4ff52884ef223acc1206dc687541ce9bb5f7dc524052bc4a21274ed41e59ee02'
            'cf41960d156470ab1a7a418505ec8ca44f3495daa05b648192f66e793112cf1d'
            '46c7e425787a19e80910e91beb63222366a08515d16e2e780de652279efd8de2'
            '62744ff5236ee3d147f7f3026cb99cda13ae05bd06a16b70f07a0928e678ca41'
            '2f5f77dc07b90b8d71dddeb0941b7791bf04e6dbb71fc648823ae3574b23f1b3'
            'c0941db230f90e655f621cb75ce2e95d00ec299e02f4a50a7c55799cc2eb5186'
            'b12cac91338e4763ef5d76c082196a14701b461cb0b5fb41c37840413ef97f2a'
            '5e1e057e56bb5dd2f9d0ecd1bc981730fd7bd20af71ae778155d85af3bfebbc6'
            '0c7dece98d1a3769d8f58d8aacb8799e4c00c5252f31faab536764c0723a910f'
            '4cde19b3e83e4d92f6515193aeede0c5bd9c017cf077d71bb53e069c9c1ad2b9'
            'd079bad1b3ac622f04270fa6076fe8f9c1c1376ab15cda7f11ca43fb9d1d272c'
            '41b0901d70bc2a4e29e10caaec6d659c5854c1c9d39a1f4769b7c34ca552f2ac'
            '12b3f36056385026169c94505b2f32d916f020ee478ea8b73f7e4c6dfee3241f'
            '048c3e44be813e906feba742269bdb21680c66ed92e7f28a51be82a2748376ec'
            'd129980d63bde8170daa9ee097a1b897ce80fb9653d4c6d946a71386cbb5e92f'
            'e69c14b67fe49103164e41b4d64ceb82869b167d8208683061c87fc57c07d34e'
            '1139ee0ceaa5fb6cc0d85085a9f87590dcb2d8b083d9c5a8c66b2a700ee564df'
            '4003fa95750267ffaf7468a2c3b308aa975203b06bfaaee98be0538d886ec7a4'
            'c1a1b5ccee78ce7ba3fca73e18ce315fbd0d3ac3842ff71f0969fe69318c407c'
            'b598f4d7fdf6d40f7a5350c35d6fe634b4f4c78a40b6306009cbc5b3fe8852b2'
            '80df1ef1319923b8f5875173860c915e1220cd98959744adb8976f0a9dfc7929'
            'c0eebad135b5fbf79f5f454f28345f787263eceb7a354f3729fa0e682f7c68fa'
            '883c6a33535bbb954b3d51fcb1f132306843d45dc00940a842c65b7de6d41c8b'
            '398575a1941ea099377528de702ded749483d101f06b0bbf76ac598e50f6c46f'
            '7e69ede484f7f0557632f697906dc302c57c22f4fc9aff9c3c667d2747808491'
            '625b540baa5c0d0a7129bc1b1f81553ad8e997a36047f0127e68a87ad6a22625'
            '149075e95d176471ce31d9771f8546cfa9823d08e29611047658cf2faa7b7671'
            '7a1f59067b3a6a6d692298c17c0790b7cd4b6e1fd8db0e2c3a7d53a0c55ddba7'
            'c27d757542da1ebc19048952589af0942a9f34fc720de250d3953e9e67416677'
            'd881daab6931d5d86fc4b7c954faea12628a0d225f22f3c47c5f713b4131b2eb'
            'f174bd254be65eebb5fa6e5601721d8dc87ae30b8670e380c60eb6a67c685537'
            'df727594ef54314c095b4500972d2e334d65b4f2bad1c9fa6af2ddcd999b9abc'
            'f567f7ef6e99dae7b51684713c7a0efe907ffcba3c6d5ca75b619742924fc398'
            '7aa62080c07e2cf54c0e8020654fe63aa0154ec1fae3c3fc1c729fee13abef74'
            '16d899f568babbbd4be7ad6219431754b77a273c841fe2e5f7b75b9133a2c4a1'
            '1e8c71ad1ce53f3d9f12c975289cc24268961e3be4e29628a2f18695ddc904c8'
            '479a3e338daa47c196c6b1957bf3f05f011b959a7ccb5f01a811cef8969aa483'
            '49b4fb992687842336ea46514715422874b3b96b4c7f4f57d2a9946563c53a3f'
            '1952c053a38a577a7fe584706dba485897cb4cd5343d119aafc11ff943c5457c'
            '0e019441ac8709d5e48c974e96fe236b5593aad6316d832d095bdeb0e2573adf'
            '653c20482e9f5f1d325f5aa9809f8d32b86eaa88ded128c35e9afc19562c1224'
            '3cb5c21074ff1fbfa6f6048c6a8bae0e378da769222a145e038452c07d258814'
            '7fb0875884278ebf51fead0a6103d01f9cd603140a75edea268b45cb850452c3'
            'c75ab5cbabcd5bc3e8085ba34355707dfd040238fa906434225f4fac3aaf2882'
            'f6062d62cdd1601681dec015c273d1f25cfde141dff908ed0c8a1f7b4377102b'
            '086e8637a7316606102947ed1fd36db83b1f365dfafb1e07af3ceeee2760ecfd'
            '3fa14b4c79ca99bf2b0225f8dfed3e2d6ffc17997dd04410fd6c80cd7d6a1dd5'
            '4e3d6a4bcf42464eff4a36781ffeac225de384ec78724560154ee86936b9f63d'
            '5533ff42658585b46921ba2d6ca66b745cc73accd0dc74d6f942d2b7c42f097c'
            '0305535d532abdb2c6a54344a2c204deb94c8e840a3347215a43277d303c2ebf'
            '4ad5fe4ecbabebe4b521248dfdbfbd8d33db4fb369d23a9e97c13d5f08afd679'
            '0bd7cb21acb65299d64d6af029c6555beb3e2d655641c83d81089a274471eae2'
            '8dff7481feaf038efb2da9860ed69a24db5efaed636aa558f2bc9a3068646a60')
