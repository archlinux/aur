# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=101.0a1
pkgver=101.0a1.20220406093646+hcd1e11d59e12
pkgrel=1
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
#depends=("firefox-nightly>=$pkgver")

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

sha256sums=('d879d38b0c47ada55d57858d1861b89fb408d59103cfad8ce35ce783e4594e58'
            'd9002b40b8ab2296b070146213cce0dcd1a4a941ea50b46be3dc6044d5b53e16'
            '5dea4fa267dea9fe8590ab71a6d0040a976f09f3d6e16eff93c08a7b9de3a9b3'
            'c8ba31e2394ed06d2b5ca24eca57ca71e43ac4d31f973a20d2cfe4544d62329c'
            '7f7495313af8eb4e7a84c61cb7c15a582a53b242ab3cf5e548bbb3f64632fdf0'
            'ccbc54efa3280b30d8f005e4c759ecd2efe24b7d7a1b1de9714a2c7a4e3c2568'
            'a8012b5e6d8e01a82ad2da41318012e694853d1b50b7c03ee1514e981ff68cc0'
            '5978e0e4aaed74ea6567d9811dce9db67a96539aa475df654600103d9dc5a596'
            'ba5ab57ac15e6935853a4feb5c6bdacadc371e9c51a42fa731710388adbccb25'
            '970f3da9676448911730849a36151ae889fab6365c25254888f09fbdf62f6b37'
            '1c8002df39bac5d7b930231c119ff18766bea1c3728c151b18df0eca7d598c04'
            'f2c3665d3ad826cd3f3c13cb382ba1642e7bf42b4b68f505c6782ca895bbaeff'
            'df4871e21b1e1157b11ead2406150814834b2188f081919ec2bf528611bb3aa5'
            '7f7147ec6b56a1044c4eb8399288bdf982535cb49375bf80b8a103e330df717f'
            'cdb10e9cde0dbf9d582200f62075b64b803ff8b789bd234ea1fc864b43e1af9a'
            '3a92b2eec1940fe61caee92bda5b69dddeaa8b18b0b58e7b1881093cc093b734'
            '3647cc001c37c41edc9c436a6e54c9482b1fef31a72693ee9c9062e43157d305'
            '2878aede12b2e3e7c6ed2ad71e16494cf383789abb86c164d1b3510a846475d3'
            'dd4b8ebdd88c0950597f9c93964ae9d48497768c0b2778ed1992831e274509c7'
            '9fc4767069b03d1af0ae3183271b98c05901e7df54d84dd06cb9ba1e776493e0'
            'abe87f204ded678f36c8555f7c504fd77918c788476e7cfb83503323861de73d'
            '3b494eb6a3f5f3bd57605b9f2d906eb353cae412952784d1af24f8dd676c610e'
            '292f34424ffcbc9a729db0e1be054df171f0ae640c7ee5948cbbd7361433e060'
            'f4d7959da10acfc10f02bb7871ecbf7ea396a87ec70a8e11a41ba264efd23f02'
            '191b2c175c635f27cdb1f20a17d51129a60d005f10bc54cb980f9d47c2b7fce5'
            '11dadb88210881ed61e68b4899a1058f6bf1e144ad2c2768bd93a7637c9ca364'
            'd6b42fb5fcef5d54f6e0eba43e489152e443fb641d7fa4c0d9d0541ece9c8e88'
            'a65c53116f51629adc103ccae6176901eac707a6cf91b5d58d4c54401f3c7511'
            'e032cfe0ecae2d2ba50d6a708f4b8da77a83cf6bf8a74bec81b6d3952e1f4a8c'
            '1a8dd40c15d423a6982ed8eafccb8a78c517e059c360a831b778be7d3e49d229'
            '7929beb45f2264d664d9d0b73ff1615eda760c0502fc9a4ceea06f361e164bc3'
            '343b7d5764f96a0afccad61fa93de4127f9f002c3298f115cd4c9b6736c36fb0'
            '6a27a3be46c54db2639a4b2d5cd0a8f814dcf5f3801380229ff9bb2dc58865e6'
            '31386b15fcef7d481da924a711f9038030f80dbf0cd80d81c7d48f12b5c377b6'
            '029d1a9a99409b5c72e560ceeae27b94f1ff18c650b2d7e4d73930fda6a2a5a1'
            'e3f051c68911d3de35d44785b53723519211a50baa74c330913cb56d0e91ff94'
            '29a68bebb4c2bc13d84eaa05b4409cbc9ebb0b63f65a6877d1f49ee4644ef7be'
            '42d1f5021e69a4fea5dd950524274f11777f432c1c12981c45478c0ced4c8acd'
            'a4b113ece31d0fd0d5e530e74bcf26ce07997cd15851b0228a02454194e735a9'
            '4ade67ee7caaf86b6a1ac50e4ecb06b06f73a9b8361f28ef0fd5f37d1dcd3e5f'
            '0255e1ae60d06dcde5c938594a5c97048676e2697712db181ce98af5469862ff'
            'dbb4cdeeb750e1e93af174d7efb6f552432072ff22b8d2d6a12284f21d6994e3'
            'c5a88ce5e3f843f2ab32d27bce27c77270b2695e09b21b22b8989a2c0d88e2a0'
            '7591f27f0cbe9ce18037737cbc0279d0b6a22b049e9209eef705f7b55461267b'
            '1ed98022502c44d1dfa257d911c720e159b75c4e848749782d5a264711c98885'
            '63068b557ff9783a62eea395e27cffe17d8cf9b517272229efbfdc4f8aaf5560'
            '8547aa804ac1cb986ae471642764432d487d210e8411688f85053e6ff334942b'
            '0772b7613bede5a46b65d60a5623ea1447544f533f290c541c4ee34b65ebcf71'
            '0c22a5a9257eec2ee76c87858cec52d4745c5034b8f9806f0f8079a1ed2df245'
            'c17cea3f751e8fb3f0e440ec01168e8bdcd29127a92f341c981d866128432675'
            'c865e318a5991c7e2683195f7243c6d1e80766e1115eda7fb72f85b77e9657a6'
            '1f8ca6654225b13c1e903026532c9f54cb1dd7484a24f1956cb75c2be4d5b28f'
            '20b519bab6e071015b30f0cfee2bf579ddcef28c75a341f45d9aea967a4d86cb'
            'c0c62bbba56d864d66936010891e11abcf93219d35e84cc7fd4cbf212ecd1edb'
            'ac44ae1884205e9ae79cf4360b4bdc6c12a0901389d5e07ecfc286e1f84ff22a'
            'a89fe2cf40548a7e58b6855ae1e31c1134d8c8a2155ce52e376ac715b27a7324'
            'b396219a8e9005cb7d9fa967d26ce81db64efcc298138a3319cfecf325def72a'
            '7b03655c64c64bd746eeb84810063de19c9175f637eb64bf93121ac53117110e'
            'a64f46db8956068ba27550866e6e11e3d1052451d1a2d0915c5cec7fd85d920c'
            'de9486d289a9bfb9d768512d2dbcc8c2e7ab0f1850919681b4aaf7e9ecb6755d'
            '58330862bcfa2a0cc6ad734f39653f057025dcc170f189cba8596f6dfd6d87af'
            '383efaffe0495ac389841890b1d081684e7ccf0b6477e02c541384d8a04a2aad'
            '2f7d3005625767a9e0fe4903d1276b2f92a23854020facc2b6ee11bd8bf75cfc'
            '83dbc5cb4bff82149b9bd667b5189f608a09a91bf774ea80deb0d6b3b4359194'
            '7ef45e68aa261617bbda1a2bd4baf2b76c6147dbfe2cc3a043a2beefec4d07f3'
            'fbf61d619bd2138739a348867ff26cf286404e4eba38cff922549ced065d67c9'
            'bb0875c5fcf5fca794cf4b2070389c3dd21f0d069a1d180c2acbc24a59a784ab'
            '37b1549c8e024c5561dd47dac5b6ebf2f6a4869dbe74d85493d16e99e1b34c30'
            '462c166918aaf4b488db08a17ab5c3f79acb5fd62a23f471be3f1111d3670254'
            '949ae40ae244267730cbd659e2813dc7eef7c31519022ce537db9eba0ead31b1'
            '6e63a179cdf339196152d187671dadf37de6806067c86a7f1ec40a71f9681ce5'
            '434b4a8a080eb8490bbdb88f3aaabad63eeeb717a646fd13ff3cac6e0f243903'
            '73b8f1c33a9139395bf24f3cfce0052b17ab8383ae9486faa4e6e76d9246481c'
            'eca80c5d4acdec6d63ef3ea4187d86e7e8c4afbd593c27eee69d7b8808a86b9a'
            '78fb32e7df91853d2c1c62e213d312de470f26dec00ee60c2d1b9ba9a0b364cc'
            '9d031da777b04fa5e15a2af7ae64ac84cbd3c02f39bc8bcb0de80e0450158121'
            'c76f8776d831b0ef9c138d84e1163200bced85d8352fffe46f49a3de1c3ac089'
            '7afc463076459ffa63ad73ae4fbd93b177dc63e49889c3914858e2f4928bc192'
            'dcd04d4ef64fafdcd4159865049a124761b795272fd7099bbc0be63050d67e5e'
            '6c130a849552b8abbccadba32bfe7ddc2f1757b53462cce5105ec5d7eb00deb4'
            '8ac4aec08805f10366d442aa00177bffb2e91832196b8b4f72c9ae2375eb44bb'
            'e0e824c4587fb5bc2cd0d6c1db94b61f0f9c5b63773deb1fd85eb2ba5004b0b3'
            '94804dda7ac9700903554e442001843179fe4e67550c6e4fc0b607ad2175014a'
            'e394cc4c8b1d7447c0a30e3181da6c5a97f6af15740a20d5dd0c3925d7c479ea'
            '28b9b0294b3666bad2eb449f161bf9da2b333bba5f80f01a7f3242d167234aa4'
            '210a0fa19748b1d8081b2cf32bbd777d1972d96436eb3807a18679208f5e4873'
            'd542759a3ff55be96d25d09da9e9063ce0afb98b5a227c066057c0daa31e360d'
            '614a784088f09838d2c0f42eddfa9ed1ec58e345ebfd2d4483705e4ebe2de1c0'
            'aaf1e73ac73e291b4907522eaa6cd103ebed0cc0c67d873be9458482872125eb'
            'e0ab6c93852681862d79356308705e70c595e8696482bf61d9fc4d37d31cb7d4'
            '2798bb4b33be0d16904cf69318f8fec34898fdfcbea57a02f04c30512d242aab'
            'ba365808f6abdba494c53bf4a89faacda76c3332308a540a8d8c9386b61774b1'
            '26fa471973b174d2507d1ed6860d82598a4693066e10e9a974eabea8aa22ca30'
            '680601d34d27ebcc3391e1b9183a64d0f5f56682bd4a1d1d6f552ff2f7990d42'
            'd76899cb407613f5f02275ab7f32fa35a22fe25b0eacc1e7b5fea4313378ab60')
