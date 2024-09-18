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

pkgver=132.0a1.20240918.100058

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

sha256sums=('1c220542a4bacf546281380f103dd195f5ca92edf77d38fd727666e6f7b56b77'
            '5da4976c13f779dd99edf6e751ef92eed56708da2bfb00143069e4173861d4cd'
            'c023d7a7aaf0774d8280a73aa92b7a2fa5cf148752dfe0698a13161ea03ed371'
            'cb18c83a13fe84e8c2dd2d900474b1b88b2d50bfb1ef6bd5b4c32cb349605f68'
            'e9df253f17950c99fddd0727be44419d400c2a71c948619df3e6b50a6a1797c0'
            'b8f4382b4924f5b1e91664698aff9b7d54e39c0e055594fe5e001c2776e67fd8'
            'aaa3388fdd9687cf1882d5ed98071109e1e36eb5d3b33ca5d0d5fab9e98c17eb'
            'ad6ab15db3e9b4a55ff50805baa786a28b8c75783034d038bf35f835d24472d5'
            '6bdcfce67a40af6f9f85023fb7e1280574ab30356eb0ab1f3ce2038bac60d8e3'
            '93875287f0035a24d30f724dd13ff4744c4f164acabbf8a94453aff4d208fd30'
            '2fbc6ceb49f438ffbf272a41faf86261ff1f9dc04deef23917196382701c0167'
            '266205e026222c588dfcc32fc7f2c519021dfe3952f58847fd8267fff453a341'
            '40d5ff17e8448c7348e58a04f3e6422b87566eeffe053258775d44ce97c2183c'
            'b5989c375850beaabc941bf8fbc8e047023195d955b431074bc5eb43821f2c61'
            '207719dfbbfdfb0aa17468897de5fb6732cbfcae0033c23ba07589ace2fcf972'
            'b9aa8d0858a2b069e504d3bfc3b40e065bb6c5034bb2d0d51bbbb79e1e074b6c'
            '255495b00f5e4b441a4fba398953a413b8bcf06b306f56ed264c9f70658f4af2'
            'a3c96f06ea36ac9ec4dcbf9982f996db44930702030d242a17783f81186af566'
            '22275797526c65b0198d6f5a9069747dc89c28b5091fa07b652c558db07a93a9'
            'a8aaf4037a36e4c9fc31a83d3f8b56ff154cf48bf5818abd0a529d52994d8594'
            '82e99cea105bfae2a1980f35b4f25ed09f888b3ecff25e49110abcc0b3687d1c'
            'fd39ab511e4ef885eb1e98801aa60e199670414358723c72c2da8abccc507104'
            '537a4d449e8a4c958b1d379693f275eac2c5ab83e29fb73a102689b57f81d619'
            '0fa4433bcce38fd6a2f4634c6659246dec883cc8fe1a0c2f2b41ed71ae2506a7'
            'f3c55ff896903f46fc62c3e9fc3abc947b5d2f99e9b1f8300ceae403f678fd8c'
            '425058e851ac0321465bcaa230921a5248ac3776a3da4c61ad9388574431eafc'
            'ac7ef25eaad1fedaf64537e2298c2b66fb81f610fa7c09e111d6c107538c914c'
            'c1283fa216322890e9c047c10c47534c1eb87523317a07b91bf2fa0f78cbb527'
            '267ab835298316b75a9bbbcc573ba1902276af6b4e172bfa9917b8755fcf399e'
            '46bacdda312db8e867cdabff27f44b3e6517afdda73784c5bad5fffa425fbacf'
            'fce4d1f533d508e0e963f6e49ade0d3d466e021672e6711f64d26b56a41b58eb'
            '0157fd111f9ad6e90f35c98f03dfc7de2fa56150468c4a85fafe94512b7d985d'
            '20c852e4dd25f847eed22e176c7e8af4425840ad88737732715ba03287f3e62f'
            'b850942e81ed76ee1582df545404f0eaf91b4cd0916cce01c660e749766938be'
            'c8cfc790dcf50fcda770f5cca9cdf40964a99fd6d72d20bd2fe489f2ce7ec931'
            'c48ce28e85866be264555844a735e0b977c63fdc28b9c81ccf5cbe2cb14caf0c'
            'f1ca30a69ac1d7188cb0e4124c2db3ab848119665926232cc36456b1db47240e'
            '31796c91eb8ff88f14517f7bd04878b7061101f0fa7c60b1358e33517166fab2'
            '72a81623731103b235fae6b03410d45a6c60b5c518c458e3a7a0258f42efadd3'
            '6d0271b559a02dceb46e6bee954dca0f19745fedbb09d7d51a63909680cfe17d'
            'c9019d40582e6ab93e7ff8cdcab7272b4643903b454fd7dee5ac4a0e72882249'
            '6d3f1f2da6e905938ac81292f926aec6e7ee4f95c81b2afd59e717727c5d65c6'
            '543e22372548a7ca9e27e181807d867774a7271f963fb1d88d949e8b5c63ae31'
            '591a02c71ab5c5be07e737a0ff27101d78b17b6ada1502482f941ee14bdafcfc'
            'bf6b6bc16c403bd3fc67af158081b5430d295822d648c6e82a6cae450e03aeaf'
            '01e0f69847af3ef6f72710267b3f3afa514cb9d1b12bd31755ac2a1cf99b520c'
            '614f573f1edf802dd5e120a7fb286ea7ec460f621d0b3c4ff46db3d26cfb5fb1'
            '08c292ad5b60b6284afcd0c4cbdcf47047cde86569e324c1f3a5e5186f00003f'
            'f7546458bfcc3bcf41f63b212c048086c0ba4c857baa21eef9951864e9b0d4c5'
            'c72721b074ab12276f166073038443c00bef9899905bd8513ceec59aee1d29c9'
            'ab917bd0a071c0d2acb975c38fa181143d59db94677ef2e8d494eb2e5c00249e'
            'b60eee5bb8614d9871d579126c834479e268d2c5993ac754aa97a6e4c5fcfb0e'
            '8a4a293ba92bd6bbd1b103024be36e62205f38ee12c31491303cf13700fe6215'
            'f178a94f2f618c0de73c4cd8903cd03410d2ad02ed3ffc9a4ba4d5e3908a64c6'
            '08cfbaff920d533b908da0368831c890511ccefb9dd5399526d8265252e5f7b0'
            '92144f0a0d20a003217822a111eeedc08ee4a0747dbd173d13649446bab80399'
            '8741fbc517383f85dfa8cba2412dd8b01e7ae0d4751f58d9f2b1982748e3a62d'
            'a193ef10f5272863f532198ff58e2b667e09ba55adb580d151e4de5c0f9b7793'
            'cf831a257ae9f04eb5c055abef7e6f9d094af69286a863cfb2b25bcb54aa8801'
            '41cddc68dd37b7ba71a6dbf0ddaa77e3f44468b24179092df624a95373cea5a7'
            'ef9edb1466fccfadfe5d6090179f4cd581d49b90c4902ecb5d35b1b09a8e94df'
            '2b61baca1b2f158dbedc09adcc0e3de1dc5df0882b03970a8b9ef86eca8a86a3'
            'f063752911eae104345d338a519028a3bf52a50b6fc94bd28e58d081a2f2f795'
            '1484b2e85acba366f38fcfe8c161efd18ad48cdcdb8ed8419e108d3351f93a73'
            '5dfab1e35dd2f4542d24ec86658a436837b2af2c803fe131d05f15bd56cdeccc'
            '8c9a87454214842451f00d32a7664503b43f80c67a0b531503161808c425f5e3'
            '3f3864098831ff47775e37edcdf0d992609414c113b3f8b34319c589cfdb061c'
            'faa919ab2c72cca7f91e06a1f37d893e970b78414cd4ce2eb448b0de003db2da'
            '80aaa43f88ddb489530e2240e3b26639f93daeb91595efe96443b601f235ebdc'
            '572a0aed1705f01098ff03a9d488becc0043e6cc8006f799889ce11fd3f94a64'
            'e932aaebb79c50caf7e29c53a9f73f88ab880de23281956fd7bce90a767bd5fa'
            '7a8804dc7a11103488b6590a89c3fe1de9ee6843819582a079f1962261ccc1ce'
            '77eb240f4470fb5e785fb1d55357a9a0f905df6d2ef3a50039c23753b0cb0c61'
            '3fe934b53fc159d4ea534e8872f07e147b8bd90ecc6789b0a6b2a92517123ad2'
            'bf2209486d91950de9a7d4756b5c16988451847dac7de465392261c84d2bc250'
            '2954e97525d5a80339382db82a6f1709036b52b17e0a0af1edcf1ebe7e0e97b7'
            '3ae7b22b46e51ec4edb1fea5c4b798184cdc16b332ebc0ecc8add8e213748f3e'
            'bdddc152cd65eec1d5c4857385ba09e05d7bfb533a486d14619e4990b935ae28'
            '802cfd099a1e0783a450381d033f321ac52595c170c7503884479a45520e773c'
            '42c67b5f791054e315b50f40578c56e7787a6b682f57bf656394c4b31916b757'
            '32b427e0f3d8d0f343f0d098e7eea2e82948e1f6248dbc5a778bf561eb22913e'
            'c4cb839f2f4d7b5a2ada3572bfa08093ce6e845936ae07e6d1d17556ef080074'
            'e0253dd8e26647a32b963b34a9fda6e4223bd94fdb02cb60398fc04383145a0c'
            '832bb77c78bf77cd353411dff073e4cf40a07e4375c8526ef45c48bb2f073fc8'
            '82dfeacd190965108df19c1812878cacd716735716bffb71cc9c26917e95d5af'
            'a4f70f3da8d7064120e2dc63c38e10decae87ee20349eb760ac3f7dd3524bbaf'
            '0c76573a22d2cb11376b8e5d54a76532fccc52b3c885496ce9e39136b5738acf'
            '0c541290bbfc58527d0db503311ce5380f89ff36ae5b74b07af1a223ba63c077'
            'c2edca47114072ef939a1c40c52fb470f843b4af2c1d2ec9e638245e8fecc6b2'
            '266ee0af38e92118bdb3098508b7fecdfb8cc66dadbf70e04ffa4a416e0ca202'
            'e8348bb049dbae9ad4b78be77bb75dfc4fa5cc904c48034d715fb4b550364f32'
            '229e02447b5349ff2319f72aa3b40f3bb07ca50063eea5976d0db23eeb0ad07b'
            '073b9864e7688ed98a70aec1481be83b241ad6313028bb8e878aee320ff72ddb'
            'cd553b9adc129411858d312733ec85e9391aced7e48e13fcf72bad98048f0ade'
            'b7b08a3e0dbbb5383bedafb146790436c7cc7600f58233b176e982b510310fd5')
