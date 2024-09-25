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

pkgver=132.0a1.20240925.090641

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

sha256sums=('030c43aec7823ae36d3432dc156ab9c17792efe97506a4a193f6a7024506c479'
            'be418e3198c1deee64c62bc563fd33791a9095c28f31bf2cfb25d1ed832c5c14'
            '6f2958bc0ff4771d7de844d78dda5cc4a62f63037f9e77cddcc29c3880cbe883'
            'efcc0c15d4e978e6698bebf0ae1b243a5dceba3875e7aeb4c368eef1db819b0c'
            '151f09ab99208e0103af105a4ae88e1654c1edb74ccfda547996752066a3c8f2'
            '4773c770965f92286a2fcaf484303009c5dc0ebc790472cbf67292bdcd5966b4'
            '0854132537d39e9faea67f07f47621828245cfa7bc246f68d407526d9c64cd00'
            '9f0e5d28a4ec63eb6da6847d975b5eea2935cb1f8724de812fe9e7fa9bd68ae2'
            'd8f0e02be168d7ace9f163827aba15a99e200bbb09b02982da121fc160a9586e'
            '88ea622039d3ff5735dc47f1dd0fc1d0a034b919dcf29d78f85267ac0d9d0f2e'
            'c603923225cd22abe64f106bbd787eaf05a7f25762416bcdb8be45c1b1c35f81'
            '03c2621bb62d937d5cd46d5c1b10a6b03f852cf1e84f83d2cc236510525cfef3'
            '7f9906a21d28248eb8ba9fbf1bee8407880d057c4a728942372315e6a146ae3d'
            'b54ac5eaeb28917c5b5c093d4e7c8ec2e694a4e96141e28acb398d07058b7817'
            'bb51d31b5de973df6ba082fdf5d2f0bacb3282e8443fe73728427cb74b28c11e'
            '126d98e972454b280968d1b5202f8ebca959ecce1c7f2301caa4359b39c01e3c'
            'db33fd9c2f305cb835d8eec5f5758d9f89890a8ce2311b7aabffac3e20ae1eb8'
            '49942bf7ffbdd1cacd5068c8977ef316930ad57528e3636cc36a8175e224fb1d'
            '77d74a9e07f5e7a876977ba80b3d04d14129078187e6c940aa3ccb2251210c1d'
            'c45d32eb24e19010211f579421ad3852df9accc04f94cf5afefa6752484e1002'
            '3e644f39e982f5d93997f7d18cea4cea44467a4efacd387354cba508d7facab2'
            'b79dc43e8fc4bb1d1d25362e4cb99bcdbbe1adfd02ea8ed83d00c3d2957de12e'
            '4620f0f7a3fdc1b1a2e41f7e5691175d0da534f27a5db4c0ed1a3d66e65328f9'
            '2e5b2531a6986ef9999ad08a038cf0be045737cff928a2c8f88eeab0ae43ab33'
            '01bab450396692b9406977f64bd2b701efe8b52a2db91e1170cc31ffd44c3370'
            'f6550178526a8e58095ac078c943a14fe682a041e7ef388a6e8520e047c203af'
            'a5e5be66a276ebb06f4f198f75bd06d71240bdb10fd9cdf524fca39ee6827275'
            '0c24960db68df76141f2f50a68685c35a3258095c646bb71c5727f15e060184d'
            'd319af112bdf7caaf8d21f4117ab7213f77a7ce60b14cee97ed29841210cd343'
            '26b4721808b85871361fd62bd0f10a69a02d462ca003d9688c45348a142365a7'
            'b50b833a01f35b114d8ada90f3a3a766186a73951966fb1179d813cd09e8815d'
            '721b7e840be0ba9eae16587bddb1b3d7d16c744a3a4c6090ed27d0ef068fd964'
            '526291b75d9439daf59d614cdd7aaff9794efaac66ff12a9354fdc8314701be6'
            'c0a521f2e2da4b7de02a5eac2c72b5b703c10fb0732bc0f71d528d3b21d3ca5d'
            '5af96ed4f9e3ded7b1466beef1fbfbbdc34f3c21022dfb38ded53edcc78f23cc'
            '483cd8423b9badaaf1787f9fe4934fc2c6c5f8275b958d41a9f0e259cec93c81'
            '4d3cc70912a70967646a8f80acd2bf01d08d96e59b76da18f15824deb5ef3e4e'
            'f926f4041781ab82ae3da683511c19cd1ac6c93066977c7d9f08254f3005edb2'
            '1dffe83ec057e9d95c850873083b810703a8f31845b927c4fa9413f2d3023c70'
            '031e3053b27ef5e9c872a9c4eb149567c444609847bd84e02cde31ad297f0696'
            '5df271074dfc84cd612aabf23ac858ca40153d37d163662a0e356cafafcee158'
            '423448c1b9c1939f85568af728ab25c7dd3262c9aba63f08beee6f4e379f85c0'
            '9124fa76fac75fb365772afc2ef357e2e145906964f857f5410845b975123da1'
            'bf1184984380d8d5268e05b141a963ebdb90a3a952c5076eeeddd4bb0781e24b'
            '812355960d39f7d7b31dce0d1cf18a2f81834f68eb29cc1adbf1b9ab9ee4b420'
            'a6af57a368ee8b5b3e440faf03e8c3f09fb5a4a93504b151f283dcbf44662b7a'
            '11b117e3281c72661317abcff90d7720283fd994f1efcf20cd04d04ef140ec17'
            '48b6b35bdbb526ee6a0381a5e3f2b6692d819d1d20f6463836ce6dc8e508a424'
            '336e481dfc45c293ba949f77b8e4bd594227abb9dbdb46e67d7255c6573b0fb5'
            '7aa940c227fbfbcbb99025b4636788fafd9a060612a1030fae4fb951675eeda7'
            '5626a9550199d854ee0a900a4499de312c55f2b41c49c913de052901b8b417f6'
            '6eb8a30140442a340d80ebf12ae49ac1dc6abc437a512d018c7a79dd6aaee0ce'
            '40032808087ded8fd435dd70d8f7fd6216b13a04896b87bb796abdfd7a974bf8'
            '82ad2d8a2361fc6ee5918714aef1defa5ceba431d323e9347cf1dfc1d07f0011'
            '9e5fd73ea4f315fa37a7570ebb6142901fb3223c03b99a03764879e05fae09ad'
            '0ae30278dcf0b6041ee99d1752f1213f8a6d665cc4ba3d99eabc0f7a05b93b29'
            '4bdc325e71c585aec1df7c81ee31a6f2026ed827b4ce5a1a8167b9cc6fde31e0'
            '43c7be32d84cd5b2daec15951eb90729c4ca05a2555007f368b60fcab0a78c38'
            '794cb59c6e48eae2d6b6194bd9e2d56a973b80060d968667acf9e95d458422a6'
            'dd9e1ddc061080e08763437810d78e3da1e38aa69b79575949824ac55b9bd133'
            'eb0bd80c5916f4ce8ae62acf0cfe666cbd67a4e1e773740b67ea4c0efd415591'
            'd772a74fc9955a65e28c00e97416c8c68efb72b649d4e6c6bd2eaa9accf090d8'
            'db82de328d8fc3f6b42aba193dd4d1698ae806b2f8d8aa91e3e85516bdf9457b'
            '98bb5f710c21859a8d2ffeccdbf4ec3ede0ceba2c10b7ead2b7f7d1afb00a154'
            '760eada9235ae972704e85ba7a1719cc706702302c6ef08c6a37887e2b80fc7e'
            '0634ca203569aaab93383addbfeaa0ec36c1c1dd2b85a24bfe9cc6e59ba1604a'
            '502e902f70c94413f3e38179f235abcdaf65ad7b89f15e32e3f6322edcdd472f'
            '4f8e0f526e35dd01de4cd3c0ed58887bff72f47174cbce2158a8e0e3eaf01a1e'
            '75cfbb183b0495c10d93a8f89ef45cec94dd85dd6a2fb6aaf1d6518411fce47e'
            '789660d1cf5b4db81a92089b04ba49e6ea179e6ce43d9929ef938237333e09f8'
            'fb206420c48607cfd8f7318e1ab4ebda9936d381813bc903e81721e5c03a1c6d'
            'dd976b76d2794432e71b8aa101f9509f877aeea3c89bb7683acfe5ca9ff26538'
            '68ec8226f0d0224ee05301bf564f2c533288be9c1af3f5b1b5caf272ded5c1e1'
            '8cabd114f0e13bb3b9879c22d87f27fc92e9576cae6ea8aa8332ea85dea9c0d9'
            '4439d9e081dc3743ced58b23325ae130b944be4cec2ef75fcc10597b35d95796'
            'aa2e618fb3f4f75c0af168262620b4a5bf937816de1f026a1f0606d58dcf6f0b'
            '1ca98bc7c6d5f688a8ffa5b053c88fb69c6fad5a05af3a7aff83ef7c81bd6b51'
            '4593c7b4c8217d55ae5b4d7b1e6dd90dfacc1e18fc1e02c1bceb6143d56844a4'
            '8fa0a2f2d90a12389957b167ee07c248d85b7f9cf76993ac16db5f6bc9ae8f84'
            'b597b186d97f7af186fb234fa7b86786fa88e96413920fb01bdee096c7cb93fe'
            '3cc2058df89654d340ff7ae6e237a329672d36083560df7d7202fc8e7224305f'
            'c9bb62ac2827ea6e0c19045410b2c188952fbcef0db0d571f09e663d7e5e3223'
            '7c6557fc9e651a575491a2bb01f4db22b047e4f17b5d7227337e8d491e12cef1'
            'e7ee5dee3f791e12c0302ec1a04f4dff44775476a59fbf9c5d97d405e73adc19'
            '7e4d74fd65f5f0b8b464cdc2470ba07846f5a1222af9b0938933cede39b2d099'
            '087ca8b78829b3de4f728c3ce90d6dab0b37f30bbe71d09d98abd95beabc503e'
            'f76256235629f1a53af316b8e33c5104ef6b820eb46f8e6bd4473d9d925931e0'
            '998f3f26e30d300090884c3915c4e00587d82987b6337b156777987326dd9931'
            '99ddc1599a5926b86ffa383a2120482401c858877b6188aadd2e849984ab85a5'
            '434a73d5bc8040b6698354ae7fbb1012ab989cd5773782a69746b899e5f8d595'
            '380129c163053da9f4ff2e821fbd37d8cc8c88b608eaf0b2b4f7f8de1c9f80e5'
            'b6e20d2f8650dcd8de19b76635c37539a1230ae340c238d70d3e3abe7cd3567c'
            'ae5edb9b89b7ce1f543a9958d8bc06c413de17e556957cf80fc4d221d415807e'
            '0282dee8d65e13582c59c65816e23f5d2f0f553977f2602a7475831646fa34d7'
            '56ba42270aac9dad188c42eb558353087be0212796bc093267558878a7bc0583')
