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

pkgver=132.0a1.20240921.201142

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

sha256sums=('db32d445f22fe35af3f0799a48006b0dd9640855457497273dacab1768574ba4'
            '1d267defb77e9e8af5cad8a2f7be11fcab3aa4e13ab1327da64324fb569a4937'
            'a72fbdcb321e4976b4e1b27ebfc6a83f983ec5bd78b88b45dec3d31dbedd7c62'
            '2ab13c116d9013a57d48c6106083e0ef710bbaa9daf2fdce87f527b2988ca25c'
            'fcc266ae66ce2288dae8e1198b84462d4d7d4bfa914946cd2b8f2eb4edfb7d84'
            '44cb2c6e14dc9a250c0f9455260f25707ac19e0d9565e7f812f3c2dd72bce505'
            '7ac2fe6c692010a5604d0a5eb6263a6ea29321320754bfaaafee5bbdef80fa68'
            '3ac54bf3bbb00221c30dd8f5d1141050a0a5ebdff6dae3833958d7ca503cd72e'
            '3f717f1a2916089acea63d8893dcf754f9e3eafca862e96bd611e8684b6a72d6'
            'e881f8e82b91c77305c3124bf9886eebb903204056dd4239c07916ac4f59be61'
            '954c910afc2d9fd6028d500c3959bb3c8e6a371c0f82900f7b6e2394fffa886e'
            '6615ab3419adf5a669b2450b158da92fd3fe267f1bf2348b8ccea974378dcc65'
            'df6b02e6c809e11d1de66ddaf8870f9ba9c9689787f4c418454b7b5210118375'
            'efb0fd5caaa7bd4eb3f4b978ad0bc01c474c3773d577a1863479e3e58a571bcb'
            '96c16d996b548d764c5423e19269ae9894924a73f463921fcb052c01b2d97700'
            'e0b540f40677eb41e0fa93935023a6f5fc62a743d6298aa127964aac99d56e76'
            'b7d0686828dea223f9572be29a34e30b8218d72cf29cd693b4dfb0ed017e8579'
            '1b112459a95b4d90555defa45c0f23ae4e6abe20efbc42d31787b15056bfb7b8'
            '1066101b4044f307f240f23c4902c09b536f22d76903901ad0b5bf0fb8ffb9cb'
            '1c1762fc198630076aecd4ab14a3c73fa12987f014540cbd1e3f299d39b59172'
            '70fa4b0b45d4f60b1a455f78d5ff103f39bd1566c77ece2a181df745bc05942c'
            'acdd2d2adb60c0c24efc65db7d133317caec9da86ee562963ffd2f86c631c5c4'
            '8681a6d0fd3e6107886b353151996973e688c372b3f66698c6a671b6f4548386'
            '5a6fe83349df963d4a96182ba791c265840f0fc99c70e3fd08b1131f360f6dbf'
            'fa7c75f0bf075a5fbde1d736eec6d32ef1d044385577681d964dad6a006948a4'
            'da98b8acdcfc71665aae6fd7052f62fcc0eacc2f92a11f190fcfd80892afaeb1'
            '09c454461280fb95e6f3e811e6842705bcf8b27680daf4b3be308fc6f9fe4bd4'
            '8b2211579197b370fa854581c49818f61c4b00873e4c9b52a4fe97941d9a4ae7'
            'a1f7d84d100b677bb5ec733f3cfc43047914f15b14b3b14fc91ef4dd356f4c79'
            '2920f58c9bd10305e4b2a8875d16c497eaf1401ebecf773ab7827226eeabe71a'
            '8a7c6e6f37ffc7ebf161346d92ad10fe6f1978c02fcdb9a538c24041d9e996cb'
            'c509802d023d69d38fa680a3ce5fefb42dce9c3a04def8e0cbcb2df72329725b'
            '2a7e160eb21e0a89d6a2708156a2866f54ee342f272100cff5b4b7816295711d'
            'f56348a93b80a4278485cefbd1d6f008dbe1350f2ad06c990a85883e7528fc73'
            '1a2186fa9d8c94717f1cd46eb3c9d4013b01820a3b9296997f6467916db79137'
            'e86a04dd2f011dc2c057b11d8d774d51096d1e76b2cc0ac942ee7df9c7f00e72'
            'd0553c1e8cdfb784ba923f9cb99858603f7569e7f7e997f5bd08eb5e5fec2f39'
            '26936c1a84e8b579e4f88bea2cd10435c4bc90137e77f7ae59340e53bad486e0'
            '5bbbafb3d70490240672fc4436a59125997119d5ab39fae7e40bbf886b64cb5d'
            '0638049463d90deb22b52e34de589820b3b272c4690a94c9122b40b63d0e8287'
            'a6fdd53e489913f099b7db2a248fac024051104d5752c7d0564f22156c08f6ae'
            '3d452d6bf473216905db73f69fbbb2d2e92493d3ce300a55309e32d80218fc51'
            'b608b9979e925d9aca4842ff742c3038a518271a9e54170eac303877b50c201f'
            'c68d2773b7075514561abe0e0a14cecbb93eebe6366ec3fdeb3502981a12d1e3'
            '5688317e7adee016d8821a981505f1a8fdf735d5d97ef1bcd68f9bbfdae1ab6c'
            '64180ec49f550da7715497c4dc0789ff07f0d449b80e5d64ff669b5bb5b2a941'
            '9925fde39ebb8c91e6120a8a2ceb2e23edb04decdd1d6f72b20dfd9327861203'
            'f4a9e123226c445fb3971df2070cc4c7ff0be4eafbc072137f73709e86f364f1'
            'fcf1604d02d2d82f43fe785e963a2c59a8b27c0e8d4bed41a201d3b978c30f92'
            'f498cc4f05ea01e7066ffd1729dc6fa35bf0a4e18f1dcef61c26bff72f318f1a'
            'cb9a48edda7c87c2171be34e498c2d0d504829a192810d6c340d55ba5c7289b2'
            '857a3396c28f7d32803d9c7fe1cef02600627eb44ad2b1bb3a5fb673e4cb567a'
            'f99ccf99d9bb9328464f054a49c5398b8984a072113af5706bf44ccaade99b50'
            'b3f1c8c180e252216df00cd1502f9a97295e3ac7e95e9974a007afc8cb1db259'
            '9690cbddd557cd5d45585f4c5f50cf2860129e87b8aaad59139c716b4497bf52'
            '232f05d2da6658731ddb7b0fd3918488561a92dd8d4030d6af1bbc64851db081'
            'feaaabc3d19176690504129695dfef9218da70035c182624d767c3706501a335'
            'b86c4a34b7c581c904d1adbdd43c80892cedd38cd6f757b831f7940dce3cbb9d'
            '6e7a599df6ff648b825cb8482226e5bfb8439aa7ee1213be6fa661288db5c991'
            'a0c75023f3f8f898e3c3cb7a7f1898636f7e30fe08ccf8d718e4fc9465b4fca9'
            '82718338346e05b0e5ab6a394cb368374dd081432bb08261caf94b43141323a0'
            '1276f7385c23c87a502b1da79ddefad418fa64b0dfa41f51ae3d22e9a170ddce'
            '01b542cc6f6a7377dc795ad35421adf2d234bfc369d479a4ef4b8c253bc88ba2'
            '9bd0d15deec115bc96b57d7ae05ce1d774c437ec411a5b9328c6ebea90d784db'
            '9512a0f04e6f38f515dcc86623a00eb8291e95fd36690d1b889a72e65160df88'
            '3d755c28f8f67fee439d5b7c6ad31913e0b9836fd6de00e51b3b270fbda98ceb'
            '47b8e26444e04dc144038268e7c28681c6baf78eb26a524c90a5eff55ac72141'
            '6a0bc1dbbb4090da31179b2a4a0e5c2c1e09b79f0c6cf33ada81ce19a27cd86b'
            '394581256623bf72eddcf3f8d954c995fb66c19fd0abf899d04afc43acf0f4e9'
            '0476f0b88afb2ff6665bc608e345d437195bc6c0f7b8862a08929b2adbf2ea8e'
            '0c85ee553585ae9afb0b4bd9b45fea7c32cd12072224d006ff8a9a526c018594'
            'da6620de17ecbbb18cb54aa8b832f48b06330f8340e3f4be6b371af56385518d'
            '18c01d08659be05dc8670ad83afcc3a7564d63c05c9b4922629de0199d2f3b71'
            '1ee902046dcaae0098a8b12ce9a06f8a12294fac257df1c1a4ec7a421e514bda'
            '3bd92b70db348074d770ddd97165cf17dfa65dc660a75959f9fbf012b5c7b60a'
            '2e0b996713bf6117d4ffb0deea9d92f0414058c19464c610aa006535a1605c16'
            '15b2d74297a9eca6d348d635d64adcce798d1425ed27e936d01270e25894180c'
            'f9ebcdc4be1d488898433897411af40d6a4ab7db4a0b3fba53f66b37918f9247'
            '7f37b9be94023c0c6884ccc439f6d4285fb5ab6973e323001f220f80e4a13c54'
            '052b3245be2829dc4ba56d5a41684905eba0887634ddffe516b2c90661cfc9cb'
            '291bc118708cd925103f8e5873f7ba7e0788e3610c332118b8051cfe2d6d93b3'
            'd3a134956290641e5bd924631080c0bda82f7f2d4a8c02761fe5ed541cdfed67'
            '6e76e72b015bba9a4bc3d61cb17d2bdc8a86ebf0a4efe837cf7721afed258bc3'
            '6efb08ce05fedc83c332745bc0f0c0fb483e17f7f6de5e5457da0b94ee5812e7'
            'afdcd4090fc76ce6fb94a98b43a8db19ca5ab1dabeadee1842d27ad2ae1377b5'
            '6ccb6c9fe401ceb0a434d884726e3fd7a8782f11b6d67a81083d6a2de3f5d4e3'
            '8a30e19d4a90f9bf859265425d8d9fcfc14a19e4109c2c6c2704cec181d8cc08'
            'eab76aa5a208ae8e1ed0aba01cce008077bf5cb372dfd37214d3da578a90ff8a'
            '9cce7bffc582d510e9b823b09a1b6216c3cf735b02f7f6cf8a52c05d599b83db'
            '754e0e5de6628acf77e3528234c091711e26a44fd2790540622c40638d9aaaa1'
            '019ad9b52cf9504f3c379cfe71bfb0824e20d1ad946a7fb264cfe3e49ab18046'
            'ab19ebdd1bf82c0045028e0a655ab9d853b15dbed381c04ff3cc84d9147e0c42'
            '72094c071b76ddf137f621e56757cb2607669b7f3e5be6fedaf5874e10fc767d'
            '2eff565c4fed3e894fb0a3b106faefc8b439dab0dcc4eaf4a66071e49144f27b'
            'b45d4057a2c0c3bb0c0e6342809cc5ed76aaa871fef1d7e50d77188a5fdabbbe')
