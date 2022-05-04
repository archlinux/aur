# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=102.0a1
pkgver=102.0a1.20220503094208+h03cd547ca0b9
pkgrel=1
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

sha256sums=('380f0cc66ee4677bba932059e920df0c6d3b5ec66117cf3b49436e90fdded417'
            'cfa4e0d65a1b3b15f547063b836ee9449f682d945c9afdb66d7b393c0503ec5e'
            '8ea763c0884a77cf9ad742a80a978429595fcf51c8347b84a4aa7823acdad053'
            'ad969ee8e7be63ba91310213ee933ac703e1f3ea394faeb023a106cd1f7ce68b'
            '4b022f99fde0b0e19a0d64e36848ac68296ef31757eb959945af4d7f7d9a65a9'
            '418cfbeaa5d8266e1e9132539b4845bd74a1c873ec3cf16bc2a6925c196c01f0'
            'c073a39a81e7b99425a08975817c0d5d0eace86bf82778010ce793a1a84d943d'
            'e8ddbb8881a89a6a408a7ae81fed6ed4eaf26b814684ba9db946f5951ae9d8e4'
            'c22956c000f9bdb43a02bc2d6d04756ec1ab1bd5bf711b069eccc012167b2bf0'
            'c4edbbf024500dada41126fc1f10ba95aeb7813ba33a89065155f24c691c9c91'
            'e660d50c084276331f2d447159e4f777f7f82becf19a73a97ae3d5a1c56a412e'
            '5da27f6d458343c525b3271aa059e2ec2dcff6dd11678c06b3dfc0bc32c7f442'
            'fd6ecd2d4c6fe69b48d7bd052fdd28f83062e2d5c375f692de5a0db876e1079f'
            '1770160423153f423fb6f36d7aa786df22c32ef030dd371a58ee9ed4353da691'
            'd83aba4970a6cdb3c198f365750f64a9acae23a308ed3c975a42466a86611628'
            '545c53cf13a05f1a03ed3c4aa8ea266174b6ca50bf254ad9e137d9ebee7ce9b6'
            '65cb4e1b1a8f099666e1e1a188ec20964b538965d87de14a602e191bcb338b2b'
            'f57bb443b69add2f355f833a9329ab399cec243c7f586faa426711baa511b453'
            '0fdbc9dcdf7cc404b5b4bdeb6824a79fb6606c2515501cd71e82c005896f9159'
            '66b23f83c6cdb154652a691c0ff8947b10ed0d520fd9c2d3ae90a34043a27123'
            '9fa0aab3c8874405f06265a645047ccca58928c6766295e49b41976b166201bb'
            '40391354c5493e1d378b671262a2bde67300aff75ccbaf4a0d185da7e256d865'
            '80f11dfc51b6faf330bb9ff4818a9848d2158d39b23c4bcdefe1a5f9fa87b47d'
            '4d2d5a960bc59dc3fa53808fc59d8d7c7091019790f8d5b99605ed33c5a4a399'
            '9d58dda9554089ad5805943d98dfda09bea174dd865e8efe7bfb018257c46a52'
            '2bc12a8a55b5f7b1eb7836a67fac051dba4ab4491afe1bafd4e69243ec7ab56b'
            '397e1e0787f10d98d851203a9779ee31ed3921be9b66be7fb3be3203c23b7237'
            '02f44fab92ebd89b100c206e47cb3ddfe12cbc6e590d2d35c7f38a810ba9bab0'
            '56dab7b625f0636213c4c238f82e09edfc91e47b879451e4d73e79f9b0cc929a'
            '2cc25712e0f54ea4c2c745577088af777161a053a1d9c2125e3a3d64ee7e593e'
            '1432633a95dbfc42751c9d4a53f3f9f9aa0b4f021291e1034fc836e082f59445'
            'bd0ebf6b9feca24317286beb542d73b44e6c7e88945e9a9194f9c0ba1960e0df'
            'a8edcda8af5aa1aed01c6c936d31a5c1bc3a0005ec41ae4bcb96f003e04f9be9'
            'a2b1265aa4dfa744c75eb7c915496ab621751c8a1c5ae85bcec4a820aec75cbe'
            'bc79d79282c7bb0746b3f8ceb2442dd32700b6574349b13a5776961c88e10755'
            '968e302147fd76757930109c62a36e5ad92f158457f809db3e7fe7f6e5ec3440'
            'f92a88645120cfa4e26f0253f228d96493eedcfd1d849198c03c03fd2633cade'
            'cd42fc898810b88187e62a91456695c4f8d1f908ee6a55368aad05bf83e5604d'
            '6fc9f921f6a9bcdb1763552a243f8a8bba1c8dcac480a1d1bc770eb2a50cfc53'
            'bb04df61730ee40462bf65ff42241b222bdca531e474297d9504c877d9a7b656'
            '488dc58aee6dd3b402630d7e0444e6c39b36f6aa4bebdf6b6c725b4d0daae755'
            '4ea9f3d93ae62e9977379351b82dabe3791eaa49aa5fad59301803fdd4d9f80d'
            '895d5ccc8fc5d48a97ae95de6e75281d28755cf233c535a38b1f3250d45decc8'
            'b50652bb23706d74ef7e4b3b0c814cc7014cfe79b66978fe07d9d5a8a0bf3ec7'
            '5caeaa7428ee283c96b862b316bcb6531ccbca4504307fcab0dffb4ae44c64eb'
            '23b75ad5ba1641bf9e353f173a8eb6529307ee402ffcf104b8a4a449c58b2e7b'
            'd1d1ce164050ca3efccc1b7f6e4ab624c9f8d9762936a0fbca0a0f39b9c6242e'
            '8878226b1213b3426a405be2512027512f3215822bcb3700abb8cbb2070a826e'
            'f4b7293ef9668deb4a122b1403a34083d4b6d04ac015df503e89aba91a16e2af'
            'd2b4e200241b8e95d052a4bc5be576fc5189bf1d2013ea3162b856815eb74b9d'
            'c4782fd68a0793cdbc8a051485cf9560a3910c381b813d5b90d6b965cf74c364'
            '229aa017100aab447e31fd1958cd9c46787f1f440477863030a34494c59142c7'
            '7601bc8a49e7c9e9fcdc687b062325e3ea8982db4aa886cde9755fb6d056ff2f'
            '599cb113c7df8b905c02af15d2ff6834dce9113d4bb92aa4217322769d05e206'
            'abe3a1764016428506d162c579e300d499731312ad5a4c132938b58ed1dfdad7'
            '415e78e2eafe8360ac8f0a783bb4ee8fa76ab81995d1177f45d9edaac4d11ac1'
            'd067d1c9c3ce2d815aabc270f65c671dab54721a3af01e4f5653ebca8ccf6f53'
            'c5e2ccf0e4178e1b09e549a262d9724db627795d7295f8a0059b0212a775cddc'
            '291b85ec1e83688b947abdddfd090a0342030aa3d190e80bad8e097307c53095'
            'f7bc452dad656a2069e70bb5d048556c5eec82afe0906fdbfee5906cda34a760'
            '55a03214fbaec483db2601b26a72a1c2653a12a60fdf42851988ba7764541fb1'
            'a7667d3b1ca4ffc2f13173e751b6350f0cfe08f30b8a6966d22e9f119a45d96c'
            'a8aa2e7854d4ccfcae814b8ce1fd63a57934bbc60ad393ea38f360283214647f'
            '94e9bfa8d4f9f6f78dc7d26104b9ecb3d5a078c03b875cd3c00cb70cb097bdfe'
            '29722d6a6cdad9c354a74073f6f5fe0cea9bf3dbd080b825fe5c138fab257e55'
            'd6ddc3642620f7973a581faa04ec37393ef69208c47c1ba7090bdf715a08716c'
            'fff644391ffe17b4d462444993d6e1932648f2ad703b29d65b67678ee4079312'
            '039ccc0cb688440a9ea8ed482f6444d9d77d9748f1c3e705a75b6143a8a08f2e'
            '63ab362a6f576bab064afbc3e2fb92c8b7761402488dbd876cf796c0e975655e'
            'a24a2768774e9f41904aa323de46a14e7cc4fba363231fbb297cf5843b726837'
            '3578b357858357951943e05af3ddf8319c9fdc6523d240d10d6891779cac7d56'
            '4ba19238af7fd6fd91618fba22b98e71fc37540695df339f7fc8110237bd7740'
            '3c09367f4a008c4baa8f4a8e32a17c95816031bbb6524d0f1e82657cef7ccb41'
            '6389146923fe0cd3f35cbbe5dea894d7550f5ac0f2d0f41c6e8b2ede3135cb4e'
            'ab464aec504c0d646dbfc63c5ecb1b7048f9d96c2def53067472ebc90696b724'
            '46fedc9cab0d17e1f1246d3c9f4c5f6a4a8d4dc6d2e62767033dfa5d07c85b38'
            '335d7384dbeacdcc4b920312c1f47933be673a46b1f4945b412a7a2e82d9f964'
            '0dabdd2c230e72c9690fa8f70dd0aac9cab9736416991a23a1786cc1497fe285'
            'fdebc01e010bda085f9ac98753d565e915f08b71fd013cdcea1801cbde0beb20'
            'de5115b095475dcb566fc09eca9ddc08e64b2ba0ea44beb1ef7167ddeb59b934'
            '5392f3c3d3c9cf4631eff32b51536c3b279b227de924859c9d1319043882a3f2'
            'c2bb82b8f3d1a346df6e0e2bd1896a2b95c63e7f482d2cbfa643e157ba36b45e'
            '39560be2ce9c2b7cab7a3b654eb420ac3371ae1055d735016a99b6acee9ac8e0'
            '0fb5fbcb53ba3d8ea82dca0038aa2ec93379bdcfadece0b842b0a9ef2e5244f7'
            '6644f688468d2a8103bf0f94c684afe44c5ffbe471322950d2fbc4603b20aaac'
            '2d2ea45371f7e61154bfada4e79115327e1659e2ac68a523ae95f74e0333a73a'
            '57bb1663859fb8ba49b984cbe1c7c2a5c7e21c30fbd80ebac1209e3d96299a21'
            '32655b65471b7aaa1453d236174cc252c4dc95159e7f006a8445d57a72b41e54'
            'fb1a80e2cbef29f33ded84456b7cc97e451029dca38a6c1ce49cddb1005178f8'
            '632a35dc6a16966e27600c24e3b2eacdfed57b59cbd06dfb61065ce917cb8942'
            '546fe83441fc73e544dd18b2d3f46a69227d032b30e2bf5a99f026ed700e4147'
            'c23208aa3c60875eb6ea71e9133dc5817369bfe7c9a48a6981df12e1ce15cdfd'
            'd97cd5a406a30a7e3aecff841a1eafbb4959440b84d5aa5ced1a1b5342b344e1'
            'a56d3bfa6fa0411df07184a41e75f5ad78ebfafa01b59426cb8c45fcf1647ac8'
            'b107cb8e06e3ea558461a5fad7fa0c26a83f9734fa2c1cba66d5fafdd70d3b1d')
