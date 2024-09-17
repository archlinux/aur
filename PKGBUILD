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

pkgver=132.0a1.20240917.092838

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

sha256sums=('1fd63e942ea2131e135a63295d54ba9d6a2983ab40b8885b587587053faba94c'
            '95287f66355ede1063c7a6157f3c9897a9344ee845377824cf6ebf0906ba4827'
            'aaa320e05a70d6fab1d69975cd7b26540149b46bb8113f373485754b3857ecdc'
            'fc8e98ad53d0e17593ea3702952e5a3a2abaed753e004790768528b8ab6c92a0'
            '00fd42ebf9a8a592e3f5fc9a2c6ef8730aa05b10465cc5aefaa51799909a1695'
            '6fcb460a9b8e80ea219e24e32680d636463b58cf6bbe53f4c35d7ccec3c30f94'
            '3af1bdf206917fe056218079036f5b8a2d465b4a830cde897b0a828023789ce6'
            '3cb8360b07638752043ad4ffd12a15d24026328ee15403a252c80242e98d213c'
            '69975d1486cae69c46d6c7ad13f1dfa241ecfd3e7656eb94987c26f23e9c2445'
            '7b7258b9e02e601b728f675a8ee7ab6ee5bdc1645090ff7c80eb22bac1c0531f'
            '68843e12aeedfa74fd42fcd85e23681655d9d473800c7ca7869ccf6b97dbe580'
            '0ff523918f24bab675d197d820194bfbf7490e2e7046aa11b338359631dcdbbd'
            '2ed0c40ff91ee048dd45dac0e14906c991530c9a8c70b6858f7d2fd8af583010'
            '24f2f5d40e91933e4717f96b8a8d8aec3ebe78ee5b42e032c735da99b5759164'
            '1d2a22f73f8927387b400d598dc1a888a830f8ef2bb694b72ddb2a64f318c85c'
            'b6770faeabe6a8d0e0f670af7da2e03eecd5a580a7085c74a9a38295bd0b7970'
            'd4fa16126cd9515d4699c12b1b90e8d0dee60952adc88d9e1fabf58ab6a6c3d1'
            'bdd6e5b5d5a2e25dbbf71507bbadd2e4940416293eaba07635471d5a4b95c3a4'
            '6d192ec91a4b11a5c2c9fa5672a67555e8ee86c51c63fe68618f9569bfaa38d1'
            '3052bbe7a4d21086fdb31793d19e08098e0a38fbb326051bc2dbe1e6019dda59'
            '1b99189abced60e1a908e9776cba147eb848d0f6d05748aefc83bddb8c5059fd'
            '1b9a00e4f25e3cdde10243bf2fdcabedff66738a44a51ccf307c100464a7bb40'
            '9fd023f1e266ddb6e878970c581783239a5bcf5bd96a97497328e6353a03d9c0'
            'f3145c6e44eb37c249e1cf4299265fde455510025c4ea37b3055b4ffc3097a60'
            '936806455f04e2898ea1dd450092b8a9e83d96ce4885bea8524aa0fe62444aa0'
            '4999f36be151e3c4d04ecefbee81e8557a035311e88b92c9ec264fcff8f451f7'
            '063bcbfc9ac1acbde7ec2c1996544a1b994ab302b57fdb79a76b29d64ccf6d92'
            '55ea1f965ba4c4cf5bfe680b9058a4ed9b503e11531523e4af621fd010be08c0'
            'c9ed9f8d466357fa2438a91371c0a46d8106d0b57c587f03d6f42eee3b3ddba8'
            '84551904a4f1ed805be424fed1341696a8573d88ec292ef41d42e35b6297f372'
            '288650132d8150a6eef7aa8c5fd7f5ab22f10ba3c559ab97690bf2edc2dfc7cf'
            'aa0218fef8e3b74fc73f374a893dd5f6aaa2acf7e4a8b297037527aef44e1cbd'
            '65592be0dcb4db3e95f1a0f9d8881f67f7de8778d71f7b639fafd4e4db8308d9'
            'a8a22d9f3c5832997095e2e7a2ec57626581baeb0c3c883a3cb91654a719a55b'
            'fbcc21d63c9ce4fde4c8b9f9689a20e291e5a6d521e93afd95e3bc5b55e332c9'
            'e808638a3ae33b21d0712f9f79286a8710d70f1d676c94ddb0905910b0716565'
            '7cbc4c88a44d6071659789ee43ef0bd2f697d08cfec44f3aca963c9f7c030cac'
            'd80de01cd2cac610916e422dc60fce77f2d4fd3d8cd64361098e782e3f60cfde'
            'a3a25195e921c71ab1d21476b45d157df75b9b78e9ae069d197ffcd07a390700'
            '3157fb8aeb59de45cb06330b38b8a9305d6df4299269aec5b781e05b95a1e3a1'
            '8c509e65db0166913bc51f51ff7920d5e7a9a28f1942e54e31275d77238d6dc1'
            'a5785b5af5279a3898b668f79d86a33416d939580a39527ad0d087dede6282d1'
            '82fe7b8cef37475c11819a0725995eb5370331fc46cbbf393da34e47a0f40741'
            '2783bded37d38d244d1947c6544622ba3a0c67298ece8e8d90bffaebaa8f6a8d'
            'e5053eb1584a03ecb26bee3273939a4cbb1d71f87637dd3865792c0894b81ac4'
            '91f2651adc79989c77d4c166c9f91a9d1ef86d316f805a79a1dc10d42310a64e'
            '11ff7bb197acc2382be8fed9883ffbbafd0f23d555e30efb97aa45346c4ba12e'
            '15f9b50042ceec13265f1fc759a8b12a0e1dd2af924143a949e116e8bdb47f49'
            '0124396a69f2ab82f574e7557e7abd463a83fa17e11412df4a1051e2ffb86c7c'
            '0e465caa0e5feb6ab3ab43ba0f7f35b073c96040977c4cbb632d002cd14ad4d0'
            'd5ab52d42b4691da93571b7354a63ac267f688a87b476d76a1a6863745ec4f3b'
            'a84cb37ca5f3260d0b522261273c5ce03bf39a8963b4236aa15f5087b96defa8'
            'bba09bd80e2bb8119548f2d4718eef7b8c6f5d7ad0d7e978c7c565be839e0ed6'
            '2bffd3d63b86ffea2607245479b63a018dfb4656e1b235f559df02cb0f208438'
            '6dc9f8e40807a9b99d0d6df1114b6a8668a5323d2299e026647f5c23490d5b56'
            '587a10bbc41ff8c78f5b60b5cbbe1fcffbf09c157585399992635892d695db56'
            '0f1ef7ef722f7d91f3d11edffae8fc82fadb6cf49f8b8b16ad821c7d27b8efc1'
            '1e783edf22c6826033e34455139e6e78b4e7116997469eac09828a01472b5f6b'
            '8a38e16eb860f7e83df55b19dd3a16c26071a6f72866cb16ffb5daea474549d7'
            '308d82768a62b80600a70b968461b07c077b9b40dc3aa7655e4f15035566ec38'
            '15a812872ebde36e233aca0533850a2b56635e999ce25d6204b21813fb1c8ada'
            '7dbd4c27137d89269058a8988f392502c40685b6f11e19bdfc1e76dc2584da35'
            'e59e549acd08dc87230fa79a8066a6515c3ceed767d859888a5477be62b6247d'
            '2bc221b1b9bdad04cb577eb5216d86e7f8c529fb2572bb15c30bdca07c32b589'
            '7fb9bfc731a47676603cb504a2b0e401a06c54d22c77ebd3f5b49142db61b7ff'
            '6cd735790a826bce589ee2c9e2ceeb3de5bc4e67a616e841d6d555e736a4c55e'
            'ecb06170398599c26d1f0cca993dbb2dd3bfc83265cbfa04b25213477727107f'
            '00b2488928f61683e2432f9138c5d1b43fa85ea33eb4d4381a4f50ab3a53fecb'
            '3f626a2abfbddee734904c28edfbaa5912679f91832338512e8b5a37d1294fd8'
            '3b7d5806999943dfee0888d000d369450a8e57924c42a0b1b976cbd8980484c0'
            '15bc959ca69e6e5d4f98be65fbc1a196ba34b353d64e29c15ffbff1a5579bb9a'
            '5139c24bebecdd32b4c17ae2dfeb812f380bb2924d9c162cf896a463a0efdcb4'
            '7b55497468a95b2c5f8732f12764f58e2533b7ab108a417d0b50ee0d48b22122'
            '01ac4dc836aaedcf6dfa5560023f0648cf47432deba67b0889cf155106150b7c'
            '4ef7e7a32c8df49a0579ee04e4868d40c67655e7847c622801cff53543462a96'
            '5e3190e050e0ae09dbf2f7191c35c98727760e32130275a48df708eea5d3b17c'
            '490bdc073cd428c0adceca4e0c05940474c230092c9053b205c8e2023fa919e9'
            '5f625fddc91ff77fa5f28cfa11fa1ed9ba1e91ebb9707e26af5cabcabd998631'
            '70575a0ec9a7646688f3d3e568fefbed661cf4b5fc26dc702265c265233ef1ee'
            '775a7184474badfd3b15d0eb98bbe79afbddc8f799016910da0863c6bd70c386'
            'd59dadce82e22bec30f9e3e951680aef19d2aef03ae6d760799db36e0a946c1e'
            '2db8f1358fbb0fd465ab2f4b2b6ee0d90ab2f8b36396add1b6c63ff4561fbef4'
            '04ff7380f07e3be5b7a70d19d0f8795f2ee4d73c99a8f7825e2159f286ecaa9e'
            '6e15f22e0179d23f7ee0eba3dd37a27427d138884266f74f733ed3065c53ff12'
            '4853aadcd435a8c1857a735aacfface9b1c0c80f2f582cd7a209449615774e91'
            'c2b888f860f72060c9325fcbb8574e41daf7aedb407d9faf7537f7c277809b10'
            'c0795f33d75f94ef96556abf7a15cbf640fa628fe78f13577fb899b0dffd4448'
            'd63d0a7e6a3800852a4ec05011f12d813372723be87707bcaa3549112f46c9d0'
            '62fd4f6117e95de7448bd15e65cb588f5cf3bcb80b39c6b7c924ee6720d794ab'
            'a61007fe7bfa2722b344047f2ec84df72bea97d95b1337aff903d410f708e633'
            '03120e5d33007dc5c1d6cdaf676d9a52326194b5f965bb99139c109eb91ae97c'
            '673a5f273ae1400af1777de8d73dabc3a0328eaed1934371d12756b27952b780'
            '46b668510e4be76333df409b1131834a24e3918ff3ac7181da11a3355ee84dd2'
            'b53e8732e81cf44b0ac4a8ac38c0a9ade54a12d6f38bbad6627dfd06248bab1f'
            'ef193c2c622ee735be7dbff29b2ae7b67f15fe4628e060eda03ff5931baa87b3')
