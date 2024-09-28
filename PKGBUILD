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

pkgver=132.0a1.20240927.213849

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

sha256sums=('81eabe5e1b6e413fd78bef9085635e3320f27c040a79a4b8e3a102547eb2f248'
            '481991615d5522d39886d32c00746cac0d58627e73eae033851e9505d102b70f'
            '10ef9256e985c05129cfb2ea267bfb1a8e08c7735baa9b1c03a2a4477f8b395a'
            '315cbabfcffe8a7da9af529fa66c2aaaf31436ed617cc1934ee06de7b79abec2'
            '9646690fd641be889ec2dd43fe4d530f77f26fd9b99d1b3157b2ae9cdc2e8d79'
            '8937a32cdc3d0911d85df2a8dce22b119734b12bed187eaf3184a18d09c54287'
            'f96950e456a647bedb4d0e6cf4f63684c812fa60c35b54b8d8b923ea29c345c3'
            '540198a6b63d709f7ec34a50b1559a164dc1fbd533a5058aa5a4724b646ce471'
            '04ecd8470adf9d2c189d689cf724658a1145074aa2d91cc14246b452a96c4454'
            '999be86a530d688e8cbc592b1a8de92f5e746b66b8cd78703c74a000431d42f3'
            '31d4df75af76ed122333a7b37fda50392ea0a4da2576fcfdd7cfa119cf7a5fd7'
            '6e9ad33116752c83feb11ddaab1caaaabe908b5ff21dc18712af8430b247957c'
            'f3d6d4d46347c0857b1be07ccb60d8b1d47dc8b283e430181bbf079f384f0bca'
            '6b997bc87fd7fbf301cb0cbe1e4da853977643a85d3416d2c64aa54f6247eac2'
            '0c216ac331abcca9b8ef17bace2ee781e4b858eaf689d70174d71c9c5b2f440c'
            '85b503b6e123ba2ecee3e32b95a7a9f49bdb2d6af8d34f167e70c5bbbeb4097f'
            '8a73a0f78bb24c8637a1fb1d3dab6860fb2d5579a3909d52d7c4410ab7e13731'
            'd6de9e79c1fb5416ed17e8ad62620d09e4a05a7e49691187e7ca239b89740c96'
            'a8866ba8c3238a2729dfc25ddfdb168b3ee941bb22110fb913ca7d2e52d44451'
            'ca90eefb0740c721fbd00a10ac232485427be28538ff458472b5ce8e562a1d14'
            '2103db8ff4d6cd9a04a35adc9524ac40abcf733b0c7795b672e7a1c808bc9027'
            '354411bcc0a06263a7875b7adbb61fbfc512f936c06b3a49c7648d66aba68085'
            '98570eb2bcdcbb091ab4d5f5e31e4c96791463cb957ffd0927d90c745833c5c6'
            '51d30d3cc4670c4aff47ff200537c374f46f33ff57444754acead7826729deb0'
            '1f32f339173dea21a0446430b8a43eb26cf0fcae613523aa300bf7de5fe6a841'
            '8890e8b8b2ba7b1307d05b1055ee18c30d05766af6bfd1f765d04239ece35086'
            '9b38e409ebe78765fb68fd9a82fcdade0f418cabac6a55907359c0be138da0f2'
            '953372180101e46ea8dc4bbc97fcaddb171c62fa4970099675b76f85063456d1'
            'b93935f6f2b1329fc9ac79184fcb5f2f79567b92cc430772bea5f8c339b08b49'
            '69e5af80d31823cf14790eda09b878ce00bab09ba2b01d8d7f264c845e80818f'
            'd54e441b235f9454d9f82987e74b276b4d654ead4e9697e29018efd1cb07b3ad'
            '58c42ff2fd3448681572e376db89adfca577157863c3978451d493e1c055ca38'
            '697e2caad71fd4652d9aca6d7508db3eb0d069afcc6a86004ca1ac6e13af1f67'
            'cfdfa3830f05d535b0dfbcf5f8c1a37585797d2bf2222f49c13b13039eaf20d2'
            '7e2ed5564035fbd15912613ef8901c74d806be68bb14481907d455f678fcceb5'
            '5adc37a1ab4a7b461d525fe2117abe3d443c580a7f02c6aee5b8b53220931f0d'
            'c5711cf806b545af9c651b1025f60c3d2a28dcdc58ad392149bc2867f9abf569'
            '2db58b1aaf7390f21226253d167521d628eacddaa6f0c4ece5e9a9c9aaa7faa9'
            'fccefe248c58a3abecf0dc1400bfc6a7f67cbe363b755c9cf72c1bd8f31b8120'
            '4261b6c513779d0226518505b71b75cf29728cd170c50a3a7d460d28aa17f5d7'
            '2a65743c5f94d76a37e977a8393bda25b8d5f7f179921b0d1e3d355bb742045e'
            '4fcbfaf1dc963f6489a72900390bf86c7c095c11d1cf3e9aa708e006e368643b'
            '75c8a608bc6df081ab8773f323be1c73b8fa25824e68e8b0d9888530e505044b'
            '6d0216d9911bcfc1f24fd12c7e6b623fd06e4ab347a6b2915abce6c4358dcd0c'
            '4357d86f5a8e3abdc875d6df64da81e19d3d97feeed789169805cace42a402a3'
            'b53fdff003e1a09c77667003fd72541f5c0d5f6605c3b032f481fe0dd8ccdb43'
            '61eb3e0bfc4c4397e7ee674d5084a745ac4dab3c0a6d90925bb5c692b8b21774'
            'd519c2e8cb98e79fc1888d4ff05c1b787e2e7b60b0f2e84b2d53a18235b09407'
            'cfbf049bef3661b3a1f828510696c8dcc02f4870e779e5f1432fdb711bb15cad'
            '7abbf74691d16d4568b2ae35811b46b996cf74c8314cbf6416e25def8b331c36'
            '70c5f8083b437d0b8bcf97a292fd2ebd9e6768fc0f0aab9b42bcff142d8908df'
            'dcf1f14fbf3763c07e79156c78042bc44fdf3fba9c8f7aad887cc4bed137c004'
            '58c6baf37ab958e7223e8d689a0917f52254914fb79e8d48cf86dde5c892bef1'
            'b140e781c75834b377359ea61bdb12eeb1898bdc651734565e5f0ad448a72bde'
            '5e0c5ebaa64b3b63cf4a1b32c614450c75de4cd92851acaa9c6e175d59d50c07'
            'd4bf044fa6e7905f99ba6a5e17e6175083eab297f3a7fc4ff8605cbb6d34dd93'
            'c3829694f1401591b6b24af5725b0fe8b2cb6ccbb37a050a6e7178b9a2b7ed3f'
            '9e0255f7be198631d53301558416fe2b56314b88c88387b678bf44a89cb0dce5'
            'a3de54a3f6ba7d9744e81d008cc4dc5690ba09510981071babf7c9aa5a2aea51'
            '4718c3f1d46f31fdbf07c07f3175f166d7a70fbd5aa992b15d33c04b05b284a7'
            '069b00996e31d4beb55037644034e8de439804b6179e9f3d363f8bf21c34b75f'
            'b72016404dc4db23081fe23b4aa15b4834c721f1edebeb322a2b1f8a77fb67ab'
            '007485fadd1f6412f980fa9dce6a2ffa9cbdcf424ae51cd6f3d9e58828f3e61e'
            '1fc4b301c2888b18c58b730c8897af2bdad378417b52adc978ae55c2625bbcda'
            'dbcfd8b625841f9fa74fd6d7d626d0f29c8ec32e76dec2b1e344b393bb050561'
            'e5b0d6cc90d6eb307d5ef8fb4c17e2feff9e32b7c5e3c2f85e1e4ac3911406c0'
            'afa3b642b99620df9c42accb96a6c9375cab7af942e6bb763482d9509939e3bd'
            '1d24e2f3323e18a89c6b0ad7e8838704c2cba80e5e7a3011a89de972ac0bea2d'
            'f7b02d3c6cb951710a6d55ccfa8fd319093e6df47f3fc8da7f8512a623e5e5e9'
            '5e2d8a7b3339e0a6b45aed109dd4f9e373b4e6a62a70e184697651277ad0b2e1'
            '54e23aa5732d1e2033a7bcbf612db99b78c2fb3e6e002595e1eeda3fc86a5429'
            'ff6f33253202885893fb08f71bfa6f2572736c9e4b5d105dc418d79b66e5b2c6'
            'c77ca61994e9ab8878658882862f532baed1cbe76f1ea42a5575fd5e1e8611bb'
            '18f61244bf7dad4c97774e93247f5eb7c8abdc532f72e4c28b599a4fd2e8a240'
            'b19da40cf5ee4140a74c52dd4fc321c75ae46c2bedce5b8007a904c4496de207'
            'f15f179ce5cf54a491e2ee47d3c8b87afab5dc23c91620b6d6d35a7d51e0d1a8'
            '92a55a8588f484df32592ddd751520aae88d7bcb1f5066d19398cd00e4f3d0b9'
            'd104a0914f2c46b76c7025ac7829f7dbe54453d55f2e5c8f2519147479ed0fd8'
            '8b3b4cdd466079fed65dc7c7b7cf47ee38aa268c9c68fce2634d6854ecf48602'
            '606287f666dab09b27be9ea47f17adb20b7a89a946dc5730cd2022699772caf6'
            '4b9d5ad09bb4b5f8e3a0a56dfc829eb0d2135978f1a5053fcbea4dd098ba41cb'
            '4e114c254b359b3cbcf1048881426776ac1b91100d0358d71d50003e220b92b6'
            'd805dcf15118d08e0aab2fa0d69a479bd84061f07a4e48a16d2996e928fd833b'
            '13599b3310334367c005181d176c27da02bf7ff83efc3659663c5df3cc674f61'
            '13b8b9d27b2d3a983696241bfdce05270bd374e1e792285bf9dfb56580f0d6f3'
            '28c461f91e0f159582877700f721e00898ed9849a0376b9a2b1dc2196be97b54'
            'c93f3bf4a1c6f05ede3540062779ee4ab02c95d1cb66db167061ca9171bc8842'
            'af0082fec4b8c88d9b1bf81531d5bbfe7784188ae2bdc0ba6fdf610714547507'
            '8db0625184e61abf836b3f47fba4a6d52621ca0b279651b1e93ce7a0d4cdb03d'
            '1d45ab914c8c8efa147c473f88dde1d115561365f09e3d769ef934bf040be844'
            '92fb1d2472a9322a9f0d7683e14d0e83558247f3fdfe52940ef764a2671baee5'
            '8f03f81684fd35d8599d933f06d2d4ee26267ce7d84774885285d0d6039e15da'
            '63457826e1b8d74ab877692ca6aa67503341bd6269341eaad11129832cd13607'
            '9b15ed4b1f401b53a679afba24357aafb27be6d8ffdb33db0ef98d790ab4c21a'
            'e349bda0848a9a591755a191fb81d704ababea47b83d6f8601fd775dfc687067')
