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

pkgver=132.0a1.20240920.214904

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

sha256sums=('b793cf6b3a3bfffbc08abc71675a641b21d7e9a72b018111f155944f27a0fdb2'
            '42373814e3a781124aa364261c507e1a2dd35f1e5eda6e51f2ba4dc5211318c9'
            '7e34a13a6a1cffd8e0b10ae1afb4e02dfd9554704beeea16f9d48a421716b7d3'
            'f3e3da496972462d62a9fb6bd2838b0ca42bcde261057741d0993534a36b99db'
            '2fa4b0a8b7dd72fd98500bfc52d015402e23c1518c24922d4de5c6baded26bbd'
            '25205330eb1b37ae52662a329b62cf3b4db08de870bab586fcbad696ff887515'
            'd60518cd4d0b1a2f50812f539cfd2e1c83bdb66da8e2c33f5f142d51fe059fa9'
            'b07039c0b5c158409280936d31701bd8123c64be30b96754d8328716fafd083f'
            '6b131e19be7d7085b2b3344c4edb98e9801b8f365ba45bd6c486bd5d3f70708a'
            '26f2c94de809768045c29074925773c79cfb95a2177ecca41d613141c987ee39'
            'faef1783a92be66bdbbd5e08beae01f884c06d7b7395eebc895c115603381b70'
            '7941feb3bd530d3aa149380e8ce5d49154484e231353bcad5d0ffdacaf447795'
            '6adc128184d06aef33fdd3bb7653d837f52d10a42318dc3752445a1df346f2bf'
            '797f709421557779af49cda276f955e5606f6e310d3672fec828de14a6255904'
            'b4804dd440964cfb49981c59b7f71e39130937d8b0b0bbe51d6cf41c1a7c6263'
            '088ee44fbeb2502677c3d071c6e668a2492fc61f6f369c1e9e5510d1590e7e5a'
            '568f58536bd7c0f0e5c61c6c5cb94cec17d27493545795f8af1dc0de571178d8'
            'cbec1a5761764e95807c55f6a7eb39522c127aa670ed833f681de17e83a259fb'
            '2bdcb16ae2e9301cf6f2bffee63a00df1419a2178c03daa6dbd843c051c8b5c8'
            '6b878e340a9ed0896a2ff2807d544e052cb92a93d80fc4054a8f36b20fa081c1'
            'f81ceea1526c01def80725a3b42928167ea1b7ee422c6133be18ca5ed9ae5543'
            '60c29b9df03c7dadfe486eeace9a32689086aee5299f0aff9ddcce075a011b10'
            '5e1a8e30b4f6de323843942a17fd304e9fddeb21ab30d847a82097238bb41aee'
            'e87bfb58f8875460f2bf054639dab91257cf1878686ac0fb0058f19990e21afa'
            '9fb18db336809204719ad3d050bcc43596faae0f80cf9e9cbd5bd7a5fcb9f277'
            '96e65f871d9a45dbcbee83d46311fe934b0ea0d366bb2321af435dca5c30a709'
            '7b581c0718d341e07067fc85ff032a04316a1de11a28fb7892dd32c49c7760bf'
            '774c0618a3a1c5a65c6e9c495b5464149121a3f6698ea5526057fde94e42e7e3'
            '43b408653e3ae6ad87a88e8f669f28f47c23dc72d83296a4a722538c4bc3a7eb'
            '51e76aafacbd566e55d9c61b49db685481829d2055e0a0f6d8eeb8789ffc70e6'
            '9816689463233b455bcda7833618835587a965199317fa545d72add01ecc4a91'
            '10f53bc9106b2f205063675a8818595aa29df98b598ceef563528e49a5f91c61'
            '4d032592fa4239b7dc8779c5a97b051b1482ad91952234fa3fa06cd5469c36f8'
            'f8b15d31292a20d10765fb2f8f08d9fcdbb78477ac2aea8b7a0eba9c761c52ac'
            '6fdd53547fbc7e4724b51e5bb0973abb248e619fb710cf3e0b8ffa30d596fcaf'
            '13649b92fe92e13f6bdd2c5bcaad18941519c1c8dbfb4bbe4c8f3f3f072ec96d'
            '3713036082737c79f9191a278c9c222a21dfac1e58ce560e4908fa7286e68035'
            '5f2b950415c5259ce8e7b82415f64ce6f748c4b8bae02229c314a608db6d417e'
            'b4bb85c9dc931dd4e468eb7eddec4c76518a03597f108341325b0dd8fbcb3158'
            'e101106f6b8857a6f7c6c88e37a4e084ee1e939aec364b275f78ff75d2447d6a'
            '123c695a42ec933fdfe1798da7bf2b53626fea81b5c5908fdf624e6912757996'
            'f7eab5fdd447c5cc6f0114206ab6307d6e291412f6aa5413b52e521265982220'
            '9cf3a62cba9ea8eb9646c53f016c919f321bc34e2fe5f8cac4cb47e82cfcdc9e'
            'a89c96284ad1eeabcb675a27a3da3b6fea5ebe4c0754cb8c77852f977f161cfa'
            '2ae07725c45dc56ede80d8183e752dd58bc47e33660dd3a2c70460621c9d5133'
            '42a04ba3531df3c059ad01c0a8ff1872d9a61dd3ae070821ccc58b503e2032a8'
            '62b1a8d532a8b0af4bd8ecea3022577c303cbc82f2c7e20a1bb1a6a517d0aa24'
            'b2d9574942d922f5740f45ade4be169f86605f388e66bf83bad8fe2da9380ea5'
            '390ae72734779768b94e5405c023545e3900a703e2cf1e61c3a2b5a7b50775ea'
            '934d1edbd752835ccad48dbd504e910b2c987a19bcbe1cbb4d0edee9d69502ce'
            'd1476efb0c3e8a4909e31d80d7f883eba69305e40fd91cd0953a311d7a556891'
            'e2ff36d9c4b24b764b70943e7685e188c40209f4dcb1f2f7efccdac520d52895'
            'b7e6419ca4e8a7b073fe22b0b77fb78a26ce4b6ab5c4b5bf97facbb0d40c6a1d'
            'c4883bf824a4b2ece00b6190f3e9fbf9fc21e4e50852df18b36e18e86f8b3acc'
            'e720105bf0b4ff518f77dda907ee9f107ff62e41c5c7fbdac87759ff38d8b57f'
            '78ea54846f0d9b909b4b7676b269ca66195752c8632e40403377c33eaf6ec4cc'
            '3021567a414a2a8b074dc952148b1fb342413837f6e441ca2b557e27fe9fb94b'
            '116fc52e1c89c59a3053f34810566f993d097b7359e5f7ecb2d80e69dce4e6ac'
            'e19564c5216fec7ac00d8f69e88c9b619fb32693a3a5e41167915e02618d2efc'
            '5ede622ab8ac3c75aa2d3d13f3c4eff01180294fc863b0a8eb05ad8ed5c49ca1'
            '012dfb3159de769d80dfedb202dec681695f51b74faf0857be8b7d53da41e2f8'
            '72a7a3475760cd7e76e8fde8bace68f33750a6fb5eb1e3e1c95473a0673c3100'
            'db4c6d76d46bbed1b1a44fbd1e7b39a6df2c94ebb90efbabaaac8a58b20c004f'
            '244c5911bcb7cebbabe1f62b692bdda4503d5fd24191346527ccad0d5836409b'
            '4972d44d798bc721c1e863b604c598f6d0925f1a2a9d82b517892615fb895d97'
            '59209c791e4999d918c2d4823e81dcd6e727249a5a7a4e2f370dbfaa0fbbf92e'
            '6fc67e3ebf1aa65903770c42e487fe34008af36465e1ba21749881181944a647'
            '31376e3c38080afc177d10e547a8da5cf9979f804e2c67635f0bbba5509940b4'
            '3db3451e2fea56397786ffb5148deadb3042b44554d9872bf0901e0d014b84c0'
            '26ad12b1a81b36dd8bf32af1ad98164da35ceed3133c908a05bfd652c7d8a063'
            'd77e4fee2eca72f95d6c94b6826ec07810058d3f816267d6c65e2e68d5b56727'
            '75642498641c7366216d8f1236de1bfb9d4227406aa6b56bba6637b2cf588c45'
            '2d530fe4b019bc09fa038bf265bfcf8c3c36a05a6d86496901652cc96d1156c1'
            '0070dfa5bd5a9f7719dabb99021a98acd11d4120a74622181773f9c3ee08f712'
            'a239a5ed82dbd754ffdcd34be66864d87721dab0188af04b7efd82bc210e9581'
            '94fdb579532a0690cd3fb0ae9741b8f2d89bea4811c208b87b4695b96a776a57'
            '13e60f8a33bbc78bbe37e88c7e10ff1dca78a0004057a461fd698da962d10f43'
            '88f3e216fac9938ad8d3b5183df3d4ebac5c1823f2e475ddf63f75644f33b09b'
            '716b323f5e00515cb4accae4b10485aaa5ab007729904346233a593dd490f0fa'
            '5f4000ee84a8407a3fb7117732820e196df58be76e7a34e0900f6d0dd4546a62'
            '1583c3f7c6460b8fee0fd29331077db9f22a5b1e39ecb7e4e4ff53f3456bf98a'
            'ea66f1c326cc407141df5d0b16d43f9a5b6bde4d721e87db3b3ad9131f2eace3'
            '49da609f4dee474d92369020b799374ac31e11ee7a1e52d4abfe7dc0db9404c8'
            '79b47c10fbf0ad04c67134195a77a5a4ae9641694f3a2f2f09f53fc80d2b99bb'
            'c20896019520266527152e30ee12f85cb0e6a5c9d2a5fefa238ab1a7562f3c8f'
            '37a9bdf0a788b202b7475843f3cc3d10f88b6b2986a425a048b9cd295d1e2a07'
            'e3cff21670788e5f04da1cd22c6537afb3e62c8067560415848b2de9865ff9a0'
            'bb5e3afb3aef682e8fb4d8a16fdc80e52ff2c3a2569401d3a76c8805286ed66f'
            'caae1722613bcf61305d896c729ec8b1c629f6f9c78e5f065941fb1a09d76290'
            '7c2fc5bd5ca74acbb635205e7bbd53512d143dba62a7195c3bd934ae40d30e72'
            '235ea6a41a30881a8d66bd3a7c39921dac0ea9972d37f026e255a5432af0cec8'
            '45fba0c7333754d92ffa5192e70c758f83f676236ec1801781d96db46c672bd4'
            '1ef676f6751584e6847e2c5d8759c6bd51537174c774e11d755133f61debbab9'
            'a6b8f6d0b30c6c792fc354dfcdb54054139e2cde1b438ac3a198e68a2e7208d2'
            '88d6384fb0ff207c6075a8f2a7513b1110d007485d380fa4af9a26c91e119c05')
