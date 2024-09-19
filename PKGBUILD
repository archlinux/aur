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

pkgver=132.0a1.20240918.211346

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

sha256sums=('831b303c7e1a0738ec2f2859200a9a75cb04f786dcd2efe8c817c992f56e89c9'
            '387e622fbbd44543c7dc824d51895e14ae1555a5cdc5fc4afbe7a1ecbb46aad2'
            '8cc4c701ee3be99ed4beaab65866731737f962096ff15f23067830a90de4ce66'
            '39409721fd763af31f81912df9bdfdad84f8eb117518c3d1150a6635dd2747d9'
            'b25031aa95fd9e69dab0431b869d72eec34532ea9a45af931ccfd4568095222d'
            'd22fdb6ce40a3a821dee011eb01f5d123215d48dcb74ef8258ae15729f0a2d8a'
            'a3d074ecd86c39c5548f595ffffac89c3a59bf6b0b0d5ab013485787bbde4399'
            '79b0ddede30e3fae7b1ae47d46e89a72b7ae4cc664b9eff1d16276af07f56fe8'
            'c96b54cd2a3b3627ba9df33fe2a349ba5413ca89a7d9c0fb192542460ec1a8a2'
            'ffd88fcfd358e151406b20ba396a191de3a4c9acdc22599adf7d8382e0bc9b4a'
            '5daddedaab79eddb363177675f19fb255d6d0424f67b55be55f847a9f124404b'
            '0fb5da6dff79dba4ed62b4c2e3d3c878f3bb6ce3fbc8450d024f5a0e979d2230'
            'fbf49e5c272983a9c2fc2c6740b62d97713fd74273677a6a0a891654d963bd70'
            '41c2a22f5db8b86da04ec1b6d92bf33124f4fd59672104ffb8bfcc9fd690524b'
            '0ba458eb4642c827809e6ba52dc88a6a8d50cf5e489b94e18d79bf9489c11cd8'
            '2398c43d9f5bc1bdefcbd424d8e6633360e679f447994f5aeb11c6e50015afbb'
            'ad95d47d690a53aed1342ea67ac6ff2f547e770eb9b0bd068c6010191bfe7f58'
            '326a5c17a747584b7e4e25c4322ac394f247fa5f13e5ccd17f984cefdfcfc3fe'
            'd7cfea46e55cbfdf4a93aca9068f2e8decb1cc3702e9d279857b40bf70e26e3e'
            'b6bf073782d0defc58dde6ed4d4c6a9174d8e74e26af1392edd76a7965f659aa'
            'cf126dd659a1c2b4faa571007aad0618ad7c2bea0253682bb3d4fa37d359ade5'
            '68cbeef5309210c3bc1c3412b6592f6285f6e65f63d5cd1caf69d754ce078c35'
            'dbee767745681e71bf0b025c15720976a1fdd97d14d78cb4114651e7be6fa54b'
            'ff7d287ad35706f5ee4661fbd73621bb081101b920842df60a055da76b217fc5'
            'ae788157329d5a6c995b26fe34eafa5e6eabb22d3ebc6165149be6d64fb27b2a'
            '0e217698ab442099dc3d44cc6146b078b5e0ee226849a8167b48eb267aa9c429'
            '2667af8fbf291f833e115035b034a399ac0d19dfe07a387461618f9ec021af5d'
            'b0ef979a14d2f1691e7ab9b9a57f0b81f2e3dfae7421793db22454eebf3f04f0'
            '596a6f8a1deabc585737530f5b9404d78d204f98a6ff85cb5c2a6ef355da9b46'
            '993c52ec344baf2405e6d209dc3b78627a761511df8a66095b11aaafaf5df68b'
            '739cb1cfb718ad154d242f232bf4531c85f540374954ba3e3646d3fce3538a0c'
            'ba5b52b5a83072398ad245c167375e96043bab114f8990ddc104ba56ce7439a5'
            'addc32c89bf874f5bb608e79383c1cedcb0c6bd2ac4c382790a45beabe2a537f'
            'c887167e1976b09726d91d11b65d614e5757eb03a19120decadc6ace63e1319d'
            'e32b62d0fa0f45d6a2e7022183080b3c7d3d72a39a17943682bfd4c4994acea8'
            '1ffac701f2085bac5185b6c321b2bb066fc5e10e239157426346af58b2b4679e'
            '7d6f3a49f61457aca316fca75967992384add8f6b6d4ba19a3be67982b519780'
            'a8dc8a55ae1e0571a5deb45a291a9e6df3149917bae4bcabb62579378625eb35'
            '5cde4b5021ffa2680f2e2d27b8e664b7b8799e521c9879c84889e32057db2178'
            '2c18e6a44dbc1bb4a0a9d910b1a569cd034d7b095ddd011765b1b4f574ec0e5a'
            '20b31e8f558a0f64578334f86cf78859f29b05f4b8e5074dddc4f5af95bacf15'
            'f96f9446513043ab54181f0a370d6ab2108e0c612b467340cdace65afed20fd2'
            '0f1141a69614eb8dc8115c32ebcfca7782a2423552552e9175c5c4299f23d8fc'
            '5ac097a74e2fa4b9ab441f2eb73e703b29a3a4151aa8c04f9db7ec90f04761ad'
            '2c8674a37eca6209e6decd82eb72523b981c6647009d5846d787f753841b0a24'
            'f855573eb453f940c400dd49282d2a429bd7a8c2d0e8567c5b89320738242a5f'
            '0911704f146123af23c4a7664645483da46351fee0f189bc6a6847bb6bf3dde6'
            '60f68f73bf846bd5484859cfadadd256eb955f50d045f47450b8c05e0af74e52'
            '2b6b30fda98ee23ab46308aadeb2372069155575a9961b645709be3575326c79'
            'f46fba720513a36433df4d17d8499c3bee6d8c459e869a3d833400228bfbf8a9'
            'f8067eaa0e67035ef63ef2d487719036fdd48579cd9e8f8bd7264932f567f666'
            'd92679259367851a210a4eba53c1156286d90c2e382906a03c8a79ff2990e8de'
            'bfbc8fc0cf20eb29a5cad2742c12113903f483a7ce78fa1ffe5c7ac6cc3b286e'
            '9f2f6ff0db668c9207c3e382b0e982f96cf099db4508090795d7f51d4e67aa05'
            'c0b7acff95ef7d508ba0219ddd89cfe9ae4854359de3ce56bf329b224d248254'
            '316f6d436a5864b9a1390c216e23adfb312fa83b4c0694288058cb0108110444'
            'a95828c4707b2eb42d9a5301a47b7b882a72e215334e4b915c311a13729b056f'
            'dc0bd9444c8bd84cfcf12c086f3c04e3a8e48114f6f20654734482e4297d78aa'
            'f9dab47bcec4a5e04ce6c91b07bee671c1a4cfac00cdb73a91a132d3b3f1815d'
            '50651ec85d461540d8e295a6c91f534652881857e72f6cfe5ff8b329b4967b07'
            'd0a7928333c3dd3c5f7e6edd215b1c3b6c8e645ce090ed9540856a12e92e0b23'
            'deeca28ae396b402d232cda47d08b78ac8d7139bd7eb64ee1fe3fda3452ad4eb'
            '77fbb3d0de95c2744b5d01c9a365bd4b2357230f8562bb0eca1f37cab15b42cb'
            'cb976ea6d084ac788a2321caa641c81fe4547feab883df7c195512f645120edc'
            '9b1fa15f4ee31399f7b5e4ceaf37f0dd85ac7705c83c2224549aad62348f9a3b'
            '133eb9e6433835dd9863ff9f8fb40df61489f5416f2934336384d5ebabe8e218'
            '98ca365574536bb5ae1b00d0e449d3c6812ab21faccc42efbd75569963cb8e25'
            '6a66427cd5d5a12470f6a1df3fcf66b963292b0c17da9cec6ac7e2be06efc092'
            '377573cf5e5d23a4997c65e874721a73433f403e54d6b8e0b68220753e2cd118'
            '7ce1ecde11560d1b7dd28ffffeba9a3e68afbd2487dfbe8bce3df816c55eba8e'
            '9387f1da66c9f123b6ced833bf191c024ec3ea035cb028e26914322a18453d78'
            '88f64be6932267e7f8972bbaf357bfeeddf3f48d897ec45f857e473b7960bad8'
            '356f8f88e3c9caf72a24b32de71b0cca895291dc8991601570152d1e65667e63'
            '12f3195f6c5ceafffcc33bffa5263e8005da95e3cd2c4959db0cb8dd2b46d2e7'
            'c865de4fef46ab9fa108551cd8d4dc64919c238ae7980323a68a1b55b4f1af38'
            'fd6a5e069455d113001444f7f81067211d7b80fc44ea8039346814a0dcdc999a'
            '5e81facd2ebd6a09b53f55c11d1767aecf45b4aea48dc0e17be4e44a78697356'
            '97daf9a5d0609c5f316b150427e8cb67504b3da5753499c1b98c81cdc9d551ba'
            '25584db4da64cf12913cb6a00942f17602ae082499710c6c9ec9655bf68969f0'
            '3552aa3d39261959b9ac00c296f9a879783c464531d690493c8d0b250e4f7d68'
            '9890b5ea3a901db2bbdbb8de7eec35587005799a4563b3994fdb9ec05db19d6b'
            '5fc9d1d9ec6bd21ec838a3254406c307f8aed28eb32a9bf8efa179138835e45f'
            '7eb364b990cffe72600498cc9a84c8ede9d40abeb7112397337ae5ba2851834b'
            'ad3a171ebaf533ef69a9cfa44a46997618c19467760dec8b411e3bab53911b86'
            'aee5d6f0b40f1eca63089eca9dc066251115c7c6ddeaa7a15e6d360e4293fc9b'
            '28a170b6c36f5a6a8a3e7114fe25038371dbfa9f1cef26db8d8dec779919c902'
            '39ee99c6fc858c518d991455c38076bdee0a001c1ed3760be6558324edcefb69'
            '1a44aeba9d51b01eafdda2b405d7c5b9b37569258485416397607ba7736e4d49'
            '63c6815b2608facccfc8a8f8f23c2329ad611e7cad242e84d61ffdc508a1165c'
            '3a09ea327710fe379c1d317218b4d83f2fb1a67d6585f28bb0c5cfe0e99ba3c0'
            'c225e3e9f42c66b405deb189e9fdb4a0ce958ecf7d2f41255efaf3fe6f9a9bfa'
            '8996780e7b901128132fa4078b610429a7dd6cf5a3857447077359a3f9c357b7'
            '83956376f96efa78bde16e5e5edf1d6ee8d92aad1c95685cd49f38c6056f3678'
            '2b5a3ddbf0723f3fc4140dbfc2f54729f52cfb46c1268c3a8427146b4612b34e'
            '3bd76739ac03d187edc3e8a0504754736776882f4cd608502e924776c01c3dba')
