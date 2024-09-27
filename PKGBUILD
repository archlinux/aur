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

pkgver=132.0a1.20240927.094419

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

sha256sums=('dccfdfeca9df796b745305ad45f3b4d7acfb336f82ff2beb5f2cf42a43f61557'
            '0a3ab7a730aad63ce785c11547fa7bd5d665909886aa2db3840b0faa1556a895'
            '8cfa56c83ef5fbbe5db55cb227eda392923346cc637bb8a43147ab92539a5ba0'
            'c6226988742ddd69222959ce6500742ee7361dadb49833cbe913cbebeea8b781'
            'c7123dad1b6b52f7e2258715c077e07c4819baf186badca5c43c3a52a9599b70'
            '64ccf2945e3fbbfd68381eddce9779e2d92d5f5263eb8be171a6098fdfe7db49'
            '55d8a70a176135776f474c530c0b5da3b1e5292199f2b251397cfd73a7f2b507'
            '82d67eeb0f2e3d86af9fdf2f995f226a23c780d59cf391aaa3ac231320f4b100'
            'e850a206017c00ba2047182c3a447b01f39dc5ca21932c9191665806f8804e37'
            '4bb29de8dbee8b887105bf3f0cc6e8fdc798d8b8871bf78c2141da2f1bc319c8'
            '2840da166e1490c0fa42c3fa5dd63bc2e1a56cbd96c32c3be23ada4f76cbf02e'
            'dbcc4f3e3619c317da5b3c64fc4ac929a6c6bc370d71bc75fee94be488fe14e0'
            'c9098bc53aaacaa2e1e70e5aba17d6583121a036a7497438c3f5bb9bc8c3384d'
            '11ccdc3cad23cde0cbb03599a5674de4225453d5bfe39f9fc4982d4bb687c9af'
            'e7c0dbf00b1dcc28c6e31b186ee11ea39121bc54cab30cb086bd0dd624ae632a'
            '304583a1ce3b8cfc6e7db3fd64269b18045f432c7c6aba5a85064e1b9ee18bba'
            'ddd3e4343ee09eb3eeb2d8c466a79e0002193b1f243f28ce403dc46f87f28dee'
            '2cb103ce105c9367fa3d49d5dd5b2f225ee804ab74921c3a708cbc35be4d2a2a'
            '11f2dc89a287e319858124a483b4d23b12d2b1b209ec29094cae5e00a4f4e65a'
            '5637b88797c6fc920b917b49fbc5ea4815f163523e1ef6fa5528c67bf8d9094f'
            'f882ca70ab99a0fba27c26c5201f9a7c9e1d3236093179dda67ce8eded61e538'
            'b253e47e9ab802f82ebb868771c648dc34d5fbc50637d0ed7de7b447c9f9e4bf'
            'c356e6bb349684d76c6d5ad54a8c74043f686b4d97fac02669879f0776126a23'
            '83b43eb6a25f6a54e470b9491e39b8cba5212460d3511a9b7f3f631d1db85311'
            'dbd1c24535e986f5c49e7c08655af50303d0cf578a878d09758fb7f4b7010623'
            'c0d894bc64e1904830f9ff864208c35cad551550a3c8fa651546581ebea3ee53'
            '0cf1f1279be2ea6889608d65ebec6fc0ef5d72b3417b4b7a5cf18c7cf910fb60'
            '4bcfcbfffa32e203d0faadac2fbfa9f0b3ba74d3fee98a78dc1967fea9defc39'
            'ae6de61da0f60121cece405ae26052dbc8e2f15d136087771796afcba41cf567'
            '33a9b53562a025438025d5fe49f924b24798175505e03c0a1f5658200e24dd9a'
            'cdbc2aa936633d6a78cca32363a98f8f9a0c0819a2114c4f3a6151b8c65564e6'
            'b7617650f93bdb0ea43e231ca21cdf35b0b4641e372de191204a802f8d78061e'
            '8aa8db6495e1dcfcdb73b83a02ca3c3a9347caedcfb269d500ee0b58662c3a05'
            '0d2fd2d8ea0faa8c0cf9106259dbbb884eb503335e0355fc7d6c9c7673080abf'
            '03a54fdfc70ff9035a48a626446227bb83b9c23adaae208c6a63b01b7cdb22c3'
            '05f95f272ab99683523aa176311e20b4223dec92683bd2468fdba775ad047a41'
            'ffde1b3e03969f3d275813a62f1033a2112e10b12a7befcbf65ecbeee3fab69b'
            'b6550b0271af4564363701b90a279950e4742870e1ffb695f5ff7cfecb44919b'
            'ec1108c378d1fee573a09da4b6f3d38a75d378e1dbddf49b95e157c29c581c39'
            '3445bc96bbe0f30a5cb3720f61073077f6720bfc6694759d6252575375405132'
            'bf4fdcfd67afe7b2bffea9463202d491addace24c904ae2d3feaaef1a39a9834'
            '8a302cc723fb83ba60ccffcafd804baeab6e6e75d39acf189fd44eb9d4b96be0'
            '9d6bdc577c8f929d5c8a7ad765742ef456e39216988389180521c8d3cfe3e078'
            '2110d37ce811dcd280aa2ef349d84bdcff31e797fbf514788e9546b7071d5ddc'
            '3352944e98fbb974ba093cff12be6970cb0d33c0894339914ae197107c813c47'
            'dbe503a94f7079e1de2c938eb8a0c5e50448df09991ea209645741e98ad56e12'
            'bc1444540de109424f404c79fc4d782e27a20ce967a3028871a5967e31c91cdf'
            'df07aeee4573243c0d43cfb987bee57a582ea31415bebbd925c4703b019e790f'
            '3a3e94447037e2d134cec3821eadf0ffb688da695ac14ea9f03e6b81a6b7ceab'
            '39734334fe3d6e4c27d89bee584ff963753eef8610a23fe4795b6fcd1eb9e9e7'
            '2febecee81e214e438ff1894b27fadcaa13572e069c89ae85087cb57f0f7c63e'
            'f99155a6bc0ede7fd55500a39657f4050d9e5ced1710db73f4a2852073356a6b'
            '5260bddc57c6790f1a328ae7e660c74bc6f5598f6d72420b5f420ffae05f88be'
            '483ea29d74ad655e0e81184d843da0f14f22a07c91299955fbb343fb14b48d92'
            'ee64957ba6f6d38d17d2c5ba09a851fc7d0d6f20772e2af44ee1138463c6e6e6'
            '83c458403c1265072285adc04b18e8f624f46d193276a180f466408c5d12eea2'
            'e895af68aa137d1e342c9761841f12efd0505ec58466a005bec8b73acfd598e7'
            '61643e8523342fc471dac0f80e8ec4c61816c267210e5d072c6e946caf42db2f'
            '3fcd4a552546bfbbc6a05843d8340980333e00df52ed1211c5c95eb1ba4b4d25'
            '676376807cc240bb3922748c4ea19bb5f419341a5d5e4a6aeb863db8fb6211fa'
            '2b09879b1dfa65c2650de9341688d09fb950114963b93c8c5a8d0654a013ea58'
            '352ed9668bcf3b1b677a5de6255cb7b02e1cbddbb0c2d6415026aac3b0befe1c'
            '8d3546b2035048499cc17834ebb192244d68ff8932b18e3c7eb8ce299003dfab'
            'fa6478117ae20e249d84497956eb386d570091a2465ec80ded0253ee4d486492'
            'cc6daa0f74951b517749b96accc6b930e79654378356b0c298d04d3ea05131a0'
            'd70dd3d856f42b2c49e57f2b469ac4020e3b60b7533ee6f995c140d3393c376f'
            'dfbf6e5a72148e7ab1d57fdce93a0823a0f26d0506456213a7ee93f5eae2ad52'
            '50aed6be06e8c4848108efcc3bb8a63e17f2c379fa2640819c57bbde4c6953fb'
            '31399c069e74b7818a423e414021436194b23a070a83de89570efaf5d2e0c9a2'
            'a5a643d93dbeb71f09bca5dadafbbb8a7e478863a4292eb48af107a777c8e0ea'
            '1f839753470bc88a7aea82d2da5cd67c11788a207a8d3f52b41420bf50422d9a'
            '4583da40f0e25ef7dace69703ad6a5e9d7141c39f920ce9d223f8a237ccdf19f'
            '7bf0581e76e4c8f23ded4c339aa1c03c7cd720ebbcc4365cd74ff108a405f88e'
            'c0a9bc9a592bd67b5c1c6fe77d24a3c05d9482b7acd967c996e53343b713ea5a'
            '91900e908c4c24aa10ede6e6b2ecb466f8ec7d4f9e74610a3410589d848cd332'
            'b3bc8bbb4f9b013f5fb1f843e756aa6dda74805c124fdaebafb888b9c7d97f76'
            'aded4fcfbfa72ece7075dd8aba0f78dcd0f1107b3ee28003b6c973c566fa31a5'
            '85d7d39fc8beb2fb8ee71283a6ed1c54c2892882c8e97c5e395e4b956976a5ec'
            '3f04dc34f175e47319c04f9dcde5d011a957b08dcd65e266174ac22be292274b'
            '4dc77f6980f59b7a217d4b74449ef99535d2c3d2151f0634090cb3a38f76fe3f'
            'cfc224178d9a9ecf1eea78f49142315a291b7318db6fc019389c120f94d6c48b'
            'c9a0b4067bfacbc4b77ea66f916170d6f8c322485017a51652d4a49891cdd225'
            '572b86d74d160ca589c3899edd2cc82a143c2fcfec285a4da9a58bf40b6848b3'
            'bf5c251cc01cd4a0ef511befd7dea0ceac94659eb7e4e16d689558fe27503ec3'
            '1e581be02fbfd9ad8c713ee08ade68fe8f58b8fe751abf89a45cd0025edc6d73'
            '35d131991ee85716fb32f569c986e4465ec8d3f1ed00229dc8ba1c91834d0de4'
            'a217a37c6c5a77b32c3789e39e793b0f7603fb449b1f5c7861e9bfbb3d8b5485'
            '70e46afe8cb1c8038fbce299084193c7952fd18a0251b95df31ca4f5977995da'
            '8ccb9b4cf23da43a06abe75be8132638948d4832cac5239cb02da1d44d8fe458'
            '423e885a4e2306710d45baa1b6fd82cdfcb715f0e62ac4ed4308dd8f62518d3d'
            'dd16e8f92d9cff72a7071dae4ede23380ba4432849798434079ff657441b8394'
            'ba466a6598dc3416d435b3976520cf49e80d0bb0a8f2de4852f0baede119599a'
            'ab46a007297abcb5cb74709b8ffb8f68463d0daead25f93e9669d0473cfd8397'
            'cd29eab87a3432d3f99675153120a83802646edd0c57209a12b97119866f8384'
            '2f385e542c98302f1766efea69466aa0f4bb8e77cafb3efef356d4ebbd0ba6b2')
