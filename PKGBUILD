# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=97.0a1
pkgver=97.0a1.20211208095339+h72b6de9deab7
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

sha256sums=('7fcb67c6af699ba98575540cc0a46490e7d4dd94026a0584032047bfb9aed739'
            '5c20e7fd0a4acadcf10f2a76f75715b559c591c7a227ef296afcdeaa32d2e2ba'
            'af7c68bd583c2766a0d5fb64fe27b443c75ae65ff6605ef11a84fe8c99806c4b'
            'b835e1a91603867638cf0432c2b1591260c496b375dea8449ed2e33dbb3e4ef1'
            'a8195c4c426860c2434d4bcd045013c236bd1a1d9fcf5e5f2c314362bf4a3c68'
            '7bc8cbebb0cf2af91f87d325ca41263e097069dfc45db735f49effd776fa31ab'
            '4df643e73f5a1ea9bb81d18a87b3270cf5f832c0db9bab693b933195a8867cbc'
            'df86b43383ec5af08921fa229975b714c91fc93d502e0befbce8bbb5399c7d5f'
            '1a62ed18c26f281131e210df35a7cbfdf20efb286aa28d4e325358be58362760'
            'd216466d8e95e43c8da2253a5abc79a47713114547b000fa828a4b05bbd43000'
            'c38985d439b4c6e778499a9f3cfb046bbbf7459e7eadfb4bb44b6303c928bcd9'
            '48cdd7b4ad5d878b07d5f8c18877c2be706e913984cb2b2d2e55d311ce75fcaa'
            '46c3439c8d9d350f300fe484b4f28b626732d97e2aac5e92223c7ef875be971e'
            '1b36e8a44d3d6bc2dd3ee2404b04f9d44d5af4d590ed21e855644348aed13d7a'
            'ee2d9806ca7f34dd0883bbca018d258046bf3539a2069bfb9212e818e7cba751'
            '8dde6e5ecbcc630ff079f15a8a55dd925034c24dbf00a70226210e25d1afaba0'
            'b99654d36bab930bd167b928e42fd79bc2b45a213f0e7f0bc0e5dff3f0b4a45c'
            '6273e0e623ee4c12d64d8564e046f2feb45ea65549261a38f994d8445ca3f745'
            '16bde20c42cdb03094a182102bb1343cb01e431e9e921063f4a8fb81f707e14d'
            '2b7876dad1a470fb0ef62239d19d0a1820899772bf1de4ff6e96836e6cafae51'
            'aaa26940fa35cbd9e2991a61c68b8eaa148ac4a37c07db6e3adb771beecc4c07'
            'abb391d2080f560d80721bbc008cb1f02029cf237f5eac926c9b7fcec519c17f'
            '9de9761d1ee5f4101eed396a780c18aa4268691584ddd1cd60bf7cba91bdce26'
            '5f90d89e513aa17c5b9a4a6b820dd6fcf2fdc7538180fde0f732f64008f54b88'
            '3ceebc06cb698d5ec642af8ad8926eb2539a32c39dd4375848092282cf79b28a'
            'b66e41561627cbc1829c577b81fd935881bcf4cd4da16f6dcf0b3fa74210473a'
            '1c14e8dbe8ef7d6ab4febe0adee1f0d652414c1312534495aefd9792cafcf51d'
            'bb0f120bee0e48b7956467ff301609b2293beceb00f8b6ad78bea927611935c3'
            '16f280d774765fc5ce51a9210f74dafd77a6694edbfb1eb81671c91fce8bdc7e'
            'c31242498cda53fbbda49179e47ad38d7bc5d5a8a027f781b5d3f4c98dbd0cb7'
            'd323cbe22474e0a2e30e6178a8ec3cd3a878b0cab4c2dab95394c835f0354cfe'
            'f19e4f0610be857982121af26a47c9939156245f4b5fe56ac01e2e36a35d7b34'
            'cc3a01c97350512adf8200fe3c4c288ca655778d6c4002d9953d885bf41abfd1'
            '8f4b3bff69c147666dc263b31f922174fe0d09ec4163b0149a6d25b8e198f757'
            'cdebf59929737066c05c23409bd979f099af7ea294d10c0928d8ac2af02f5fa1'
            'b87ad7dba974467934505fb514630fca6871b88e95feec50176d8d2e9d92f282'
            '0d2829a15db684a3f71b0a920e1b663a156384614c7819969363410c6ec93169'
            '2a6ea764b1c3b96f716ce1d1650ee340b9de9bda7a50469d7b2205030c5095ee'
            '21642844c4e7931739f8daa56bc0eb3f16e6d58f1a83adb2701ed61d824b0a6d'
            '1eceeabee44a04ce6065b444a857af3470074ef8a524427cde471e01816d67ea'
            '1c38f16699125cd610476e7b36dbe0201fe696cbb1a192378836464bc8d9c847'
            '975b0718b5020329c193f6863bba8f8eda6d915227c4c44668898fc5ac991390'
            'ff2054d9b0405e0b999f52c9b4a49d6150e79710e2aaeaef7f1d672c1ef43bbe'
            'e09c58e68cdcab99268f3572a932008c6123824e2d7fd4f3f80c6b1174ad38a2'
            'cb7e208aae5a7c0f068cd6bd81473cefe55db60a0d70e52fcfe59b58c725b8e6'
            'd02330ff2bd37d4191a556cbd04d2a964d5572554719470474f2a8b6b5e9b115'
            '5a7e065e5678743883642c578834667bfb1af86e9d780c35239718de734fcf30'
            '580278a2f078f48e25dab1d8bdcc093142e1fbb4a1eb86b2b28fd00c40be1706'
            '9caf0f66e395060d57b8ab5bff1583a6310574f79693ab35d9379722e90764f0'
            '4bf3e8ed7acc74c7e808391a47c6d6248af690c36acbf56b007c6cc2a9e568c1'
            '5cbfe6f767e6124fd4c54388be477c2b891e862b486df4f70606c8083a782aa0'
            '23153c8fb4da00bae78e41334b828523c305af2221d5a124d7270923754a461f'
            'a538d462c1d2e84382a2de0da6bd9306e48dc38e6e17d0f67537de9eb0a88986'
            'a7950dab9dab8d209be7c7d39ccfe6b3b98fe0208897c30f9819ced8f3419287'
            '905ae08d1b9e39c8a693ffa08e60b85da39800c5d5a53cbd4a07f1fd71571f77'
            'b2604a3097f4e9b654f6b5e12e6a3a7a79102c0e88c2bb231db2a31bc9d81a99'
            'b26bc37370c735a3e5622dd0aba3b7129f3fd19d1404e2d1b2d28cf84fed194d'
            'd1eae397441ef0148deea5c4aacba34e6d061d196af94c00ff581e77276a405e'
            '65f35c5ca37e84e185b045652d85cc94df9cf5c37b79ec6859b828d21ac74697'
            '48449acec5f27e2c8e1acc31cd571684d1b19230418090c2536df169348b57d5'
            'd5f781c20d815329589cf54000c68f7e4bc6cc375d94b57275244063f35b81f4'
            'ec7432a562a173bdd56e702110ae876d11c7f93d3ac031821dd8ba3f7b6afd56'
            'effae0932270d414b62c08262dae5705966c7cbb581b9eeea9b577a85a445990'
            '3809315a94f0435fd5370e45b1f4cf670e6f67bfa8b75c87f535c89ff191deda'
            'd1ca36c16df1af896065eb551671239fbf1e63efb3b491951aa00030f4347e45'
            'c3bc78aa46b4d6b16aec1f8cf1ed65555d4522c0dddfbbcd3a82ea3abcfd40ba'
            '5d220485c43e9f13bfa6b327f339b4b997ff38bc97084039b8f8d262f5666b32'
            'd40d942d4b08e626cf462572a1a4ff4b7182d6954bb88eff704e930a738eabe1'
            'c27c12779a7d3827ab2eab74045118f8803f1efc4c70b09b6dde64af3b4b220e'
            'd126f47d8b4702c12a0e6575c4e25ab90d992b5569e3df81340699d212e1ea1d'
            'c457198aa814b3cb6d66cbf3461c4c6d9678cb09a4952da5249e5d5ecfc2c24d'
            '977528cc43bd7d70832298acbe77c7e4c7bf4a9eaf71654b4e6a34c335fe87f2'
            '04922466856724932dac8c5fb445244ed8950e7c8ae35f42d8185b81a9ded930'
            'f9b8cb8f9e10263ea3c4a7249c423b3ff5adce73c2a71a43370a8cd5a984f9ae'
            '97eaafe5c4eb067bf146ef70e5ac9da744ed78f7ead2961a8889c3454e433d05'
            '09a4bddd3d4e44809efef4c55bd6c713f98e21a1578d75013a82b6f6f8b7e02a'
            '34c411fb0ad48f900440af8fe9bff6bb52b5b7b6466fc29876c41cf92d59dade'
            'd8a34906a4d6a775534f2e05f560f71946bd05dae22bf8fbc0b99c0296162d2c'
            '2e7840a15faa74a5ba03b06f59bbc5e23175360fb74c766d6c8b4290293e7892'
            '69f66014084ba5da835d2ed6fa4e016f336ac031b9f36272acd98b5046c8f340'
            '0a651456cd4bdc61a0f6093e2403766d2d7942055778734a5ef0825491765613'
            'c451e626ad3fec8f07b5b7962cd342796e46335fabfb2ae2dce694741161d1cd'
            '938a974c4f6befe4f7ac463d2c260303e2403fefcd3507041bc42c5466d1766b'
            'ad237030261a5f4c7773610f06470872de49ccbb4a676df6defd0fb3d36c8697'
            'f4a5f1fa48fd40b501db2b899c9936398aea335aa86babd3aaa6991ad83ea1ce'
            'a29638428c9d2654e3c677c1da3a94344afd4c3dcfec460d7b8db9b8adad1399'
            '60afb4937906b6bbfab34480bc270ac0e88814134513dffcc1fcf9f931a29ab9'
            'a928aa08c46648b5f6c833827d1ea7c408510b59323a3b0b2ef02a3c74fbe069'
            '5dbb12cf6726dcb9ef3fcca4baabeeaa2e76cf151ed8ef76a28679f4cae3c15b'
            '79c376b2642047c2b27863dd57b70829d78a774d791bbb3605e3a394b73d0220'
            '89bfcc63a9a9a606f5b5becc158cee3d684379ac7746cd1151384e1d8daa5d96'
            'f433c9448047164efb122e058fe0548803c845052547d21cbba38eba10e8df84'
            '60f97faccee3a31550f4af52f1a281393ab9ce0e053c1ffbe602b89b8ef07894'
            'a3d35485870d248fb06cfb6bd90c8b189b03849e54e89854b46ea7bd45e817fb'
            '9b2427a1597acd11d7526cdd3aa52634669557e510e46091b2629335cd762a9c')
