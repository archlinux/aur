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

pkgver=132.0a1.20240920.090503

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

sha256sums=('d09ca606db15525111bd4b8aedf38625a979af027f4cf3c1476451f78e7586d2'
            '7544f3116828585d74fcb3048baf6b6ede0a7c27dea57d271019e982ff28a2c9'
            '1183d012f5b33f846b1d3e85941df30cb614b01794050bcd91ed93954e5e006c'
            '4f8e1b3c0a16ffc73f0a34144ce11ebeab1fffc66741f84943544c1592815207'
            '781b0ce129ff236ec052e9bfae440d9f7a39694af139ae12e0668ea47bf4fdfd'
            '5db1de50ffd0c90eaa3ce3183ebef383f20be049e6bc507202bb3ea1b16bc248'
            '2823ddf945c2a8348f0c7684b9b47c31c6540686fe827abfe7ec0be03334055f'
            'feaffe5beb73dd0713d15f4e7712edc615dea541db95721e3df1c76c1aebea17'
            '612c901d1650d934a7a2e4b0c3138afe9f5ebedcc9becbfb31387339a593035e'
            '969f28f121a94677364cbde9ec9163062a8ca68c1e9ce98e06026875cd8de158'
            '0bb73703f5bb212da14d4e23d7e22040c231d47b670f0cac95c124dc388cd9b1'
            '47898b32912a970bea5a32ed03ac6d1ac445b584539c9d06dba9269399fa8ff7'
            'e2c68003bffe9fa86a7e4a8d32233bcb577d471cbd7ba63be1dd42678e4f6ac5'
            'e660489ec5e7290963539b768255f88081dff1a3b03976e6cae90fad82e5c9d6'
            '7256fdc2d3acbbab88437c31d28cfea7194d25caaa7c562289233935148eb72b'
            '9e228fbd8d7d46ccb1a2f15a42c1672242cb72a2be36ffba2228221503fd83ab'
            'de2a886445dd85ce4920c66b086df24a5214f8c8f8010b70f41cf608449a227a'
            '7f64d34da0c021c4c8f31648aba672978bb2fb173f281b1b27fe0186e68fbb9d'
            'f208f45d16968b09ec99cc04b5499c65c525ffebf552fd26e23cbb68dd948cf5'
            'd44bb499d7ae4846e02e9627ab6d1ef2c645745d065b525fb48c2d1e83a8e865'
            '7ce2797191e76bf5b3e0447407264641dc50112176bc0846e8312c3922c8f911'
            '706d41236841e554e63a7f2df77add0182c51b091ea2b0a714e2682d543a4876'
            'c924f03088b80d1e3b7ef48952640ad1d74bb668b5f3f1f01e9af2764a081b6f'
            '7eecfa34178d3acedba1a4b13ec5f53246dd9447a661a6d3ef6a2b9ba030f3bf'
            '6bf35fa90af0d1625c4538738dfc91e21bd1bfca284972ec31f34b41bf0e3a43'
            '90d61d869c42b2153fcf5d07a781ba0a1a99684f72a0bdcf8bc4d4ffa617ba01'
            '0b7b8d65a3f786a588e9d5a56851fd081aacbe3950acd886ccbbf3169d0e48ee'
            'd39863375f8ef3f8cba8cc9abb2da5793d0317add4458c9688452234caf36578'
            '8db8c02ba9cfff31206160b081c9aa18fe9796c68f54b8cf0ea8fce817bb151d'
            '8e82cb595affec1280e0f3c2a9a5574918e473301b1cc5a1b0d6694629b75ab7'
            '940589b7e14568ff4000ca50f4e611660bea0e4abc2ed5c8f6a1a2cf38627328'
            '82047c63b90ab1dd50cf42b3abe89e5b41e7a6782de07c56a05320f03b2a7713'
            '7e59e874f7d9a999a5b6d9bfa0d75dc27e38490a34aa67b5d157cd674a10c27d'
            'f57da06bafed9414b3aa9272434be8965233248ed8ccc23ec9c00b5245d8fbdc'
            '49c9fe65a052e5958fe4f25475cc90251420c9a683fd9244ca1898e4616ea0d2'
            '85a2931a8ca54536f979885509e2db54aa572d3ce0916cc93578686b331c2702'
            'ab0334dd09cf0dc02576e6561c916b720bd2546a12c6b452d1839ba6eb987c26'
            '1504d186a527515bdc0f182909f54f37ee6a4d96885be003e4d0229217d726e6'
            'ee0b5b3d4b83c9fe67c5076bda2072654b86feb0213fdae083bc40b920096664'
            '7217731a9822d10cc769a337e0d7309c7e0e6da486107c154c78d4343637278c'
            'f0fe7360f6eb7753276bceec076d599b18bc1577ae7f63e5eeb3e662a22408b2'
            'cdf7623ce07f46d39489881a77e9e1cff95d44cab0f88a3eaeb5a7a7f190c895'
            '1515829ae529252b03ba87042c51ca16069a2a3cb018d86a716e00b5eea5d4d5'
            'bdb6ee73b76b6f290efa9eeffa8e9cbfff1ab11a1be3d12ad09ef909d6b3baa7'
            '05efc57ae4b9979605e738b2bb2e695c63a9819755ebd671bcc08948d86a1e3a'
            'f4a5b21862756f3a141d40096c1e3c0477a9becc8502682707eb5a1a20f92661'
            '9ea9e9b9eaf48b228af8f654300216f5d4ebd56614773448e28e689837335831'
            'b225f5cd6f8d0f744c23631189e110a2e7976fc49e409a5885946e6b03ba3274'
            '4705af4f3cf28922d1dd389e43e8a0810e5f449ca8afe5aa75fe431f1e90d6d0'
            'a86c70e035495812c68175b15dccb031c116ac449cf100a121fdd55cf660aad1'
            'ef0d09a3abd58e6598fa72da11cf856bececab494c7cc69951f497f8efc3c025'
            '638ce86a6b86924d2af6af2608cc5b9fbfeb03297695a468ad685f9e42d03653'
            'a60b3aab34b4322de937f4c2d567e3b0a2585b89553bca4def2bce69e3cc13f5'
            '8a479707707f8d480b3ea9d782f661104d4e05df48cf9d0669d9d3593760045f'
            '1d41c28ab6d3de8259992a514489b15f113e08322b0afccbe8deaf8c6dcb2d66'
            '32a6ee5f63d6bdc4cd7e4dd4ed39acf8b51a56e716658848264041d43d081174'
            '48d8150ee85e4429c7d9c50bc197ba96c30c85a5d76bddf485f831616769f563'
            '25ccb6149e126b289af7a98b41a876b8b946db4ed42e93740d1b8d21bfd51307'
            'd1fc7044626619811d5e565a21f4d57b76b489d85eb620e69cf2de746c7344e8'
            '5fffebc44404bb50030051f1326050f3cc6342a7a0158138d75d7dd0e3e629d8'
            '7f930d1f39c49b77fc48aa827826c6dff4ec9323fa3eb101393f0c0018349579'
            '3124b52d4ed80edea1aadd727c9f4aab628c922abcf359d7973acded5ab30bb7'
            '11537b4ef6e6c26af943ba987948a3ef5affd156186be7fa22b43098b6286419'
            '4a2a59447da72046fac101aaf242446349084aad4ff2d1a6b23cbc2024d0c38d'
            '62ef79e430a82c0db6beac174333eaf8e979fac37e1afd4dc52b4955424a4407'
            '80348393899721c9695b72e32740ff9017bd2ae72005dbe0d44756a8a82bf0b3'
            '02de09c804198cfad8a88a9d0d983bc1d3fead5195597bc9f9b78d88dc5544c1'
            'de6c34b44b97188d73e644deaaae19193d9c4bcbe5508368cf7f7e311701a366'
            '76e9f13442312acf2b781ce3659ae92b24b2fb98c0f9e81058189eb2ffea3bd1'
            'f3eb6e32e89d86f4b470c1c93e01bed487d20a2ed3dfa5051f593279cf53f160'
            '1ec00620aaa93b9e3f10c3866a32240e5f61bfd144e53f9c4b4879485b684bbf'
            '071ed0bf47815fa2e48e45cadae6313068e12dddbc104e374a93e6884e1ba0cc'
            'ffc3dd7ec4c54f2686c0bf0f280765c0169f37227d6bec5ee6ca3b0ee3ee7e10'
            'e986ede6bc0f8aa85a664980c9ade041eecb2859dbc683cbbd38e7c34f84ddf8'
            '8c018447810164af2d8c75b1c367e92b9dd7b1fd9bdbaac77294f24f4693fb22'
            '6cffdce30fe29e51e6564ccf526500f0dd3eaa6c96a42c4852c087a8c7dc9edd'
            'eaa6297aa737e99f5f47014b45b92dd2137456dcaf7c4b02e5fcb6791e9bf534'
            '376900634191838ad3fb3acce54776fad061aeac15fee74a8d7b75788fddcf23'
            'bc7d81a25ba93e7c2620d51007cb6496a788d75632751fea05905c57247d2009'
            '7a344f9861d5c14c1bf4f159e1d08f484b47a500893b29c899e0e39c36e116b9'
            '57ff423e51c4a116772a628cd4b20244f2d8c26eb43a8e934c85f327e1671ecb'
            '34aa74a94661d2c23d858d3aeae70d418976db1310854dbf915f981c6eee59cb'
            '4d3e98f14142ede09faeeb935b03196c82f444ac8b4db6b014fec105a756a75a'
            '77794a8355a135291f105cacdf89bf99781c3fff86e1295e97251adeb513d26b'
            '4a4bc6452d53b0b400992690c37f8b5793d9880f36def4b2d4b8cfa81d8b519b'
            '66386edd843bd0b5202c3383f55e26e7c7e590c0062925364861997e338cbb9d'
            '6bfa5b1bb246f1d0bb549d4ef0458e70a5b55a987c8eb41d63e47ebb17701ee7'
            'dd4bd858b2afbb857b398b677d3e4dc54d4a980c8d4e63f364b5e77b77c8dbfc'
            '791f9e5b88b9458f15271807e77a7a7148959125dc987ef052da18367e7c1c6a'
            'caaf40186402d0dcf1a6f9b3b4489af1a1e8e0cd37f600f69139a5d4caa17af2'
            '65f00158236f2c9935d4454af9cdb912ed0c8f8ef111971aeeef1a6ecd56c80e'
            'dea4490cbb339768270ba36f740be55893dae610214d7427d728b6453e3fb92f'
            'a5d2fe36212bbca5280e0d4fea4faee5bc128c25610eb82a86192380d13b22ef'
            'c8845e95c80b2a76ee846c27df3c780f298c7e1390957ebe7c50a239bb947cdc'
            'e3c572bd2e6ba7d3a25c50ca889e0e2103416ad6ea56345a823d698d150c866c')
