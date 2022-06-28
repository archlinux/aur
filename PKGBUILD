# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=103.0a1
pkgver=103.0a1.20220604213903+h490469b53dbe
pkgrel=3
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

sha256sums=('a1e26377d856e930c66b19fd2f99175d9512263a9f224ae291981c1e59d7592c'
            '2bccc1ad82f05f281e2ee6e53ff00ed77534d972cfed369acfdc8a14deb3c4d2'
            '383798bdd025c15bbe10f2ac041bca5791840c4896d169e671443213dc18fe3d'
            'c5b3c0da9cb049fc2979750772b195ab671a71687c07c324591db9518889bf5e'
            '60b62e7bc611ce9fcac1659948b4ec7aac131c29b31398003816b8d4f00e040a'
            '8e1d1befc0fd7a9c949de2e74861f7e77dcfac8197a3a8fbcfeb445424545391'
            'ab2230912756c4bb6c5d3b3880699e935de11befc1b0335395d943f519a29505'
            'fbc15b29129bac1eef760545323a2d6d5032ba2060d9c58bcea01d76b05e9fb2'
            'c6f57682fc84794607cf899f6e1d849537c85226052b7b37d91cd17e466deba1'
            'b3a3e112a34245cf5d6251c9eab376fadae516d1274d528c48c743bf118a7f48'
            'c378fb0028856014a8c600e1bb41d92134270fb02958d6935811d60b86535549'
            'b8debbdc2d3805c6c80281dd2a0e67bacd27894be75c1d9b4d63636e3446a1a3'
            '611e8a60cae29d8d5bb8859fac419c447e5f93ff0f8f8d07d368239206ad8641'
            'decf14ea7f3ca7822c22d8c0d96694bc29ac20da42a05d33abb220b9d11cb8ca'
            '6a5b0cf5aaecec51fc2f258472260d19db2bad157c2be2bfe6a381853b0933c8'
            'df6927d122bfeb94ca0856e249568c2548c1bb3afd91973080a11c3dc681cd64'
            '7d870a98ae7ea58a69d6bb0c21fb905197c374efc5bde46751d83fa43e9abf05'
            '345c2996eba9f2deb9d1e79ba965e8064ffb20b8ab4cf5b2ea7b377e6e31e270'
            'af30612a723e1e3d635c768698df5ce25471200dfef08a99ee599b6164c82d27'
            'aadab51f560fb730e68106ef6996db77c52a46fd855ce79d13f3d69df8faf7bf'
            'be200307169e7750f7727ec3556994a03e5f4d6d0a9c84143f8d1422575faee9'
            '151db9ec9cbfd3c2f7a3272996072638bcbfaed31400451c761d13f592b632e2'
            'ab3111ec61ace2385e8f30f45b6f713c0847b30d19b0a233f684d83a5ea0af54'
            '6ddb9c05ce8bb5b829ccaae0309d10ae06e34cfbf7fcbb21edeb31bc4d32a0be'
            '81f2330d4bd6a42eff11185737a4da3cf782068ece99f34f9a6f0e87a153c53c'
            '99ab07f928f4f5d55c3f26ff0eb6ab4963ff1942d84d368ab56c663e04a87cb9'
            'a120e7411bc6abc5c0250ee5e076ee10a1baca42febfc636d72b23ab82087a7b'
            'a2d4bf51fbfb2c8d52e8cee6dd46e8bbaca51ffe7c7175fcd5f3e8690ec1d5f7'
            '0c64bd812f730b86fd0258508c2719f39045bc24549b1a78c17f6e0f399362cc'
            '509494b9fbee6f1711069e49c53c5c72f80d0f2f259e18d0de1ed152210f3e28'
            'beb57d2bb38edc20f7b1249d8e4ee979bf9df0b828c6d5dd0d4a82e33b802d75'
            'e8dcccb5eccece836bc3c7107320afed8b2c59463c1ecdc154de318c146b89b2'
            'b26e142582e67ce0ee791594f7bd33d0b0dc8272999c4a3352ead479ceac365c'
            '1db3c856ac2f5d07ec3c0ebd36ccc49bd36e12c3dc7a160566fa219387732f5c'
            '1134f4e8e8c09552f489cecccb986053c53928f0cc7374bf0602e24bd4c15561'
            '16ea8b14d069a6daab994adfdbe73df971f60b63d0be6487dce683f76c07c4e2'
            '413b337a10a07747c76634f8225cd8fb43542ab050c49a5d23737d6f582b3d31'
            'ac30ba88795f6f14486b734d52db8e8ab443940a69fe16c6f0aa4f92a7ce099e'
            '163959ef740b9721ef26afd11c1fbaedc5f160a009123bf1554abac5e22d425f'
            'ddc381a984a36c1a10ae7b755521d366399f6fdfcdaf49c6364c1663622f6b20'
            'ed64623b6895a2337da040161993cab1cded9d4dc0cc5bf9bf8d6a579d183132'
            '44251914d2acbe88f5b510ec86082ebf86f7a0ddc0db1b757fd92907ba55cb80'
            '528e6574c5dabe40d8e20bb2057f48a8ac6e6132e9f54fcb2d665ee99ca3c26d'
            'b4ebea6d232ecaf30f6d9ca3f91acc4f45b24a09afeae438da8732a548bc1cb8'
            'b316393935782d78c1f4cd6900213adcad00955c44e5d5d96f883aa1b5101a20'
            'ccad3431e21984516b53114c3a44435015fd77196819c07f92f9767e37052e10'
            '9e05c4628d2c63c926569c5c7fec290c5ce510fb2391a18563ecfcbac9ba3184'
            '20a43d585b5f86b008b48398dbc1f6c231de6d571c785ed3d14fc548886bd308'
            '1dbb66c2f132451f7506042225ed8ec990eb64b9e5f8c6e8b4dec494e2d7449a'
            'c4ebd6814489ea73af3c6812d17db613848acaf8d27a41651f32b80480ccdb45'
            '1d143aab010e5647fad55efb09f9901ad32e37345cca106ebee409049b3a5419'
            'febd33a956bb5a928573def3daaa7add6b7412adc703c240e0c4917757bcdf14'
            'aea1ee34d05b179fc96d319c6ddc1c32eb272f91f564db92d4fe21618c25cf43'
            'e6486f73c0e0f2e8af1e615b50dfa7380d8fc64daca010a7825d65c438d934fe'
            '34acdc8d878235e7b9d42e7520a8d99ac760b243e7d635065b5866a4c8f0fb9b'
            '0756f97e13af1141ea3df540ceaa1974d60a1cb70433f406229c9bb5ec93f608'
            'ec345fd40e6c6d4e962e9138c6627e5f152bea5f578f7561159f778a9e3016b2'
            '504b542a97309f29dee9e57ba85c11a5170cb2a24b97b7ddcc495cd6630cfde4'
            '7ff41849b765531446fa4c1810a5b55ab47117f8ca9c005d2be9219b65024c20'
            'bb1852d9c8a034afd6ffda6bfb34f02a44b0e73a9addb2250a2850c5a5c97c11'
            'e07bd7bdbc138f17d49b09c7836b68d185d7ae6e85b576690ee2409b56b3f67c'
            '0a7a526553d058fa225f5352faa400ad33c7c2ffa89eaed4e50080ec38815488'
            'c22f98f3df05f4e8139e60347adb8d59026769d69fc45efd24c4d1ed9388bf4b'
            '897add4bba3484cef0b63ffcd4753cc2dc58b919351b5ab13d706b19b245088e'
            '3a31cbbbd5832c2ec1d575c6d4f53f33ce9bbd0ea7df91ffe8e66648bb7cb2e3'
            '0e7f5de4da7ae8f3ecd9bc89131b5ea98d1905bc580f982c61a130b230881cfc'
            '12b6a6357b9449e4aee4a01eca13bd24eab5a0fa1b6b14459d903f838e1a13bc'
            '7662f5865d661a46c2f0779d134185460d35890f1e8c5f73dda088f83fe02351'
            '184582e7bd4196d699dc47200a696f1738fe4324ea2767400e703aa146780fb6'
            'e50990e6ed3713590e0a1d0c76d8536a5d4c3b948d7c035f1ce0101f922b9aae'
            '6d4e2326927ddd7cd3d0e6fdb66874334f908c41636077013e1e72395a13095d'
            '082c1bf4510d434f0bf6384c7192b1525b4d2e4de6fcd933e3885ee826ba892d'
            '891d1e148dba7b7c61e55f75adedcd2c6e132f43cc5a04399a03583a53df2c6b'
            '5366304823ec4d9ceacde0166f8eb8ad954b0ddb1dd03e320a454d8ad127b233'
            '14a4da086a10722a0008b76c1248dd13a47fce358d91ee1acb49c8a4fe2bb31e'
            '766c9b8f7d0493540c7edd960ce028ab39e9b6bc9dc53539c87e6c46d194aba8'
            'ddae4a6ed562a6fb3e7dbe381ab0ef7f8ba468d5d6f5b37a3b0b430fd118efa4'
            'e098f3ec1add271d03c2529302f73325f0c040035a73d00427151bbe6ef3bc69'
            '06bcb40888e38967f7e3a0092daf140db397ea1e2d2eb7b50c1fad8c663a205d'
            '5ac8bbcc04c4a2a4595520d45de1c66be3c8d73db39a4eae019148a77f5d44f4'
            '47018c7a7c6b4808fa413af15f8efb3ce1c294f93c0e62e6066526fcfacbf026'
            'e8567841d9be9076bc295b9108f14b6d230ffa2c3063d6df4d17b0fe201ba0b7'
            'be0cce00823d52b8812c50c79134d8932f91f4d7de7afb9b66ffe3af575967cc'
            'e1776a107c76bbc9e051b4f48a160360101c0d5f669116abd7c9394c401330a7'
            'b303ff7cb4b0e42e2597f3ce4c0797bac90c062a6c4ff59567189fd44225b87e'
            'cbfe7d5330badcb4dbcab639a2327879d84e4762b0a258d92f83909fd02fc91b'
            '61470dcf9876edce59a06faac1e64a3ee3eee32e0bd0d80cd5525da084e84fe5'
            '464307f71148f46ac73fdeb79d1e0ff0ea5a3a67262086f7f4c1566d47c07ab0'
            '0dd9c4d5b52fb06e7386b7d2579d85cd8388aa38a6d7fe8fc786db204ff533d3'
            '84205d1407743e9f336a9f7c9727acbd98f5db211081cab6264dccf3f972a848'
            'e9556a4672113dbac0ec07088ea8d011ab6aaaec27441f309ed6cabcd4d2289e'
            '4c2513abe0561f77cff2ec96b6dfaa5c43c8968c6d6c838d11e595c994bc40ae'
            'd11434ce126311e891896e951a5c4cc3ba9004f33656692e60a4fc1bd740d214'
            'ebb11f9a5ef718855363d4f8cb94662c2dd0cb5bba0ff92431f96f064e054ea7'
            'b9bc4c054674db5003f8a0bd19b7782da176ac6c2a0814b27cea9d7b52fdec2e')
