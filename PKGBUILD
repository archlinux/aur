# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=102.0a1
pkgver=102.0a1.20220503094208+h03cd547ca0b9
pkgrel=2
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

  install -Dm644 "firefox-i18n-$_pkgver-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('f5706c3a2c6e86fdaa4dd5d34922d2ed151bc9d220750b2bf8c57ea21fa80d79'
            '97668df91d37840aa1150b7d6f2eff8784a79411d5b5fb5a301068d25aaba29c'
            '9c334d88bca351aa4ff9e245010f21b9b05c0869b9ce15eb43f0c1aef11fba19'
            '7b509b320695a13fa05a6bf07087805dec409141f6b033c044477a4ba4a44c08'
            '1cd593729196bca652442325ed3368c3a8493f13fd67caeaa1c02cfe42e00867'
            '580c04952bae4ac622e900c311e92d49f55b475138717cfe11ee4342f5f9817f'
            '50c020608a348b3718544e952f1dc0790669e96b32114bf07d1075b1b5d00467'
            '9a229ca63ce7530b03e0e62e4131c7e889c3a6075da2cfd1a63cbb635d2f0245'
            '667b30c0457c8c557aa3971942477a51a89f9833670aefd403c0d285446fdd35'
            'b2b466344d1aab0607cb808c15405e106df2f0bb2ef805503c8804a4dc413e0c'
            '845cf15ba5fde5951fd776df12e081dba1fcf2c15887cd46644ed2a3f6181090'
            '98c422c66e3fb3e4e47a3eca4c26ac151358b859dc0525e3c3bff37bf5be0635'
            '01d86b2fdd4af8b737603a5ce58ced74e8e924ed75c87044cbaeed3063021728'
            '0c1a50983cb85e7bdba3df3afd9d1a5ba544a5a02193b98fc6296fc47ffe9eb7'
            '1dd3f9a7f19701b6009f7c54d186181903534c19edbbaf0276527c53cf95c688'
            '077b5b4ccb3d5899487dfb88d20bb91bf2d6d1756159ca8bbb9d2075c1bdf7c6'
            '7fc41317bb33b5c768543b084d5979b0800d4a33f4259296fbd5f4c2dd64f87b'
            'a372a2a1880443e9d390588b6c4a9831d33f4ff369720eeeebfce25df2265416'
            '8944b9a1453584c23b2b65f9e27d41f404ddba8370097f0ba2f659c053db8f9a'
            'd00c58da41db0728bcd5898e3ee51d4b3382144363dd87f3553d7121d9d31515'
            '69c5e1a8ade7d4bc74ba3e4e8e43c2d965c019c4f7af36800abeaddc99202727'
            '9e7017d7dd1d61c64cfb842e3d83492f9aa5b7565ddcc0af442847e15a2f81a8'
            '33f93a11a0c04c6e45668da34e3be5d227b2c8d33085af6592421857dfe0e639'
            '9fb358d5ba774b0cf1f0b08ea7a8893862c63a19a1171d34fb9a9032f114f606'
            '0e665c3a93d071612cd1ccc8b75d1ba727b9b24283d199ea530d427cd77eacf6'
            '2a732c66c09f8cdcae94260ee79f2d44bd252317ce95f7cac074092a485a5ef8'
            '7bb778faa8ff3a23a41556450b4359dce1f637847b3aaa0851f8c30fe0279ee3'
            '3688f0538d0771ca57f97d9b2baed8c3d3a3c1271609d032d153c868f8c9cb39'
            'f461a02831e3b39514bddfa2205c08c0ca666e999f5fdda6d3e0e3c4fc930c05'
            'f715f42e0b261438231a716db9723fdd84c38af90894677ac1efd2f395ad4654'
            '9f2960e3a50252b026405dd6806d0174196a24e0febc2ae6a4dde3548e16256a'
            'cb523d57475dd40850c95d536a6e58e2ba34583a765cf0cffaf48e5269c81a57'
            'a4f26ff8932e06128575544062cba9449d7fec00077ec523132af9a404ca9b79'
            '7fbde70b625298d79908b6df7011e46725b431bda9bbbcc464d7b4582175da03'
            'bcfc65070e1de0727cf6e903249b0352b4ad653c18ba21a3bc29018f5586354f'
            'd97fd5ee4ca8e19f32929fe944796369d0061af8ca52850ff2a2dc84fed69c07'
            'c304f0155311155537e7f4c89bab5c2f16781e87f1010f32f992d70e8e88178f'
            'ed1061af249f25277a184402cf50ff91d9f20dc3c03c24f15cd1e3d67909d9ac'
            '52ccb07b78600e5fb725395dda66dad62fe6cd1b68e3e2c7efe0196622eba8c3'
            '35a8147b7d870dd17be4323709326fdde8c505b20cd25d7470c81afcaa7bfd28'
            'cd84fe50cc029052bdbfd399f45d8b84001ff186a55d122a3c97d4e72c0dcdb2'
            '8c7ac50446f871f25ec30bcd37fbe1b352bbe6e8b12d7086bfcb23195de936c1'
            'd7e76583712de08f1b0f79a12b0d2e2fbda1ba97361e8c75372a776d213f6b7e'
            '376bbeb712b2a61a8826206ffc4102394a18471ec9149ad393a0287ac4ab09c0'
            'ce301b2449e103dced05ff0e7cc1b59980c45e57e2177ae388da79c4ec1b6c91'
            '733911afec9685b917398af20d539d25c50c9e81cc2224087ae5d2c1f74ee85f'
            '5ec00d34bb7bcc256cde0282d5127a1f2e87054f0aa41c8f5c49624033803469'
            'bf82b689198bfb4782e0b1215e7bcb7887f16dc8ce753e25949c3e6f08312e7c'
            '0387f24f1ea7b6bc5d653e7a429eaa4ebaccb49afe067fedc69b655b0d880028'
            '132f53b3fcd3ccf9f4ddd87c072eff4a1fb2e96113227f8ef994378ef12a5eec'
            'd85ab6fc2261470c81ffeb3797c4a060e87bc90adf684fe26ecef8767ab7be06'
            '2838c733b4cfffd2e31dadf3f2991376a1e7e3f2f8d0b6579b47b524835fb2e2'
            'b432fc515903e44f19f42b48c2877af17d150be4155be0cbb6d59ba9b98198a4'
            'a28fc605fd2ce1797cf3ceb915f8b8f4b5d8f92dfd289015677bf0f4a582c005'
            'a6cebd4897077de705aebed6b547c4e49c6770339a7be23ca946d4d5f03d9f08'
            'c61ffc9d454348e3b0a80e6cb66871499b05768421bf67a4c25285fbdc2cdbfb'
            '91a06732bec36a19c1ebc17664c9daeb3a6ffd7bf390dd24ed261b0252beb7c0'
            '6363fed78bb6ad4ed9602aed1faa5866a35e176c7d1f987560ff43eaf6ac19a7'
            'bfeac91824f50c665e31b0b1e27390e73076859bb2b4160956f3ffb1650ebccb'
            '7e8eb9b1763adb582889d5d6b2fa5b987b9ea4b999e910daad3056c9992d67c8'
            '93dbe760493df3bbf4407072a1e73034d41b36aed16eb6681d42823b09946034'
            'a4561702e4bdaf4aea1cd9f1865142bbe9fc5cd96e98419bdcbdc50fff9083c5'
            'd7c74a34fb5ee73b45378435e99288f044dfddb9adfea617268ff496218fa66d'
            '6e56659d0814455c14d739744c1a77a31cc8e17691ee0e2cc1095082a0e97790'
            'e45abc57de40c1f6c080a1f479a0ca0f176d6f4cb44417e41a227b92a9f94559'
            'f8b20064ff6648727099089dcdfefec606f7c108672b7d3b277de85c40c74e8d'
            '46b382a850074e170d08d00514bf864769225d08e7bfee53cbd20232c3e38d5b'
            'f06419eced7c28a5a81b184fa8a6a1b7265a15ae27b08aa4daaf0eb2dfe06570'
            'fbf60f6a8f1fc744e43931f7837c097917f4e8d98e2a5a6e57800a16fc0cb587'
            '94ee6da6efffc3f5d53b529b69e53210774d8de07bc04794e76196af1bf38daf'
            'e96043f034456038c174a3e2e3cfb26abfd0f15e307d4f7478a9a7e118eba84f'
            'bea818ec2f9762abb56ab15a4dc7c36bf0674ed90a64e6986dbb4ce628f164b5'
            'f5999e57e460a6d3c3d2758b2a9fc74babf2a6e4cc9be4780b5732386a14e904'
            '7e22f8bc77ff13e249d7cee96d1976c3dd9997f14b1f51ae40a8e19893ba7f06'
            '0ad1275596d1211466f6b0d88ee03db5bd5c3b2c8a45bc17a72693fad03d8295'
            'd317cdc599ec483846617bc6922af6ae51a16f02c42d86b8290e2180ce409f0d'
            '068d81ed02dcb6881a50fb6687f06f1de2b1ad0e5551e90d77f0b73e1f90d73b'
            'ff90e4c7f8639ea728ec54080eea1a761b5ba6bdbc9330601b73e2e8a872b7c1'
            'd92f13db5794738dd0016e99234363b2cb067fab15d32058084b2e6ed0b0d07d'
            'aeca5fc522647870d09636014d0a0e2612e21ef7002f5a897c84c5ce345389b0'
            'f272b4a935c9cca277179faede68d591c10bd422509c36e6871d4c1d6785856d'
            '0fd3a600e159b6979eb86b764c5bb25a2eb83fa7ca4c9b0f98c0cf8dcc064e91'
            'a7d13c8fcbc0fdd0c6ae126a98c6ca4e6094ea38ee831c50293b36c6cddbf71c'
            'dcbf1e3f006b59f9f6c7f2bb6a877acfe1dd50bc7b0863503a475a3aa734600c'
            '4737f1a79b237794f59939421e9f7d5af387b8b18e009f1bc9768cb821ea8371'
            '3f5a9acda6f4f826438e3855dfddbd6ee9b8545ad52e7a67fb83de02f653bc1a'
            '98449e38ee7a047a14a2aa79d326a35271b5597cd3801dd0239993d0f139c388'
            '4ea47b983bdd5143c25987e5b87f92972cf5837b8e75a5ca58775faa47d7a1e4'
            '8913a3ccbf8454c6fc06fea51a26149f2acd1eb2d8b014eab8c250af955734b2'
            '7c66f906d12707c2356b16296935b4cb5a2ad409ab2f780c818aaec7e0aea506'
            'aeab47cd9c02b8fd8aac04038924f4e73f19bdab610bf68061899ddb1b5f1fbe'
            '0bb25ba6e46cb648d410176c2c22ac07a07013412c7d4d26716df24d93d104f7'
            'ddfedf4b382d12b6c845d03d5bc129f7f332846fd7c58a4996c38407dd0d6c64'
            '740c5c4c5ecba8b81992dc5bdc452e93657381c8d14354975cf9c06a818c4732'
            'becf614c73928fcb7b1b08d6359c185f3ce92b15f9796d9cb308191e48f9339f')
