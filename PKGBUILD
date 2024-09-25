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

pkgver=132.0a1.20240924.212303

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

sha256sums=('eccf0f457870792ebd5d1f097fa0ca59a0ea35b61abf42cae06faf2cf5d9a886'
            '64ceb6c111089cf30ef0722a0cfb3bce32c9366fa2df1d50b39b24569a01ff89'
            '135c38d1791a1d8a573303225dd9a2a3a7493674de9461c20a8d33ff8b6c9f71'
            'c77eeb92ba3e37645ffdb0b5fe8e8faf520b7d3f8332a45cd2ad37ec7067b7b2'
            '5e3f8712a86a71ab01240e2c1c330239521ea3261aea671926c897baa0119ea1'
            '97ca7964920e79fe6665f76f8cd289f46973dbfdffba4e7a4a1d0717e5016a52'
            'fceecfc8a8ee9cb377d907f854daa64c21d7941333cd148ce0b7be2c73124578'
            '83f22d896b4b74746e1a7e25a29537e1b7c662426b6a021e1c2281d054ff2cc0'
            '9c511ce21cc4d3605aa062d56bfaba6fbe94cf102e30192e5705d35f744af170'
            '74cbe01ae5a0aac99b83e7ce456a4ac1d84569e4c0b1847327441ec65526c309'
            '5ee82523b7a0bce794ccf41f808294ac0fd5f74bf3f65f71d29b42a5fc503f3a'
            'a5c149c1c8d3f5ee5902d7a8d02b36e533ab9276c2fc00dd09c9a09773935680'
            '886b6b19540959491f43208565b2621019cbf2d33b3a6af7b96a5d521d4696fa'
            '367b34c032dd8810ea1079631d181f4a4adf4099550a49193799d88c24f2cf92'
            'd4441abde9fd8aff670a543f017879c6c8fe0977ada746e0c586990f67e7b2cf'
            'fdf454c6de00ade59bfd1df798d4c019a53ce2a82cc75ac4b475d802f858a78c'
            'e1920f67c47a71d87253143a19a26ee82f87be7f252b84eb45fc5fbb0603bfd7'
            'bee54ed086c622f2cb96e65c2486b6ce18267c2f21439707b7050d90c814a862'
            '22addd309594b0681f749ee08886cbfacf8da29db5f102109a61c5bfc014c3e8'
            '1887e8493db4c0ef1b96238e25ea425445ab69d3a63606808cc4970e31939f42'
            '1ea0da6ac42ebf7e2917634543b47ce814ae6a4c2e154785ddbbabb90f9f8438'
            '5c86cae7bb01ffc1d15701a90ddd03a9992011a2f9a041881716f0e60ee7cb63'
            '936ada25937b8d2681c967a5d4589c8070fc77a685b02d8fc81a460b812c3852'
            '10202c0956ba7efba8517ab3204a675e6b9be5364cf88b205ca48ceced5065d1'
            '1e612e9feb9ddac74e177f6856161c38273bc8d7bed5b9f39a6fac1e35f11ee6'
            '2551b163d49cf0e68b38171e767bf9d6d2d798cfa4abf2b35622a2e1d7a42d09'
            '0fd4b5e40f0ca06b69a07503c199a787094e9ad72ec8a7c464bd14007bb2c4bc'
            '667cde250caeb69df77de958608486911cc47638c1ec141b439f74636847e1e1'
            '99aae2a16c562a4a3830a32d5f5afe5feaf2d531b31e7793799eec3a80a151a3'
            '94e064b51435ebc75617d2e83cab46b6d36ccd68f52bf8670f6b87a60ea10eab'
            '94e316d6f10814f384f160a568974b485d586a4ca1dbf6184173c4d3b8c729ce'
            '691105fab5abf599aa093d77c1be74dad7936aa69098cd1c40c1e74fdc8fe0d4'
            '2717ac12c67277485c9e8d87409048e540d920ee668d91e579a8cefdd03c978e'
            '5a933161cec112281123ee3ab8090a7d171225a1621e7881d99005e26cf194ea'
            'c87b8a2fc93fb96da22cec584bcd4b1d173267cb859974593477a3d865a8e62f'
            '9229e17ce37c6271781cad97ccb8cbaddfdacebb2385f8d90a1d48808d4da7af'
            '0b03c57d74fe418b5cb8e90d8c617dfafc81a503f44dfa987a8e6a26b182eaf6'
            '61c3144fcc1cb69a12f252e37f6efc6a138d77bf423e7c73d2d4a05ac2703615'
            'ee2ebf88cc0f7a284266c3bb4069b024ef02b3e5a60764e93e12c9ab2d62eb04'
            '99a9d3dc00f1bd06d5995e6660196fa7c0f88559dab87e5759515d210bf2adef'
            'a1b3a66a39765748ed941a18ae615cfb0b93c5930e83efb531763a51fd8d0851'
            'c0bf5cd17ffec31226257c37e77b547fcde4d5712e3366e615a7d8148fb3d4f6'
            '71ed986eadabccb3443639e734ca0e48db730ec81ee273cc6b00530ed3fd35ff'
            'c2f5b96cbb1339e906d88540343d596a10660d34e3a7c326c64991d546b99de0'
            '341f34afe6b255f3975c32b5b6d91796278502ea05087ea3a13a8e8b72c12bfd'
            '1f53da4c92bb0b4bc8137893e28248ef88dab731744347ab145481e00204fe05'
            'f564c91e37483da7f8cdef5aa5997dd8a68a7ecd7a6760cead445d5c0cd0f2ee'
            '533ee815d1193895b73e2580e11cf276fe59a947ea35ce418a2ab2a47c294b8f'
            '65760659a1f7b79f594cf432dd297a682e636b58116aab9acc33a8fc015c0f5d'
            '1276947f133a3e09d6858134b9e077313a624b19ee03a385646d948172135d31'
            '28224018a601abfb6f28823aa318944afb071b68eebb63001b4370504af470b1'
            '594316d86f618ec4733fa0f172e1cc64bd475c0df775f5b05aed222ec1448ca6'
            '14d95f609eca3ed55fa31ae45e59757fa11410143c783d82ddfd8cd4053a1415'
            'eeb0511b85ab23b76a1874969984d28a4aaf43367ab720fa9ef902554e53eba0'
            '1ca3fe42a4b79d4a8de32081b94b570a3d8468b3089ba77f4563ce8a54a0e6c0'
            '61e1201083d224a6890f696f8566a944e0ad44277d40958d767f63191e7f59aa'
            '1ad7ab46d793a56599f288dd2b126d3719aeb5b8c94a3568eb12a4c3a94fa962'
            '75ce99b8053c825ff81b7445086769b283dadeb601e3b828b75a9606f2170f52'
            '9da93734cf52ba507bf7f8bfffbc9437dfbfbe3d8e043fedde73e9dbef221801'
            '77979d87040bc162cd51a99c377a1e802aa3058ee1ec2b6199d7fc499d99e29b'
            'e38cb6a0c3453011c7e35a8937e920f0c96478fd898166c792fc44d482944825'
            'c5d65f4f7111d8072b003c8e55c7e299f7c8d5912dc3373c9df8030b6a76f494'
            '35111c246a25e8c30b5689994be67d3adcd67a0f71042d91e41923876d6838fd'
            '779061bd70029fc23e8042218aa20c6a12416d3d925446b605b8e1abfa9d7c30'
            'bb42b3344fcbf81c393c9bcb534f87aeeb767a06c1f14bdd079ef283a78886c8'
            '0b25993eae57f19f6cfd676fc26110c8d5b19ac113366835db4f1d82e7c165d2'
            '8e8f6a8dabd4d0da252bb4b9ad991778d921ae81fe9b6823405a445cfe1942e1'
            '9629fde29ac599f714e1d796e5318c145991de0149c958aacb8ccc473f2ec12e'
            '197a2f467913277b86e72aa574a895187a5d058fa1d53e644e0b8943525495c7'
            'e81dc89fbc439d1b1ec07ad90aad2fc3f71a5f485f8b9d8cf074b7a6fd447f09'
            'dfc60e93685dba8b2f9fddda73fd68ac9560a4ae47f298c519c4467ab17dfbe7'
            '9449b9e1ad0a451d7fe08bb5b6d10fb42cbec90a6f49ee326e6b57fdab9db0d2'
            '4512b50e2cee6c55a3de848c1d5349a4450d3c2bb455b11bd3cf15862a0a64fc'
            '26354e175336899768fefa5e191df2e746b627426e99e977ad210b02ccacb81d'
            '720ab32fd77ecbc5dfbd50e44b2bebbd2016a21169fe855b34cfdfa213b77512'
            '63e0b8d0c1865f019aa6cd2265b880d2e42c24c890226c1041f6ad7ec56d2626'
            '03c46d4ffd25a8d741c56956d653d6d228c054a821930bef89dc73005d66c682'
            '6e587b17d9cb47e46d7764f6014b1bd60aab790da7ae0d48dd0f7f641db137e8'
            '33e24c8159946b4d7f72bd5931080b68ea349d5833608ca701a221942edbdb06'
            'a203297b1a79e4c789be1971cd0e77230468d072660c296f2f4754f7d87dc962'
            '5d4e9e99640abdf31320effaed8abbd149276fe32a08c5434c7320d0bd713431'
            'd0d73fc63f52d5b5edb84adc7c4b571deccd83eb1016524238d1fc94aeafebc8'
            'db2c22f311085f2bd10bdab69f4760b6c46c366a6253333de483318b768bcec0'
            'd58370a2fd7abacf19cb8a4ef897b7c53084c39de1b3958da538c0fcc660f6ef'
            '595b0365caa2836d2576607c6293f6fe2ed42114547c8d61161b66b3663ad30f'
            '2b8a2dd4bcda23e3b61ce24433848bb809bbed3997ea45caa2ce8c52cdeccca8'
            '4d33bdf1f735639632d863f279c0ec1695201737521dea381e3394293c0bf924'
            '580cb200c2753f3cf5c61ee2de4935106937feccb2f6aa41960513e0a0a3e5af'
            '47d5facdfea356a2386b6251549167b54baf2d9797447fa7e7b0829b99ba1a24'
            '07232fa3cb96f8be31909e4854c4210d42c61b39d090af9c2f9999f37bec67bf'
            '7b3a56a178e39ac537b2331d9774e25857310fc40524fa22066a491eabe460b4'
            '10c2f6232eee6de619425e3641d616973979a46feffe45fb6af2fe1b536d4cc7'
            'af518b0296644169932ad1d29d21cb48ea37476c227328ce03393a329f0b1cdc'
            '45497bfdc7708c792934721cac5323bf0425e254ec3fdbabe3a5d0fe4fdd5a45'
            '70550c83141cc6a83572f86897caa36906e460250bf1ffe900acb0ae7bf3e9f2')
