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

pkgver=132.0a1.20240919.095816

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

sha256sums=('8c5ba0f16c6f757bf9ed2ffd1e8fef323f0b77f2a5a7ab67c1a5051ae2c4f7b1'
            '21f2f84432af584b243e24f7b67fdf152484aa75a6c4fe76c051eb40beb7be61'
            'd7628f5d3fc53c711ebd1abd2c9953693b8101040e29f2612d9e2f3a365292b4'
            '35c19022089f75b4e9fc4b2ed18a064815920662723b0e7e9258e2b8ec94962e'
            '4afbe5704f5d9dc97e48414b534e3c3883881779c4e6ab6dc7a1c96b762c215f'
            'e81232ca78149cf0fd4f945754ad26b1a548c07eded42e87eafdf74a846c3098'
            '26201a80b187816b3932f2e81e22e6fbad1c1c37d9676d7694e05b4629776e97'
            '1f9ef125914fa5edd6b733aa526e6d89e04d5767c1aef898df76897225caedb1'
            '0ca86e6fc40081bc2f29ed5802d76f27d1b49cc07727b35240d71a5ff3c7f09c'
            'acd1469d89df671f952f8c7f44f2ef5ed7494b042e4090faf5b5700569e20f93'
            '218ac2917ed6f098e3d376a7f5e64bcae46ca5a59b95e7f33d0a65ccceabb962'
            'aca31c424fd1d88d9a886a8b016a6512b265652ac26e50807c839878c849243e'
            '088fe695a375e6df6a2fcb117008ef3a4b8e10c71a68da73de41ea2e42e3ee82'
            '7e27f2e1aefe566a17c1d3bd58fc3a0bd0626f22f6500e7c54ace5aad4cbc2b6'
            '83283a503c30481db9b4676c2e5b66da5a1b66ce1133f4c11aa62010c6955316'
            'f9089bea27be9f381f8f0ee65ae1f3f0ab200912b187191fb86d181e5142d2a9'
            '168a0b9162e1578049137412adf4f1133231eb65e0a009ee241664069cc3c914'
            '3b537e35fbcfde89750be28c301f4e92ed683626d828001e1bd43c02e499e9cb'
            'c6d2eaf9b289b2c6bb92208610737772293d11facd2848694f44bf0763b63421'
            '0e0d8e7247f9adeab24c64153a2d8b60c0ec2be6903cdd094b4381e5798bcfa9'
            '29a4c6bad38c6b4ebb0f7801fd4529cff9a352c434ed6a051533a5a6dfcd0794'
            'ff465022f553d5b7a8aa0ca53232d955aac7617c4aea5d688bf7225da065fdd0'
            'b3d8de1b70be1a3695ffbfe1199486f13117731de06df203ba5adff892ca4b89'
            'd8795e626aa1e847ce6959df369ee11ea1f47dcbe204b7f00946ee8afc471ede'
            '11c5d44f1d3058910f1b915e342abe7af8e23d8829a4777f1e85d17ded4b2aba'
            'd187167e6caf0159c16ccaece76c014f63b0a0cd0e0dcd5ff60e59adc44ce787'
            '0891f6585d3b6cada34b23951b975c4a8a645c0e1f4773da8831c455409b091b'
            '98c269c3ca0ca46240a4ef00e71af7b62c26c5047227886a1ae00c04b207f9ec'
            'f64991019e158c08c1a56db2c182901cc5785b03ea57e4c93108b2a71445b0c8'
            '9ac81c1271678dcbbb20657449d1414daafa66532e81e9d61dfb0f9507bbcb0a'
            '86cffdc54ee639b1808d60a79731af1be2bbc3aded5eb2737e305709a6d1edf2'
            'a2152dfa59ed20451f21336b004c528af8a71401a85f681f394c27ac7c208f83'
            '7373f79b03fd5643c930bae5d78cb99431e566c092674e817df9d1c772b8e432'
            '06a0af5120e7e7b3104fce31b71d54e4b709750ff50f4aceb0a246904c891c8c'
            'ef8e6fd9a4e9508473af12a1517da7d1873cea5efee53f828026a90157258737'
            '2662a4150f4f5d11506fc5b38c3152c73aa0341943d27d23ecc11e36b260dfc9'
            '9bc197140768d6afc62ef74c5a4c4f161dcca286466db93dcb1aeac0d650f674'
            '88258ffa5967202afbf2787c0c4dd871f1a73069aa7b2de69aebd2bc5c606c69'
            '0e526de19087df784af96aabd2639f53346e107babcfe61eaf11b9cfa8ab7631'
            'ce83b87e5a0eeba4fc3407e127cce3f53bd5fda6777c608dd66fc7df73704326'
            '2db46e65ee81c2d3f4af3ef267b93b483702a3e3c52cb35265668306d106a0b9'
            'ce77d43e6d6eda73830b6d84bc8e82bd9d18f7f5c4b527f85531fd6718600029'
            'ad9a833306872fc277c406dc623151b6345b5c7c5ebf248f8600ba2ee306a864'
            'd48ddf8f48bb1effdea543b33cf7a919d5f94befd3f4b6f480d1408d5c07dfc9'
            '2f4b48f8d378575750fa04a3a8fe546d2feb3ea17d6beddc1caf201f9c7649c9'
            '2c29ddb9e8ea0e44c426c6c1f510df474ba35f3b4263e6847d3eefdc67853a10'
            'e9c63ba4e158d0e82bddad205b9f006ce807dcc8269ebb040cc53e61bc44c93b'
            '7dfbe3edd8ee29a302afd1e2569ea8777add0953f797c646db4245696b4a5c0e'
            '6a9043b7fa78c49d044674c510a1b07d80bdbf29105e120f15b5b3a714a5ebcf'
            'd3fb63eed970d6bdf8874fc1d1892b3e81fbd8f5882725449a562f503b14085f'
            '9429920ac007e41746c89318c84888b39c70863788964c3f8466b17ab6db40a3'
            'c4e035eef666bf1a430853818ea0e6593a738b0819ab645c55bc35e2df5e01a0'
            '2f1319708611eefcd3b539725be7f6d078bbf0f5bb86ea51390076d7309a0520'
            '36ba614047ed1ca8f4fb4a11630e12a5f44cce97c1146cf239d8a62044f83ef8'
            '37d7a7967ad68ab4aa3c0a514a3e58a1becc692bc94a77f6fc42216566719368'
            '463fade2db3a2112ff4037650e808f306b8fa6e53cb1a142eb820a0c3e0ae358'
            '3785cbbf8529b769fd8ebcdb98ac1ce99d10a12775b7aaf60959e9b47cb483be'
            'e52b77adb94af1bf5b05be70fe583928fc64b6789e0f90f9f3ace872c5f0237c'
            '100cbab2269a1f2d6ef1e7e202d1025ef9c6adb7ecee6782fc6b6a312ca9bb3c'
            '0975810faba928ee13697e24203fbde424d0e56fba9bd1e7980a6eb61d6de62e'
            '25a2306e851b79a5619cbf3fef57dc01fce44310072516fefeb6db01ebb35c01'
            '1f7758ccc9ac5c42294c54defd1e6cc064b14292c75e44e4d7466b9fe1df8b95'
            '9f788ef483023417fcf9e37a18aa874decd19280e5f37ab2d32b2d23256bfb2f'
            'ff4981dc4e0a137ea05af602a0b61ab039ca7934de001bff5c74b11faaf7042a'
            'a39a580a1543aeda1078e1a2a6f7fa05ad6a303fd1e8b3bd54d92a4b96e378dc'
            '381b069310715bb2a69a13e4c43b8f8780d326282887ffbca7620c740a4db0a3'
            'e45bb39ee1a736c996f1b6954bacb4c1845e8c49c47677510af70232c05dd334'
            '1861a6f10c9af2d84db78f5ceda507e45112e666f5a7fd5a28907586e20055b9'
            '744516f4de9dcfcd460a15a97cc9c383a077b51d3a4805756e7c62b944aa51ca'
            'f6b905b225b99b3b3ee8fd8087347fc34c46b7326a9cba1251287d7fd2439787'
            'f3946021db0c04a0349cb3f30bd65e01017ccca903dd48205f68fbedf7b3cb00'
            'bbd82a1655b52b69b76d3af63c763c63b3d6b13f29b5b4f29eb3f85dd916efb5'
            'b47e424b7ed488b0657e098bd720888394becf143288e8d2ad3addcea1919cf6'
            '4b1f8ec4fb62116e53aba764932e5405424a408d588357a9f1aa962b1b699d2e'
            '4adedebe4e1ddb4e6d9d305847f4cbcf1055e3c17e2ba4277b3fdef20a91eb9a'
            '5388f5571b411c39433af20e8f6adc0aadd8a45ea6581717245b623fd90c20e1'
            '4f43fb7f80e4519e27c2a500416d555f93020b6800a1fdd13b39e5d9683cdf14'
            '2f88dd14738416c0809ea093bac364817bc0733edc081085f8980660111e2d89'
            '8cae9992c8afa2d63104b3b8703ef5f385ca8327bcd3501305717adffb90466f'
            '62ebd724637ffe30a376a35ad59ed456ff6e8f1a73c952f14a78855fd663b4cc'
            '47158579b3027e499cbfaf45086291128e6d263868154c92e3d082709b9313f1'
            'f58b33ee521f6af73da303e6dfbd3052455ce4238fa85f5351c8912404d024d2'
            '7438a01c7aa79ce84e85b395230a6df954b374e6c06663f76abfbcb24abb1aba'
            'e3c2f8d0063c5a212839ca163bda8bb294dce3edbd4bd49d888170c0b9299a00'
            '29b017e663b5346b26eb072b142aac89a5c4e98317d351fe4ed8821670704cdd'
            'bec2f2b8b5f5e5c098ed33ac604f7296f5ce1b832b927c025587cdadbb2dddb0'
            'c368a3fe527f9cf0651bd791bad2f4a36222ec18ec6ba702a29143317979cdcc'
            '23ecef180013ccb5a6fd58bd7df374326c2b3f9e78d1ad6a1e434767739a52af'
            '16bfb661a6fbc6d8e2674dc195b1c48672e0ac391b68eb0a6f2f7c85b1318e53'
            '0c05c76e5faae3b267ece6447f99057e0c69c67eb4d56bf88f6ace4e9383f1bf'
            '70cd76b03f820c90eb5d65778f4c17fffa73b7ea4cb4cbe25f8c453da891712b'
            'd2d8b9d0ec44e35ce8a5b1ca2948414f92417b9105eb40786f634a32e0e01fc9'
            '5659354f86a7612303c8615a4388a6c8ede7724ac4c2a6ea0e871d76ac56f8b2'
            '552eec372aede2473065d9a3c7f8358fc27090bee99b5edc45102da4e2cfaf67'
            '4f5d71ab25c9f666ceb4334473d647a5b78e314ce054748033bc50b495ccd798')
