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

pkgver=132.0a1.20240926.212653

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

sha256sums=('b29b70539fd6331b55ca189fb110f81ae79ad9382e9f335583058ab0c835e48e'
            'b30d33b64789b3ca8cc7444da006d5f8713052642235f6aeeb52b41315f2ff3e'
            '29a7c6fd535874f825e8bcd5028db1c4bd18c750f80aea942d665ae481270a23'
            '7f62280a9495f21f3338c435482e010264b5fbad9b523af372e4016d3b7b1021'
            '50ca1caebd204db57fcd7b0be9b4ab38a95947624daa55872f15994cc940573a'
            'e518dd27c5be9dd87b44c7d838f014926cbbcb75a53283aa199dbb0f90acbf58'
            '0676d752bb6eb2295314a9954e7aa060033e291d2168298de42c794d49d858fb'
            '3c2ecbd07ad44f727cd5a7bcca151c7a0766d8998956861b05f809ed69b3f4d1'
            '34c0ac0c4eee397a73a40b5a3ab740a5a5d05e2d4535dfed65a096ee98fbd735'
            '49b7bf492e5fb2b480edaa1a1cd56ab87975114cff85ffe639c073a79d753367'
            '3330b5729c6bd46390da2e4a7a906e2d6514337896426200a3d8a3a1c6c06b75'
            'e13fa0efe31378f26fcacc9f0cde4618b81d6a263feccf6c62ed3e4371bf059f'
            'bc7b589abe6fd0a3fe648a70eed04011e15e73ee4c8f7d6e3b8e5509b0e93950'
            '5a38878d83f039ea63d90f336c33ffb72d88a19c084d2f13c9d5d1df1b22a9ff'
            '304d27d7525107721f6d487eb67e4f45f1ea2fe477019a6687c3a880f5d8669a'
            'cbba05a7a6081eb0ddf023d6fbe1c38d98f649673c08ec467d87595adc349f54'
            '39c089c666aa1210071442b12520e2b409e59fb5f266e626a0039ceaff7e3e44'
            '02b91374a520bd86611981357f618460c2d5dbb11959fcfe0594086394f02bc3'
            '839de945995608fb9fc096e94d62957bca9d3b2d66cb987d0f305cf8e5f9ae69'
            '3f4f14a095ac89d1328996e390dea2e06ffdd83f5d44397246182eb1455e44de'
            '5b4021e46b18c326f754e1e2443e633af4e0fc1ecc78d8f880a04868ed45469d'
            '51dfa1928634f86b30b5a79cb2b9fba54452618f5c361a2465d589cfd3a38571'
            '372653a303969991728efa5a9febb6e7dcc99afc58002fb2a3c08f023ee1bd5d'
            '8d52572bc6ac5f7dc073d14496f505a7c7e194ecde88399c49fb3b48168b33f9'
            'e588c1a87468756079b4723d3ca79405245bbca36c168b2b8b9c41572e46cd66'
            '844ea0601f525cf7b5c5587de8801ddb0f57543f418cff041f853c3bae3cef08'
            'fa69e1490cf0f05fc10ab28addc203829481be13dc693f35802ac139c8fc1174'
            '6232febbcab3c29c535aabae857fc2ea6f4f506ca332f34d7c5a4ebd36aefce6'
            '7c32f5073c697561e5cad493b44e9e33026626d7c633f13d33b8d2284eec36ad'
            '4a2f7b5c2d24783ffea3d80746fd2731e55522410c19f9da41b3738471fb8e42'
            '32278784d7cb524b1245779197fbbcde1c27709ffc1064d5736a938874e5bb37'
            'd9972181f8e933266790882935c15532efa54e3ee318454598d50c4df3493c7b'
            '6b53909ea513d1b96de49b53e5a67ed359abef50a0f34a503af89d01fd8d72b5'
            '18145c163a7669254b7582a9507524fd7e64fa99930596948cd34c7ec1366460'
            '49a583ab65864ed55456c76c927e6d31adc41b541ffe44ad79e044684d4a26b2'
            '2edeb0c0b215a4d74a05a06ff5f82681722352a2b9f98b9bb0333781bee4948c'
            '281d3e509a3d5e93699786780b5c43634c86b31e0e060d7764f4b0ad6154cb3e'
            'cb26a5ca726b7645fb57599fff0a7c55e56e9654e4e2ace2b40d9ea8a9f6b0c0'
            '01212141289af9edf4d9f52835384588a68a3394299caaa0451451cc3e1063a1'
            '0183f5db9a95838ca0d1d921b4fd5ff1b8fb2c520265a457b8f26c56cac09855'
            'df43509625bf3243041b5e3c21481de6155954319fd2c77487be87868253b861'
            '096d700805d83e0e679e5870d47518d003941633314e9a406fea9a8924e39171'
            '665dc5e6a9eabc989499de25d88e90c09be6b87591169731c49ecf49edb7e0db'
            'e5cfc830789af034dbceebdd1324fcdd5796bc66a9dda666ece348214fee7f19'
            '215fa39ed1cb1d58eda6b9eb92a0c054ffada6184adcf9e210201c4c3c9fd685'
            'e6ca0aea43a6994960ca645b1fa91b65dbdc65d245511fc1751dddf9ac908561'
            '7a2e88138e16f8398f269e767b32b39c2c86b7deda635b9b4aae083b2cee2289'
            'c765e2c375f692aec749f084584fe3b9801873a725d322dc7bf61fd9e102dddf'
            '30ae0a54ac9043754619e506c7aefaac90220576400e488c431f64c17c7eb2b2'
            'c3ff650e48957880ee6d1514b9ed41ceed18ff1bb9003e1ea034881845a96e2d'
            'c241cc1db520f75b7b51a24ff5cee0a19cacd4990944085a869280e6a0193d5c'
            '6510472c2eaaf508ceb29da386b10d57c01560e9b6d0e3a689458f02ff3b034d'
            '1a2fa2e8f5152d0f195716bc5f66de228a3edfeb82a4f0a017a9249e594fb0d8'
            'cb8da705fc7c5a8c4ff4d216046d27988e1e69a6b90214fcd6ffb0c57e3acb87'
            '32150f4d0b82876d68ccd60269dd8405d410685f64288743b0de5a4ef6dec69a'
            'c9427c7aea60f72d6a586e61f4591f16a498d2fc16d52bc2c20692cecebbc92b'
            'c2955136e481e6ac0c51bed2445d663035a4055e5a7a2e3b347cfa982ea6c3fd'
            '078ff373627d6fbf5343365f755107904d84b785bbf0feeec222bfc101626ade'
            '3ae807708459b3ea1637b4044f86983778226062399b6daeb8c4977eef7359b4'
            '6a351915d964d386fc6c723a900a3f156b386e27d003c910f9bf687b4857aa31'
            '7e5bd7a142b3c8b108eb11c288a2085eef61766db6209e93aba3ed1fdcb3b9f6'
            'f3cdee6fd6e03923cfdc68072ba92aa95135fdb6afa442652bde5dc773e11a2c'
            'aa5d4a24ead8d6b004f1c03514ea1d7f3aeff909dd2a3c7dc862d4d341f4d4fb'
            '71321cc8c3f1cc27760e71b33011ebb9b8425ce475c1ccd92e2affd60eae90f2'
            'b7d3b66eae494f93ea2c5662946cf929ba360fa0d1d15f03cab1e7aa7eeedf5b'
            'b53d30be1738822b4a9935612a8eebc3dd98248a9c3b2a03eeb2574121a76ec4'
            '0423c5d306edac3c23153719e7fb7b15df81f2a174bcc0b24e7d9810d6ecd7bf'
            'f9b44dea66520340e8c50d8fc95250c194aaaf1ab7d01e62e88ddebed4190469'
            '1a137dbf824eaada55f4954a3c64ad26087206931a06a479012d414405583b2a'
            'dad7125ddec8079dafe6a0599eafb8cae075917f47b79d4d601295689f7aa05d'
            'a43d02621ae15d663d215c38826559a5846dffa719cd3319affd8a51acb053dd'
            '84c85d6f9318e603da015d2a1c31a54964afc9208049c2421151d4d723d32056'
            '6705742c3d5b10a6d6dcd77ce09fe3e1aa7eb48e6120fcf9a54d0d77127a3aa1'
            '8dff2bb20580433a0a2e529417fe103d54caed5cf9db85e9da4230fb56f0507e'
            'eaf2200a01817751972083f2c06c1ea920fe0dc9079a1044517d15fd2ac96d21'
            'fac700d92204fa80bbbcafb89369ec2251500a6c141d8fc78b202a338baeb867'
            'd88ec4911ab8e9cac373bfa5cf5befb3869d08134fc0d1c6e2242dd7ed79a34c'
            '50953fce92e38d97c600bf664f6a0b6c9f44f1cf975428a6005c113cf617f887'
            '26e98ef428eb02d5101d02dfdca3122d9ef23b11a4c4c6967ae487a61119e34e'
            'b285efc6d83fa3c14416c6616b0700a4fdf80927b52db1d385935a15d73c3347'
            'e8e794c001acb3a7c65dae4a8363361401cea8b07074cedfb10a3d7704452396'
            '8afcd9b0c2bcb2431fdc49912a87345b9c7d98b963fb9bd545aecc669e10a4ec'
            '4fede99a11dc2c5a8c0621001f3b2198f2cee00ff0534842cd72c55a9f4c83c1'
            'fb9a259946377f5a24850a3e853f523e886acfd5c7335c22a79dbd21aad64236'
            'cc785d59cb90c401dbd42f6adb6ea7d00c5d25660d07cbf188d349e38897f238'
            '10864f685f807e8a7a42d2a0e37771bdedad06e0b6d284bcef773335a890a158'
            '34d66d85eb31f95e811075fce11a0df7675046a336e276de929e6f475fd2f721'
            'cd7e880bd0de7982e2d3a41b50fb2068da0aa653ddd7e5e7119d3c70a0300da8'
            '7aacafd62ef770a297d2488f10dae935d79a46986cc0809da8e4ef6385f38c9d'
            'bfa6762aa63182d20cfb2f3f18748118f2c88e894589dbb54cbd307c5b678fb7'
            '38e98f568488fa0d158cbf57c57a2efa7a75699b801f889d6ed1f11b72f8c4ef'
            'f6decbb00cfc629a5917ef45fe11721c85b6845a64ebe00dd555d2bcb277a225'
            '066f7b96b8e09b771e8486d285b5f04a7fe4ec96ad7e0eb9e6e95e64b482156e'
            '38255e16d3bc1f2980b059e40c3c3ddb0f037c4675969870d06d32250bc17d2d'
            'e4eb09efa4e3172a0cf281cdf0a1173b02910567afbbec010756e465492a02b0')
