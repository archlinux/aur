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

pkgver=132.0a1.20240924.094722

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

sha256sums=('1c6d757cdd0da0019d87f12d7a2d80446d9db71914ed621dabd6f9c5578531c9'
            'd25eb8ba05d51ba3bb4a294b59ac528a6ef44353b14e24c4bbda1c5410c9a577'
            'ebacf65790d547e39ede9b2cd90a81747c2d8b63a34f40af01c9934240ba2300'
            '77116483fc238df4b596091b8bde127a83f04dc519f6d69faab28e334d386fbf'
            'f1c6c80a2d3592be60b8991b904d73e220d92675495e66d1850526b1a8f6d0a2'
            'fc63c10a47601f946c32a315ef63360c29c7bb848a7acb604473dfca943215b1'
            'a0c2d49cd87cec49dbe7bfd7c982e4f2f85d87dba8dc85cfa9274a66c1019aac'
            '2b5fe2b04d26fe3383c05fb2639eca51feaaaa6a4cfebbf34114a922173b2e2c'
            'c6eba5a9034b2b6ebeac4f8bb6ba58569bb3c9081a0d86c6e4d92078959aba6a'
            '17adb8e48e7efddf6d4a69c70bfd7de1832accf5e3d5c06faf1d390490a952df'
            '19ed50c559533d79714e2cbe1370e2edf133869ded2ed9b8b02fbf547e9f3d8b'
            'd0a77c1e60216155b3e96a2afeb63b806ba6822f1dca0344312ffb075afa276c'
            '63abab466275c9689b988cc2caefcdfa25e91c9482ba792a14f6961a1bcf88af'
            '1f11c4bd07421ca973553d7c8bcceba42dd211d8e0d91d8c32444231bebb1f8d'
            '1691a76fb778d307c873eb516245f84de868c9b9e0c3827c6d7a3ad8ecf22b38'
            '92ca83b20d89a95b22a52473dd0cfc7ab56f39557e5a8d0c3806d92faec9baec'
            '0efb7a33b8cfa6a4fa7bdb598d76cf87e0662a570f0b2c8cd7472aa4d0693ae2'
            '5c2d9f437c87f7c5545f30d5f645249857c080b1e53f158df7246976408d09c3'
            'e4be6a379c5aefad670d6a17c17849c1ab3194f0cced0ea2c8dabb2e1e720276'
            '5e2d02075ff7e6285d71fe13b94f002755178c1735b4c5ad38a2af77f6b7fe96'
            '5c02a972346c8dfc0defb5c44e37dc521a6e9e5307dc071129779ab74981ff87'
            'c06fc6fcff71f0d6b77c20c51617d545bc8fd788d9a2035215c77aedb792a877'
            '026228a2c6872db6e17c39f821728856a59a2ccc30f4fd42ce9437911cb9fbaa'
            '13bcf4be47ba6f484eb6b479ebdc867f83d23f55697acd60297c47c705954588'
            '0f8a8b3e92ed5191673856b4e27fc9183326def8dc54138a661dca5b7848a74b'
            '914c91764a6fde2bdfbcc9bc38e48ed5a2ea909c331363039d4beeafa072b732'
            'b4dce42afe41e1cf32095fca680056ce5dfc6267158a72187e876d699b4df94d'
            '9edb7af59dd428b65f0b039b1253b4eaad17f297a5e6a59a2e5dae38a6dd49e9'
            'b6a975a9403edd4d9ab29068077d0bb149139b28524a4471aea2ed5390665a8c'
            '1138afd4445707d1dd1688dbc392d85c4b15401474e44d377116d38a6fa2b2c4'
            '84ff62137b0969e22fa0335ac7da141855495cf0240de3db301b10bc058f5f60'
            '92a80641abb8fba5d175ae639bfe41157fd1bb1b76dfa619e2fccff78af04fed'
            'f68eea15d3a43170d42c8020102fdc6074d97cc41458578dbbf9d9f2534ab99f'
            '7be06744dca9360fc4975c30683fb2edfeda25b1a6d62ab7d3eac729b77a1a44'
            '04c69384667302ce7de26e35a67994492b621e638adb2ed6f76d29a12db0dfdb'
            '67a1f1d2e20fae57cea4bdc44e2989f493c9d78e3cff138488780b93009cbfea'
            'c1861f55de2207c6ef4c3128dcad3244c029f83f6a3c482cc7ffbcc724b317a2'
            '2266fc5d1d5069582f5697f93774d60b2046d9e0a4db26f1631527d466f709cf'
            '78a8305059d4d63e7c82bfc4680bbb74b8cae476a2fbc72bb17ad3538964fc1b'
            '52319bce1c1369a3f9e555bf0bcaf28768e67ae27e1977c301c2df2ecd0d1114'
            '0b0ef97b012235d6cf28f9ebd1e7db3b0b3e7c12d00f2b6af67734eb5e08b067'
            'be7139d2cc7c3b254a62f4be1b316c71a2b50ff298228db0caabbd6f352ab44f'
            '43445425e2e47da7a86a8a639971326f7d8a97633aa593f673dfcc1089e20e3a'
            'bf3120ca0daac7889f3deb5ce372070e443e0e55b0e637584610153a8b20a47e'
            'ac29f911204e300f78a9b3f2f2eaaab51bc7bf6414de5513619e9e34a7b2ee54'
            'a6ebf07e594e36ced82a5553286c407c1e03151e10ffaf3d83dcf30527abd3b9'
            'b8139756df9d0ee55736666b4b90ade590170ed5fde4f67ce5fb678d9870a0bc'
            'ba9bfc6d965fea4ca62fe6b707c10384d3484296126ff93fb552c037851ed43c'
            '94abcbb2d383a3304241819030c6323c64a6f40e59c320686a343b1dee24d2f7'
            '3c859d4c799f5325bdbd64017d0338ed221e3fea8bc9c547ed28b7df42d04713'
            'b2d52f2e9b3fdc7487f738911a2f8b9c33d46322ae18a21857d339c62b4c8537'
            '364ab8385f2f4db196fca296aa5919246bfc6eeb85b25cb0d3cde501026e750e'
            '988654a1d266f40a9ea8d6533d4b253ca536a92ea64e9291d2e5ba204b16d73d'
            '38993cfa312f83c0171db6c26cd0b52416a71ed3d84149f1ecc72fdff1ef1a8c'
            '8f1e43ad137b504d4412de0fcdd0c1d45328409ec1f703a27b7b12b36faf49e9'
            'd3d8b1e4031cb46cc6e58d4ede0099a0080affac20108a146d48dac52d4288a0'
            'aaba7c4fe2742127d63e16fea7440746e93ccb4dbeb34c9d94ce7bc87aba8796'
            '8a594e704f4441a6c28071a4e68bc258916661634f334212cc3c1b0a0a77de21'
            'ed6cc0f9264769d387211d38d967aa6f493fbf93fe2214e5674cec872611c4c3'
            'aeac15974dacdb613ff629dcf6d0efb4e524922959d57ff422db49f6411a4d7f'
            'cea0a89e97ee239bf28188bee78fce3bfe05d08c4683a0a6adad1ca1aaf390d3'
            '5b0f269abc1adf30b08b25f765cfb199b28fbbe494d4c57e74f574a2068ea62e'
            '0fd1f2661fd7e13fddccaa19484834ef9b707f019ad4e5d777c6db793fcd59bf'
            '87f9f1e339cb12ceb8b0f8b626147b927413ac27eedb6d1fb3dd71a8b73d6fef'
            'f4f4a7b12bd8f5406f1ebe0005b1fa64156e29d9a98d5ca364c5989002576aa7'
            'af8a764148d7655787a5e9720abbd5c25562d29735bcca36659f2fa05921d087'
            'fed2da15b50ec9023c56b95d941478026133ad239d7df2d2cf30cbd416946607'
            'e1312c640bb5a012b12e25e781fa212bda0354b76eeceae3e47949eb052234de'
            'e1a2aa2e05da741277a47ef1ab22d084451c8c495ce817f6660c718ad98f7175'
            'f830706c36ac44c4586df3bc11e7bd6c2e590d9277210522375debdac067e02d'
            'df0d82f5b3d80b8b3c4f8c5fc255779e969f21a50ce3a9df97974ce95a8c6a07'
            '6e3e477fe2ca36d751c775b682e7a1eefde0f4ea04c965288e5116f4eef285fb'
            'b5e4e3025a0b7b155ba93d202f71df06485615330c85d58824cd44e6dd84b927'
            '841776e94384a0428beeeb8c6fd4ce07e1b73260c241b20f30a923afb2c068d8'
            '9e6b15c403a7fde5bc879a0a2db73099e44f398a8c1158783fba02f077adc3b6'
            'b36741ca47410856d4f1bdd790c2d0b2020ed02f8b9131ac800f99890b6261f7'
            '071ecc2dee4698f4c4fed36646750e3625c23006922b5a28326d53c4c32a0e76'
            '309eb48a340fcc0f3bdbb6c9d7a4e58a58a18fd4317f79b3321a7dd3395d0f19'
            '7fb2f52e4629d620111b5b2fbddc654d5c1966976cca02f66bdac8e2d7702e49'
            '5f4dea1eb4beefd47fa0294970bb34a3d10f833f3366a40f61fdad640b5742c1'
            'bbab867399c0ceef33bb859e5641c6d6faf2b33f4f9f55bd83ecb209b2651c3b'
            '83b07d76b002ce08c0a99326727ca7c4ef7245385f38f6149c1daae1005f3a34'
            '743965733b6887f996c2aeaaf2a0efe65532dc3e30b2c67ea0bb82379b582385'
            'b2302e6aa557c832c2e043cfd3abe14fbf73ced891453c1ac41d992fec5efbd9'
            'dda53e5b9afc2d4509be85a363facb30f16ada341af81a05bc868c058eb4b25b'
            '716fa30e4364fd49575c5f7fdfc04adbb073df9ccac1cb1aa119621db3e01a7d'
            '9bc62b91c2ed6eef4532c82af88a0ba008dfeecef03969dc69f87a9d7930fe19'
            'ac42685c2007d9b503a196fd62ebb0819e4ed770906c9fe2bdafd2fb57e236bf'
            '553058721b7bed23682e0bbf8df76056fc86e9c389fd8776e3883bdb8e60fa63'
            'df13a5faeec10a2812854e598444aa60c14ffc82308773023fbc62079947ad29'
            '43351c609ad76c67e2c20c9e0d648cb48e9760404ff00f78631c4b4494c60f5a'
            '23c5b4b34ba455c1b1850228ac8dfcda91163eb7938b877439e13a37396d5213'
            '82b919f6d57873f25e5f36c0eb7d56d85abca44b6f1677f6f14d4e3d9b6b16fa'
            '3b27aa5761eaac73f124249133baf8608695d5f33bf0ba3c869e7dbc1bd3a394'
            '7aae6fa40a32322ee7b1bd39b982e9cd81084bf84f83ecca8fe60c09eeba5ef5')
