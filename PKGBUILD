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

pkgver=132.0a1.20240921.091547

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

sha256sums=('5abc1a81a01b8a0846491745e9c42e9cdbc24aa86fea40b20c429faf13b0a0c0'
            '771fd74b45482f45f8ebea99cc7c6e90ef725b5ae87f403f6b45adab4cde3a80'
            '73e5e4428395cb0e3380d193ab533f955d1ea36d6a5afa58796b0e30cfa71b0f'
            '8128b25ed7c237dc80c2ea6ac7acf877fd4c9d9bd759149307f3de58668b713e'
            '31dfa2824fc0a25bf422e8597db7bc5a60e5093c5ac8949bef5532289d645dcd'
            '27eb7eb7140b3df1b8b292a131e2ccf3e5a0f641c6c9d7104d53e075111076de'
            '222ed40bf83995659ad94e0a24c47c12baaf488791e8cdb419ae72ee0a8d8515'
            'f68012870ee57004c88cd54dc7723144d1dd18149f0e9be1466734e07dc06a5e'
            'ef76447f567b79ffdeb3285254e4fd712cbb44732245dfca59dc67b8ad6bca35'
            '6a513c3ee61e693cf207b351e8989a88af61b9d9ddffc4f782a1cd0b0e5bf6c4'
            'aaab012cfbcccd8cdd4383cc5b2e894a0074e6d6646f8c2b0e250fad5b38167c'
            'd15dee5af7b849f174ce685802967e1ec52d4e4c37570349e5e2653e33d23059'
            'c36c5ad8a594c884a4f4f76e02520024ed1114ede463aeed3111604104ff2a6d'
            '3ab9d2a7f6b3c0b2ed0766fdc4e50583067475ae57e6038313a11ef5c30aca40'
            '3e2a3716917d2d2e1cb08fd09ab63bb6ed2f6409f6b4939d89d5bfd2952b304a'
            '34b7b834427af66ea02f98e762cbc887ba987a0abcbf5220d7f28639af194204'
            'aa9021efc5e2365f92ed533be8e77826733ff1def531042cd2527929eaed0eb9'
            '1396c2dfe47e30b02b5ab9a57b0a369aec5ced215b622864f2d673afe4614ee2'
            'cf34f7f9a0abd5456b9b03d824619604288f01dfbe0965bc34545c655126b100'
            'c4a912cbdfb8a78176efc783e9dcbffea57f6fd61ecf63880820300222de4237'
            '6e8f8d48daa50eadf34fc59e295590027a1e0f9c9ceb945c1f9b715bb297aa67'
            '9dbec51a391d35ef79876064c69767d60b655318660140182893ffd02a962652'
            'eb2d6a0c6c909ad696ca46b40aa567b1aefd0393e2b2ec502b32ec1c2dab5870'
            'cbbd9a1acad4b66bb0b0000e0ea6fb4fbc1c14283bc4ff35ec43bc976985ca6b'
            '84d5815cf4768d36eacf8912a890cb5f711b0a51e9d4e1aa83bedec61263498f'
            'b974c4392616d6186d24e167552883bf1124ef857a278a4db471321648fefb42'
            '9b3382bebf31f6790487c4e9ebacd249fcaaea2d2035d4c141e5dabff7fdcaab'
            'c5dbec9546067d2d4a60d6799e79411db7e5b9bd4d8427e052d2b6bc02b3fb1d'
            'b2482b93319263f18c4ae93023430bf830aaaadb20c6f7d82dfeed21e2d3b8e2'
            '4db9074e3d9a444a978179910b288188fdca3f49f92b8b232254f96bf1d1cf6b'
            'eb4237ab2582739927ac14853cc1ff19fbf432507e63643f8df1005d4880b929'
            '0389877e12b6029c27e6d4e20d38e2ae53fd2f7190d9ce2ba362497f9c163341'
            '054953ffc69894b252c022a4cd8d7cd163f584c3fbd3454ebcee2d55f68347d7'
            '55e7b5c2934a1798041d032dc890ca82c676b9e7c0e7cb9f048e607bb31f41dc'
            'd253f3131e08d0c9f7c356704b10b0d7c624ef74453202dee12e0ef7cb5eeafd'
            '491e3a3fd88ff812cb4b2d6543b543d5637091acbcc9d47e5f8a7711f4681116'
            '6b7484b4bd2312732bb176d30f6acae3e916c9728ed0e6f09ca0f7ceafbdbbf6'
            'd69d5b293aed6ca665055308998d95a412c469555f21574a53c93af3f5612c9c'
            '72246b8b089a831f0d2ebde2a5439b8764f03db894eed22abe2aaab35042065b'
            '36471c54118f96444ba1af53190005c42a47a0c02fc634f4e28c2c88084fb3e2'
            'aa0dc99d81ff3ab8c3164693fa38c5b48630f91b9734739321a05ed1aa88508f'
            '930c7c71fb6b0c0d47e597d771c848ee80f4934567f2b07c75120c47c55f7b00'
            'e20f1966f28fb6c6a319f3d8a7540d81ec0c742ee9fdb5f7811f6cd7e72057f5'
            '702d2ce65eb2e7543de42d90824720c588873bcbec904790fe0f459400d8165a'
            '5c456cdd269b94bae1df639b78e0ffe9beea7cf81d0b02ce420ed1a97808c092'
            '9d279a76faebc5091573287c86527933b33757243d4014c6633a307a50a5c129'
            '1d789206470c637a5733585fa33be7f62f8b2802b6e75ff37dfab9204040fb26'
            '7661628dbe14359f93a5b42c98a2ba7e73809fa415273c5b9a5d1148f5dcf277'
            '06c033f77365f58ebb3603882da9a5e7f0a596396eafb5047bec27decda74bd1'
            'fe9e4126be5f45240d37bce7dbd6cff78024708ab7a3e5d9136dc87ddc743abe'
            '3950bcc3b42825c89c13a705ec918cc6e2fb6a439cec05effd5754d06be5289b'
            '86d7b06d27b75240dd62ca42b4eafe0d1efb61766768296954dd170f4e80e647'
            '7dee105fde9c2ec65b892dc43b2715f5a30b0e4b7d52b9b2d7f6bd30a20b8516'
            'a8ce90cff4f90f8f4dac0ab4b50f7ac49d1d3d228826d0dc3af8391150776675'
            'fcbd3d4643507ce9b3e1c14de637b04633ead94bba731acc6fac93c5cb5b8c4c'
            'e2bf8f41a009ad13e685324a0664b10dc2ce9296380fb49e42262c6e1547637d'
            'e42151cc5fa760f483918221c894b4897d14d08821f9615acd0accfe608b0b75'
            '63345668f111e367fcb7e9f095f4662238baca3fbb773105d3ad9871b4cfe424'
            '2c85ef77e2006dee9fe2223e31d3face1277770c2d31ec13a4224dae62d198ad'
            'abaf3d6295555231eb60be378d27cebdd68b01947dba2ec97bc2496519fa700d'
            'af18c1191099dfce979e08033807931473b01c2a20dde0ae749b1a0d54c60d4a'
            '9945a519ed13c319530685e20dd96dddd07e986cb53a5ff799df88c07946d8dd'
            '6d98a57cfd99823d2fa92405fa143112c3cb87ece06b2c634d8b0f7a3ed72c02'
            '05de8f4cea2ac0264e0872a25ffff077fcbd7e252de9742d39a5ff6fe5e6ea46'
            '768f0c60a4d5f805aafecacb37e8ade721569ac6fc613177dcf53720f4fdb016'
            '112ba6de4f1c63cbd3abeff61995667032648d836c69a54be357d7206c0cfb0f'
            '66070d0349566c8f0d78f73f42a3fecb0ca8c83ec117049c63ab4da386019f70'
            'a46dc192e88594ce85bd7afdd2e986c075d239f87dec601bd61a550ba91a0145'
            '806d16e2703ce68d303e3bac691e068fffce0fd33c1ad3be9f0296bf96f3a3d9'
            'e3cf6e6afa76d1cadb7736e84136ea4d5eecfd465312fd1520a3ec2ca11fa522'
            'e269a39cb386d5fba3a2595523a7a9b441503e381ec214eb8f303f6aa86523f1'
            'b377e18bca3d01622b063e0f1c1dce25dd82ada3cdc3cd1561b7cc004de269fc'
            'da18bac23919ca683728648e99e59999c448f412dc611b1ebe512748084a7d92'
            '317f63984eef8a7def639e2d168eb48c6b08a3b0f9264cad02671366f842aa3a'
            '250ae97a9379a334957e4fd9ca6bb538f1ed1532fd134ad908dc9d0b687c24fe'
            '306c81b3734560e06c8226af8dd0209d68df67fd8ffd1c3021c34fa7e5379fe6'
            '39c528bf16ff22aa4f1896c78b094f5412d665c41c79fec7c617c157b4d78576'
            'e5754156294667af855ba4045d7261a2ddb8c6f0e6fd4cdb56fb8f39d969b56b'
            'd104592e315253a45c6f17060036f874b2c00f439c4d2ef11583a80cd7b69f0e'
            'e212ce1e347ff3f36031d9bbf2cb8a031a4d408fedd153c5cde5888d108506d1'
            '2cd5aee2fca66e352ab6d87259692a0be862c14c30d2724f7cd7d7ba1594cd4b'
            '70d109eab5c08a126b9da830238ab7e1ad8a7a6886b34dd47e952d42a756304e'
            '8f779bb12f97b7bba16b59ca15eefb7e74d7955f1dc25b3a98bc35f348751b50'
            '96a5ad43056c68f254a9ae1fcc5267a5f087a8a9bda1a2e4273fe679c8e0f4eb'
            'c11d38642f594c003ad183f60ef1b6f74b909c5eb6d58551284c50277e036ea7'
            '73a1f42512c02408e96f4040b1ce527b303f74f29a96dc3abdcc26a08d493aca'
            '0b75cf3fe7cfe10764bf2c67f0ae7b448fc80df37e5f86993feba87445b12b10'
            '3eef251699c5b590b73161c06eed9a3d04bcff0c64b31fee766a956d6c555e1b'
            '5dd73051800f2728be59c068bd3d8443fcd57e5d522ea4df8f3a83d3b6a46505'
            '21aa6779704064f8dd974d8a5444537389f85f2d5408487dc1a0aea986741bfe'
            'fedbb25ecda5a2ba8397ec5af5889515f09410aa9be0ac1f520c1e1d0595bb61'
            '9025cae937d75e39f40f974d0c88a46f4b5933232ef658bf8e3283240a1a10e3'
            '5955dadf74059141320a380e83d8711e3424d7153bd7e3e51b2927afc14134e8'
            '27820b0714ec883172cda8ff69467fb406eeac73bfe94d1c1c2662edc3f6af0a'
            '3e9fd84bb8a525aef590609057bfb0372895175e45abe5c9a99bc17f5c7beccb')
