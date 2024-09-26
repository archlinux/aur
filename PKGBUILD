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

pkgver=132.0a1.20240925.152840

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

sha256sums=('74ac17255e4354f43c0f59978b736ca65d754d903f38c94fb7aff854aaf401cb'
            '8a335c062aec64784ba13201d86418922fffbdcae09cb64f0fbc8527c7ef05a0'
            'ae6d680e7e4a8581ea093393037c2373e226a615293b29a02ed3558598c455d6'
            '9ebbe0b0c25f0198b5b103b70b114e225a0a336b9a03c11f669533cc95f0209a'
            '16d492c042a998a2f4892e4a456e2e341e2023ffaec51f29565e1c486f22264c'
            '130d850cba311fdb3d638d2a2351d8719c431cf790e8a308fe3796b374f5de87'
            '783a839ab1d6c40759fe4a8e833da44c1f91161f1761edb6cd843568d82bda01'
            '52062f841edf3617d35afe0f0d7ba65195716ba91e0de785d6e3ec59d50ed0b3'
            'a72211a77f677c9f2a7472fb05785d1acce5662d965ce81b7f30a0b9f697771d'
            '74f426a065fab5614ff825c6beaa2c9380f3c1d3783ef878cba0926823c4bed3'
            '63474a1c5c05fcd0ea4df722616b193dc6ad9875cf035f38ccfea49f70085f02'
            'af2e55b706167b5d79f2b4942e656dfb8e0973b3db160b3740c814ee338fe332'
            '3cdfb377ac473abef3ba91fbe09377594c2ad1137d32bef636b4a9c167483340'
            'a4e599eb021ed46fa0470e2bbb68b104f87ba0306d42fb9d89b6f95f817278fe'
            '3b2660b23284cec8ae784296aa0811ec2d2cb5b190dfe74dabde2ff0051a9396'
            '6a80389e7eb1762825f610be057cf1b1db0d37eefa288a165b2f1d0444979f63'
            '0f8a45e28547a5439795b4347c3d4ff30dec444acaa97c26b8702892694c2c3f'
            'e738a5725459b7b4cc50afc80989d60dadde7e62d59e28b60c01310be882f378'
            '3db62e2914c8e5390119793ff78a0c6461acec443b3260a9a8408a2670e027b2'
            'c2b8ea6ca864a9142aa4b9886c01c326dc06e66a9c989395cf20c84dead92ffb'
            '4894d1c220af334d02843a6d1439cc4536b9bb31eda8ea0767aee91943431a78'
            '180159dce413f51f1a6ebdcd2785bfc7e2664ae8e239e89b2af73e3d17a7cec3'
            '62ca9db5c7e3edd86f36d465c8f5b0ae1df2b37c108119d705812decdebf1bd0'
            'd68635c7f4638ea3f5d7ac638c18ec9c733075b56b9030112eacd570dac4245c'
            '831664e46d266bf6d46a43fbd1511b52ec2107db72e7c020fed0f2737e4f8d08'
            'f3c8f7050bee2cc4835b88362b9de49eb175c458292cc1dc659db107d9c5ef88'
            '34f6c6c37814f644fa98152215768c226a6620fd94768e51a8ce2a102496f9f4'
            '0c4c8bdf3214ff58426342c7a2662726cbf1f771d74de08358592416a2a5c744'
            'a32b6a0e38c9d598f19daf4f5237ca49cc3727168de915b44796476292b7fe48'
            '138b07bdb38d25bebe16257446e29bde4601a579f443a39a98c762c7c3884b9c'
            'e5ed9471ba86fb644cd738db7d693444caeeecec1140977f3adcbd590c419002'
            '8df684e9a2e49ceb946d82df480b2ee7b9f709d6a926a5ff3e6f76a77c9e5b70'
            '2b325a91e9c8810cab99317f0c2a3b05b6416620c78cdbc5466316b97be8568d'
            'bcaff793f2709ebfc17b5fb1260ad177d7ec288065ea9f59ca03711f829e1912'
            '9af2dbfd7d1e68a3b9ff9c9b201caa77c170d45f761f73baa2cb7756565fa7b6'
            'cdd3ba7f7dc845c6a451392f0ab0c2e69c502b4e13592ea9a30e9f1f86a29728'
            '4ecaa0717efa0a8eb9218950ba8fa6f5a17af52711b45af736b7d3c039383ebd'
            'fc3c68fb2889a90f98f6d0be4ab1ea80ddfe2351134ec963ca942592ffa42b72'
            '5d59d568d6e0de923769bbefd557e8f116284faa1cf4bb9ef94ceb39348c4201'
            '9bfdc05dfd59fc2b396820edee990c3095c8c85282ab0e9858ae9a62f1ccce86'
            '9e34bc0e7ea735269df542ece55f20665be9a9ab12e0b9758de11ea60e4f00c9'
            '29d554cf107f8bcf151cefcf380fe2e84fca3635d44583d58f773c4e3203bdc8'
            '5e66a2d96edb9755c644bb6deebcf7623f3da93330e4e090e012e542a319e86d'
            '428c6e040f2710c57517c9ea27e460f4cdf848c4ef96b6c31a7ea4c4be2e2cfb'
            '6837b7e9229ff7ccb3afbdb04fcc9240a9b8d99f881c1175692e53daf5d823dd'
            '6a164972cad2035c17a8b0f23a01251e52ac10e95689a62bd5f5618d883d15f6'
            'c7750cda66d0f5915f2bd7f606c64a5ddf3feee0317e745d57bebce1aa358b51'
            '0947fafcb2327667b7ec5f75faf3434eef164d1c621e4914f2bb1b8c44a95bdd'
            '9f83650ca1b648695ac4ada892a30a75fe824f7972dbb32ea18f954e58c1ab96'
            'e97cb78b64f9c1ec6b5fd9533584fdd874185132865bde451cfd42c31d279c62'
            '8b8464bac27b5b231cbaff0925c69865974e98a417c0acc09a1b63f54bab34fb'
            'e80ddc3d76c59079f57706ebedb6d7dde885d47e2d71e5920c47d5301cf4a5b6'
            '58768173c1040d1a4d834b4db1790b0133f9790ba197ed0f3ae07116a721805a'
            '0603ec5b733096cf770d31aa33600c3eadefbce105637a6f1109e886d0eefe3a'
            '95189b85884aa5b8017a21db8af7932b50158ade34031f019a8195d8b853f61a'
            '72e2a7b3f497d0589942f733996ef53aaba0dcc29aa2ad8a50bebf2eb91f9a66'
            'ff891bfc7aaf51a10fd3895a3bd4afd629d8807c8dd8fc31bc869b0be08fb312'
            'f19286fa4b72f4c160d389de2b43e0b48f3fb8de29632c7fd16c92460a449cab'
            '0f6cbe270b664c9a7d55a522613210a01b81ef4d2d9bdaa4abd48a49417aea8f'
            'f87227f96cbdada874c9ed818a2021523e283ab627cf181e743d8640d7eb11c7'
            'b1a089c7210f0c84245e6bc43bcf40bc89470cf94fdf4baacc826d80df9a34d6'
            '987705c48f73512ad0ab43f0b1487bd1f579c65281413883a7c695156cf7a98e'
            'e2e4f2acf22b7461cd3576fa7ff84d9f72a035cedd920c211355b31b0b30c83c'
            '61ded99a21becdd2aeba838b9301ffed394ed3ed265b0c2274e8206a347d3a56'
            'b187e5d39966569d4c031de3e0fa210f91662834959e6be6e95571cfea5fb759'
            'e4b67b20d739bc615f47dc2dd086f0e1ff31fb2f24462495ae7487f830b2678f'
            '684b1138511df849c47d2c097b9c2f43574c710e0bff8a1f07fb6c67d48a4c50'
            '8b626025770257d577f3d89ef200444e6a15cfa71afbe623bbc1d71d694fb8a1'
            '2cf016d7c3bbe2282b03559ba9dec533a240350379c31f39f512a8e2d52c292b'
            'baedf4db0bbf7584ce12cc1720acfe19c87fba045db08dcc25af7991f4e5e3d9'
            'e2bdd121b1f2d68c8fdc8e1a466974d950a0f0ae4b13da09d19f2e40dc03ff00'
            '11f09453c6a57cc8d247eb45fefc1f168616a6a80dfd09c8c37775a347829468'
            'fadfda749c11db80a1430b3deebf6cec6ab68640ea91552929b045264ad5d513'
            '81c8f357cf76a421a03f968174ab61e3d6a7875ec291a7634b2512da592be7c4'
            '2abb51d0d9c58846d18048624304d5fdaf1f895c884a4d9d0d1af5353f71c31f'
            '470ec19b8f7c1b411d96811256357537352b3d2668079e6dbb586f7832c16eb6'
            'c25652556284e3c3226573a327336bbaa101a43035d76b9ee0d6452f1d5e98de'
            '740fc0d7618b4193a4fb9d59d3dfc00f613a8f946bcda4076d4d14961487f902'
            'd68e79096dce35e34f4c9327799dcfcb65d54f3153c1b5ed8004d9e370c5d8e6'
            '3966a797df3d4a2e59c5d559a27070a4c4cc8896ddda8dd68d79a0c7e1fce7f0'
            '1bd699e23e9f95069c7df1e6b0ac0f700853a60bc0bdaf6d41d4f181f2338068'
            '0a5c221f9001fdfd8cc3eed05fa9adca6bdd4116cec91ea2d309150db85a5e2a'
            '2716e6226d929fc113dfdb02efaa9c12883b806d770847355a2565cb3b4ed6b1'
            'e2fac48a9fc2e56bb8aa689ecfc6d6a09f0b861260d78398e3e389b991955ebf'
            'c2651b9c5f2fb81aa0d11a451aa93a847358c79b1cdfd1f89afec4974620f362'
            '3ad4aa434e6db888d330a1e4305f541e1b03f213c85f9ee78c17228363106be5'
            'e901de2e957d3e86f807c09f1e1e455d7c89247911741336be5a041259e0b15b'
            'd410148d404dfe946d1e0e47aa0aa8c24d278c494c4826c3f1aac573614586a8'
            '137e4ae466a28569ada4987bfc74a13f02440a904ae42f93e2dde8159387503f'
            '9f1a75f1817e27f01397ba0b71a62d75a31999a34136e528d07073296da99067'
            '15ab35de80ca5385d974333fe44ec951701e80b1a6339b1a3ccf81264b6abb71'
            'f264b633e8416c1888de4b8e5bf00881f827b58cf286157532ca5a6b00bc0045'
            '164385e071f80ef8d40e8aaab974c99e549295541fee16c114c4d251aac33519'
            '6feda83cbfb5cb2072bdf0a11137faf6afed7737508604460ebff970668eb6b3'
            '64af0d9f1f4d0f1f127553b9ac16eed90c5aa241856a8b51a0a122da4cbb361b')
