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

pkgver=132.0a1.20240916.091426

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

sha256sums=('35a7a15e3959857fa6282bab9273f4ba49d9368ebfc0c2afcf048cdc185a7972'
            '52356b02082953631b003ef9975472a352da49ed3f97fda7ccbc3d8f88513768'
            '022cac64a6553c637ca53fd394dec8630fc047eaf70afd6d7507f20366365180'
            '350046373cb5812e7283624888ebf71fcd67075eb0542cc48e457fc9ce1d1c9d'
            '68560411aa09cc4205aca0d4b3c1d329b668b577c6c0bfe16cc77f2362ecac1c'
            'c066bb124b1417e324a90531c22e54529a5d6422165679484df33347ec3ba6a8'
            'd4371f5362ac9b8d24a124afba956a3052f28518d6baa6ad1de296f9a89f1d27'
            '93273c939b71cedc29c1a68e11c5f9f680dc056fa7a95971d84e0bededdca9a6'
            '1e3de70000049ecc9b96831eb964088272cde752d84564b23002db2eb51a91c7'
            'a980f42e6af223f3d7d75376dee5c3a9f8e2f0002dffb3603a1f92987f3c0104'
            '930191982cb6afb7c5c97008e2e965f37dd09835922030fbdd23453d82822885'
            'bb120a3fde0c9c3feacbed8aa8af71a6d0dfc7f8a829e62542a99458e48f94d2'
            'b11870a5856dfb830ab7832632893ac66e2655826b975775a9aa24499a5fbcb6'
            'd51755acedd1a82bec60698ceaec1cf826b5b84415c1f19005139fc2e7b25751'
            '2fcec26cca0501e1f0ea5407e5219142067819f2e568ba261487593f86490163'
            'e43c721ca1978c395140edc91ad6875730f3a1110042256eda3398719d8dcbe1'
            'c5da6df53fd3af52376a329cb6703f43695a408808a9e8ce607084cf83f41279'
            '8c0db01360f239c4712009deb4a07d82a1a7365d0df7003b74038fe6b7e21e23'
            '9a57ba80c20b62fc19c935a126d34d2010e5146a5d92b2de47aad22c51487a50'
            '636f39daf7ce13e5de31d948930b5415521fd5fd91c9584d797e573420f4273c'
            'd59ae695760f4a2f26491874867e8afa2832bbb6b0e3c1f6ee0b54f836214289'
            '3a87492e24ade30cde2b66ad2f8ea61153adac5942145a1762cbbf743d415e41'
            '081cd0e7d499ab25fd657d3ff6cbb9cadf2c19c14df4fef670778d3e696b21c1'
            '0940814d613ea81251bf415342b9c11ae79f505f06104a1088b498ca66d66ace'
            'e38058b85cc148d908b3becf4b3c98eddf2ec63cc47bd1398a1eba8ea4b09a29'
            '0929d83a820a3371785e710f4edec33a57d6e34c964b0c3b015c3ccd0adb2825'
            'dc2ac58451d0400b06e87fbc2884fb845ed9ee17510c3ac05da70775cec76a16'
            'd87681239397411540f0c982af118e0894ca69178a7bc50c41829dd9d8db052b'
            'f244cc7916c759d212e91a1b2d20294a5f96bf5aaf9928186580a441a282f663'
            '186f939c7b03fd9872d9f0ec19168823f59d7f3a868ce7cd6915ae422682e5b9'
            '9e9f30774d6eec12c52b0a31a8b3d7d916d0817d48c479ea0e0394ea6489891e'
            '49f4c0bc27fd69c9d9874756a58288d85f38e91f8995fca1e3246721631aa806'
            '867aba4be9ae7e478639bdde4f35e242f087fda71e3d492d96a258a280d97ec9'
            '420a7ccb14ef26657d52d3aa5d28fa91bd190df7b4984041c0f0337957fec3ef'
            'a7c3417c76d8e24f7bcdd4cb3af055d2585c4f41b7df95d28ecfec67d022e96b'
            '837fdb5364e0329c86ab95c291421a24a9f4c61d2eeabd072e306dd4bbddd2a9'
            '9a0901086cce0efc995d6924aa89136f7c62298569f6f038e8af7d5c59c89105'
            '6347e2f325e5883b748fb0282a231a0553082c420f972f7d4f41bfd56a6ca555'
            '5ab98fc3d4a5d91eb1c4696fa136cd07c7e7796a34485e5e58964477e60fd403'
            'add5f1751f026661e954c1982b3766aa9da2e6d5568b9aa78cd610e210c740ee'
            'a60808af349c8a53e3bf6289e92f3aba871ce01b9440c556afdd5f134af02592'
            '63954fa9ec796e4be93c61022d765f62ecf87c43a83d4affc181a374f8d8fbc3'
            '2351b666e29bcf5f617d9915486edc726cedaee03a5067c9cc2d1985032b7cbb'
            '71598d08714257bc8376d35a4a93b826ca40f88d15b690cea28a22a3ee776675'
            'dd9b791ecce91dec0d466d8726467aa9fddecd3cd1a29decaa247f420d9a3296'
            'e17ddb09f66be1205d83e7e689aa3e1f649bb28d1e5def5229766fcf6e69d4bb'
            'f99c92cb05aab485627ff334a86990c05796a53b00910da9b11d4f43a3df55c3'
            '8daa910293f47d49de63c38ac0f95516252d32b9497b653e212c0c2b1d3166b7'
            '1f3a4cf0d89df6e313edb55317090aa870e4f50c5f78de37002535af8f899ed0'
            '382d2e3e39f59c317b1a04f687ab7849a335ce3ac78074d6ca345de041f77bd3'
            '97579be9c31ac72f1797188641b54c009b7b040b02693c7adab2e71bcede2a8b'
            'ae7b175c6c0e15aa40c6b63effb5e478bfbf9314e43d85f864a3e451167047d8'
            'e6c37228f68d75f9c865d4228a0c4cce742e788e86de34bfc8a060f72f4f62a5'
            'ff400585b2c70604036a5193c3c6ae3e4227dcf7e9b27f0578ba027ffd2dbc7e'
            '20da25f50c06517aa74c6919fca4cf617c0c9f9de67a72c81ac8f9ff148a210d'
            '0cfa6acc77be7f7024f2d41641b8981eda5976ceea9a4d9f5e6ae2c79b75944f'
            'ac325b81d7d50fcbdebd692bef5babe7313da65560397d7b7abd2bd63d83dfa7'
            '1e11cc3b5743190d9e38b83dc15e0b263b33d26e3a414c77464d02b197aee829'
            'd14abc2f102e6d31b859aac02f45109ba447852ef6bc4db75c3a44b55c97f5f4'
            '8318babf22d3134d6dd5c9a8ca5439feb30facba2bccd7ed14670eea52e0f2bc'
            '286dc472f6dc6c8ce8e30d0f5bc87b338f83cc6f6bd1cdeceb063d376fcd2b22'
            '7c4eb224f223e64de1876024f968b02c0602051599f61a38be776da046e3f997'
            'ef04d2e0e5c3b5b2ccd32b2fd470f505ed21fb5116bc9731e4efc8040d09dfee'
            'b5cd10c6de3cb2d8c20ca709ddbb1ad43510a417482e02ac6744838e2d423bfc'
            'fd35bae378ec0ccebb3c2cf50d1067a5adbf469740731691366814fea120b60f'
            '0790afffee07ed78e8dd2cabbe7e5651db3fd0b63e50604cf01131b45581c49c'
            '7ab0b022e1abc060bc0b017c2a0b8339abe291b7f0b463587b48298a1b9d2b2d'
            '179ab8c6ee330d227614eeced3af01adf0683a2417ad42de62c847e978b31e5a'
            '3ed069c89f54ecc7afd6e417574124fe25e41bb35714f22d098dd553ef34ab92'
            '213596b554423c8276a179d3613f9bfe0b059a5c5d488a242618a16965aa6fb5'
            '3af0b3384f3d1a8733d1e934e82ec7b0cc8970a07555d3ea833f9240ea8ac3b6'
            'd47affebdf9ff7e9a2f6541088a93a22805ae66801b8fa00ccaa5f31ded39478'
            'f7d5023aa27063a0d17bf5251c71896d3f40a98e6cb832bef0a365fdb44dac39'
            'aed8e789757716f97a6e1b78fc037ad9ec9496b7fd14ba147ef6bbeb191bf450'
            'dfdc87bfffa412b697143b60aa7f224678242a3387d52781dc4364d6b6ea4284'
            'e97bb0aecc03ab97de94ac2c435169ce7c59db52d6745e7d96c69372f420668f'
            '1b1586b072dfddb18743ad63134d8ac6d66cbb7f211d8367ac30f90f2fa717d3'
            'a4560671f0f3a5f6c7b084629d377c8a94d82287311716e8042f8b6efbb29a76'
            'b8d501f84ce6b884ca9eb4669f3c6b3ee3fee88018cb141db908108d91a54bce'
            'd9e5b2f112d1cbd1ca6c6c1af562fd6a78aad07e5015de7d8e76097a2c8bf4a3'
            'a03f3a4eb66d625e36aaa9ea6c0317d941c974d02149cd5737d2f3bd0d7247bf'
            'd0eb260c7fbfed66fe31973205cbff559a93bf5f621bdd21ce98aaa467c4976a'
            '1f67762daaa5ded799e058bb83924e3363f7749ffcf3b20e783e599d239e8b63'
            'fc2d0656532cd0cdeaa5a2c36ef369ad1d4d45ad28b0f5848d56414da41c20e4'
            '382f07475f891ccc3cd68eff021ea74c1f50f82272b2ec2cb0cbbf60dc00c13b'
            '2a233abe211eff8fa0a23c99b21b1b3eee0c9fadc0cfa6723ad4ee195e949410'
            'b0e649b592aff782645f2bc21bed33b1b793bad179748a4ce4985c19f3583017'
            '1444275446a89fc24e19e49e74e621bc063dffdb212ba29d98fb0fa6835889cb'
            '724ff61ae0f5381e514b5d2407e300f88d07fb838076a1bd5b3696b2016fa8c3'
            '0b4bc4d1b9d29bbfeef6b1f57f5eee80844ca41e465ff1920a6e8ea417eab1fe'
            'd19888722955fc3954ea26fcf760d25dec7d548946c38ca8000bdbafa9a28caf'
            '7ef8a8ccf898aa5fe4348dfe2445cdf12df5cf577b5a58f5564768aaf543333e'
            '2fd6a8f9b72e4e908b6c6e2af9fb9e4b8d26197cf9438ade3eea22c782161c40'
            'd7cf8d5bbcf50d26d27235e700ff46caf8d6dd166098943950609cfb7aa5847f'
            '9cd3c8d88a2792bb5314fb36109146fc9b4a4dca02bc0eb65af4cbb69ce598c9')
