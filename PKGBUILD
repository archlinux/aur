# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0a1.20200609
_pkgver=79.0a1
pkgrel=1
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

  install -Dm644 "firefox-i18n-$pkgver-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('9286a1cca4b5f47aad4bbd7680c066e2191f7510902d9b3524ba846436e41b16'
            'f8bbc82ad3ea3b3fa8946fa26b262ec3e5e58afb2310b046f17bac565d9116e9'
            '9ac082be6cf2af5a976d41d6df185502796c0aa3546063db88333c279b888e7f'
            '2441e2ebb72d6b9da1748be4a5b8182bbdaf31cee1ae0a19e95ea7b7264d3b5f'
            '1b983262d7d6012063a81a957c5fa39a989572417dd3a74e1d24644e3d98f35d'
            'd1bdcad3732c77931517dd8793ab22554c041866cca6aaa38b8983dd06bcd642'
            '23c9b60a75bdcd48c236ff123d9738a0e9ff4d5a3590ab76368b50f3ecfb326c'
            '8f28584d9a926bfe5b7ca57774f8d46f7be8f1789daea113eeff12be3833adb4'
            'fd7b761a3c6b5a521733248fbbd94d5aaef1d86b419ed30fc95d9f7d475dc937'
            'ee70712b47c2c5aeef51c6a9d21c7349202f3697c9955b466849c56cc98bc219'
            '32dd45a8cf61ce1b93ef7832414addf3c4700ae32a3320332db85642af95c575'
            '10b2410e6ffd322d82f30bda289306df1b7bc251ed170251e767afe12534edb4'
            '4cdf8dae964e7bc3f829af1d555b21fd52126790d0128cea5726a6d3e470a983'
            'ae57ca6874a55bd638f0d0e0636c4eebafd40473dde4a1c81a83d605ec791b6e'
            '67b4a896b442561d7021a3ebd3344b1a2ae20181a7f4fe6c4803a8e286edaf43'
            '17dbc54246f94e5b76bf04032dd11f2b68e4a69447c2a59ae88ec698b7177400'
            'f4043b9455aa47cc972ff342bac6394aa52a62e239bec28b635de14256e423dc'
            'd3e70a1c2be72f734630853568a35927a4929e16fbcb8c8e8d123ec3cae7b226'
            'bca770651d6cd894e9d3c1db80dd2e35174cb3e455ea429e106e691b64179af1'
            '7ec29f50e649409cc96e5978f72d7a7a00b31d45799fac33afbe6c6a036080eb'
            '6c006126f03a911df1991f197aa9e30bc7b210848dd41654e940682f98c608f6'
            '111ec19ef8b03c65c73f0cb558e75b1bebcbcc9aa6e187452a88874eece76e3f'
            'eb046e57d7f53b76710c72e43c0a329796170177df1524b6d1d901a8192865cd'
            'a8ca7be13f5094f2a41f6e580e1115a9fa19709e9420199bd9fb3039b0c69ac6'
            '760f84df9832bfef9b40847ccfefe8500520195c27fa47cd883adf837e174ad7'
            '4981f1e58f8fbd42e93245264618fae25f2a9e6c9af9a4cb006440067d7bbaf1'
            'e58315cd8b7cba71bb90bde9cacd54b70f88996723c092f8b13e79b795c8206c'
            '2b3551eab50b66082035e9fd9cc371433e2bf69d2dd8099c8cd0e8ef816be319'
            '4aa5fbdc9aa4cb358c431b41070333d3ab9aeecdc70a5091b8bd5bb03737cfcb'
            'e5c10aab14dd2cbc76a201fd8a6cb9c8bdd57000ca0780a21a8ac0574184257a'
            '14e4f8a678c8e840a28b366a354529952381d3305a7d9508e17ad1aa68315c12'
            '4460b9755afb458a8a7fb8652d24e1a301b6f30632d7a3b7f70df0b91f606b88'
            'a4adccdb941eeb3acf850a26f8fcd4ee7068f563f79b36828f270c4c74240f08'
            '7f6fa53f782a88991969fd9b2ae71b0a1f5908f55abe246618cf989ba181e397'
            'c3e3ad01722bea199d9672ed17e28882bbd4c056b512b06a11cf6844e16524a3'
            '6a68d640941f67dddd45337d2a6ef6cc5b1e62e650be595f7dc68015a7157590'
            'dd77e4b044cf56b91d7d5c1f6343b130de570b2c4ae427ba6632776152474304'
            '017b140279249ebe673e25fced936803238ed8f6949fbea66201c1bffa391f84'
            '39307759a2aadfdc1558ec8e81499216ad76b6c6a8bb1d744d40ac453d6dd061'
            '8a558c8d2c4961b3e4bf214b5f3d239e1133e029a0ca3a629b31ad0af762e99e'
            '71d1b548faf9c8b1835887742fbbf358feb780025d96e69c1cc3cb990e1e9e42'
            '8d845b6d523f60b337d982763ff5c0719603d3b8a62fbdea8a80505ffe9e634b'
            '95ef316574b7a6e75cd4771b05be5270fb52b20531693d72387640290232eb49'
            '88651ad962fbae88c44920ae9ae71c205b6070be778147c3a9e74e5f4ebc26b2'
            '00a4ed9c7eff38c239c5ad6ec8ce68a36ece6df05c9efe360aeb18b19c45b078'
            '29462040e2c628299f32be82275b9d94dd0d65a3f5633b8db7beae8e2458e45a'
            'bd889025f08330f082aeb16ab2d451b84f71c478a567c0dccfcc71c081d1deee'
            '9fca5c0a2db7db3cd67fc72bbfe0136460a7a5e904a789cb4d908c40ff56a330'
            '5251fae1b67c3eb91156bdc0df73cdcf86d7296e53c7855f218b62e316e0d077'
            'fbd60282e0862ef677763d7d8401243511778c2b087a843bba365bd29a8c313e'
            '7416ebe207669df684f100d0477ecaf82b6b6c7b4eaa1a417acca34222c94114'
            'c396d73a6946f92580d231fdea24162c1720cc93eef50f3b991916e07c2f9949'
            '6ea3fbdde0a613ccadba6597b7fa524c1d1ae5ac57412401eda555cd013e6b6b'
            '62f2494916081af44f95d4e514fa57d0c2d4abeeb91b0ef4de219b1c7cb0029c'
            '45acd16a0eeff2154414dff24df693848f6a40d3b9e72e6347ed030ba907ba5f'
            '5b16a0313411f58136c12e14dbf6edc90a1aa9d54d10a91129f5e3c597c49858'
            '477f410504ed01b0bd05949590d1d7cecfd290ef268db831e48483db797038d2'
            '9417d7e662d790b7e686ae0cf72a30c4cd0cf9d5304c04318b3638b454f4f58a'
            '9b650f920e1c555289efbba2615184d7e9a24b3b8685dda17e1719a777be81c2'
            'b56b22c038e7abec3cf332522a5c43a32224b340bea863324d5a39ca252a1a29'
            '9d4f6dfe06f2b9f23f5aa8c0d2ef632072da07840d12f50f4c71543676dce996'
            'ee63d1db0a001ca3847429f0b4362d0072cff847b9ef123b432faa64f521865f'
            'fc117cb7f4494cc0446e79e9d48b518fbecc5cffc0fd7c7e8d24572ea2853cae'
            'b8ade109a5cbd99277a35c6bdd8a23b599d079ae6643477c1c3bf4afef7bc619'
            'a2ae3633eedfed06d20d6d956eb5022e7d22f5b844568516c723cea02b61b200'
            'a32e57004e0d34e0c6a0ba82045ddca133c4a05347948d05f6b7edaf0c2f45b8'
            '103f4b570b48d09e9022fc22a9f0738a2299866e18951ad607026fa0a7d9751f'
            '526b6d663073aa6a9aafc6b7434225bd4ba8947849a431fcc95213883c837837'
            'cefdcea0b793b07866e4328accc78d47f6572b7b5175a5ffb3fad9657a7f00d6'
            'c95dfb9b3d84c7e302d704b57fdaea5ad46846ebe8bb95537a6a737820d716b9'
            '9a174e775aa5cdda420e194a5d98fa25e6dafa7cc9f2d5778df8da33adbee394'
            '6c68e6f65fd17918f726e94f839be91a71373026a04c37f3a0fda6019719303a'
            'ebb6b7ecec83cb8d5ff3c9e7f289a199dfc40fdd8e323b22a4768008910bf558'
            '8040df80c36e8d1e8bba3002cc0fa384184db7ab57bb6ae5f4d38b2907613022'
            'da440d1db0a05b63307e0c439163d637b165c0bb3370fbf4d9f60d747e19de4b'
            '2542ac7963b49d1973acb82be7c1443d3b4e35df790af3b6b119a37b238af11b'
            '1ceb9d1fcd5e8579a04f554c95a91f81ddb6b1b2e09d24102bd1611d0585c0c2'
            '62a4674ce7de9557bde38011c407566064b9d5820fb8d44d6cfc5a1bed987dc0'
            '26001f51eed05a9009351893dafd4fb85b112094fecd11e7c7a8293cff8486ca'
            'dbb4d2e22a146f1d4cb4d88e522b49852999eece99a0d085746cd39589dc1eeb'
            '9aabdee65741b4c620ed444c15124cdee697648fb303da9edf6f67558e1981b1'
            'bb4f5a791c8d3ce0428e5eb44e2b1bd9a4cce0e1797fa603a2b3d5627850081c'
            '083456ef54ee9097c72c5ff88dd4a0cb7887de3984cbb410915bdac0ec21ced9'
            'cb1e920a58af3bf7d4944bff80f52f3daff57bb4e0f8e430c9bd3ac0c6fc2475'
            '6c9ebdf3f044c8503461184b0e2888748867a4e98c1f919bec8fe04190bb05c4'
            'fb9d099b8e618ec0b06591e95d8e2c0d2909ecaa9268e139a142ffb5e6025a3c'
            '7dd44a4e3a5586c51c346087cd7cd2c9f23d022b7f7c0f092367c0d3c5e2f91b'
            'eb5bfe7035e740803fae13fb043a9172e2c53b1790e9bc801ccbf67ae10c3524'
            'fb1fa5a6dc23ed339286ad6cd9fedbd9519f48c8445292c70a1dc894c11a08f8'
            '2df926eafae3ed6336f52f70c1d6831b1b6bab4a4343159709b1549a577b17b6'
            '843e0d1a8d88e342bf970cb20767804d62cc5b21c8930649f77eb5490d645d3b'
            '656019fd65abb88fce8ff019923c4d68176282034fcc421a1fcb81fbbde12044'
            'b197f370a3b50ffc1c5cb493c7185887c9198d026238837adb62c05610b8b188'
            'ab193f96c17102c5c3db100d491d0730cb397a25e6784e5f617deb7a5861a30c'
            'a1f5108122bb08f7b0da4d97e3ec2142876ceaae70b6faddd1265578b03717e7')
