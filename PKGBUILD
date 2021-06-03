# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=91.0a1
pkgver=91.0a1.20210603
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

sha256sums=('a6cd7540edd2c44ba41a086355eac88cc55cb90e65ffe26e7e9812fc49bf77d5'
            'd05a5d6da48d2b0aebfa4245e77688b41904aa5f960235732090d7ed567c0005'
            '9aa42ac6de337d269d3a32dc6578734ca958cad4d46e0d2a778b87ad50733788'
            '26ee6abaf100215bc2074ecad416a01389c9e80e8566d1faf64a3f10dfa6b26a'
            '4960f68b40a409c782067231e8585ca167ca5b113e558efa389dbccc150c9b06'
            '1b40e5bc26a0a9d4c6a4dcfb9e35b5c428477e7ff42d681e1be5c0624b059917'
            '3cb3fd98fd6e4b220d857ca7bd2f2ee55f888f3a1406d29055bd67ee2923460c'
            'cb5d934a3a9d1f8f9a79b01a66d377f118faa513001855bd3614b73fcf3a4a6e'
            '7176a272aa2348071f77ed75f427e2e450a3892d89cb6018491dfac6ca3d612b'
            '93ee83f5831742e54b2c8d19babe683186a55d6d6525368d8e84c940d26b4905'
            'b908f81d3f0796684bb02dbac47cbab8b57657ec67058f5126cf5af0903047aa'
            '66fbe148b95741332d4c7ede00c7666da74dc92775f42fb16fd4b5d5a3f1227c'
            '315d2a1c035f2b2ba2f89c9064c4f0a96003653fcd2b136005c4547167c5e544'
            'e8bb63d4a101e594d5121e1f1118123fb2cdebe69f257c3a4d05184160948b64'
            'f82531ea1031a3df6e8dc686855955024a833ea3cd5fedd40dfbe69ddb31b834'
            '4e9142cb390e790a856b1ada5597edd57f932672e3cf7f5a1fa850cab70d3224'
            'c4929f0c3a90c2a07c7d9b599f40d8f9b331f7b289efea526ae018ad79c89e04'
            '80a4d50324e0931b48fdb1a828fded1b1cd60ab07c3a15b553e017476725fe29'
            'd0bff00d0c53f88259d2a175fb0096c21ae66095130ba81ab2480d9f531b2782'
            'b9f65b198a7edc3756534cc6a10f60636f1e34f260409fb76add0aae3c272bc7'
            '8fd16e87e69c2bd0f7a5eebb4c891fb62371ad9f865e66d5902292db55ae10f5'
            'f01adf330c6b4a727c95ef80aec653f903c1239c6b5ebe1de1d0f6f8e6b18942'
            'e42957c5531b244846d91610271abd4e231cd47631749cc51044aa2199403a6a'
            'a513da93d51b56fb853a08386d5a4ccdc1c0462e997b0a23685763f195594abc'
            'aab56194b7d2b13f00f1b9341c7bd2c578953f7c405b0b719bc63c7ba61f80cd'
            '4c7d44bbc84e57558ef70203a3039516a67e47d5c7b57c96d3d20ba2f98ea52e'
            'e302a9c00f4790966106545935bfd009f74625f5294b47f89f12fed06e459245'
            '901ea392d0f4444ab29edc6143391a3c0fc0b42d527607c7b4215006fcdc6eb1'
            'e851264a8799da1967f60cdf7f1d23e4cc778e596b8efdcdc8a9b5f28cab3453'
            '51fbbded36b793ec5b10240fc572e235644c12680ba50e30628b2a795b88fa81'
            '6301b6e04a1b8fdab1a17272f427f69b0ed98d924071f937a2a40de39813dc9b'
            '531fd0e45eca1a8ecbad1ea0183919da9918e872af3ebbcea6d7636fb8c97005'
            '82a8c926389a2dd471e851fd147992d8acb4adf98b57fa495070eef0177d4639'
            '114b3eae35163787d0d2289dd92d87070cf64d08cc25fd4ac719aab23b3931e0'
            '460d1f1dbdfef863db509b04c55490976445c710a321631d1c2cca1d723208c5'
            'dab90061cbc388b442fcf53a3b350eede752c622663ba1079b2ed031cf9ec3e7'
            '615d6b429c86a83322cfe9a8dd3ae4c959abe374f5eb694b39de151ab6b9dc3d'
            '78345a51fed7e2f41b760975478c7948fd3603c30f730938abbfba330cbf9f90'
            '16380bf40c066fedec9d173f79b165f0238189dd5afde090cb0edb5f5713e384'
            'ef4402b31b439f59b37e1c93fa81056f43570d5556519489771e82c3784a8e56'
            '3a3c99f7c32d4008d5114317910656ecd3b864697876a699bb878cade4cbaf9e'
            'a2d668580f06c2c99c08f3361c8fdb0ead84c0100b8fa22dc04986c809ea3547'
            '702e0769c35e9a399ba01def0da3bbadb8644b065c1672ecc66d4a5b3af5c8bd'
            '54b424d06785e55aa3b69a072565628ac4365197d6d023324775bba9533ae6c0'
            '8158d18da3380468c388471d8c2021954534ad72828f2b253aecdce0e8b1604f'
            'f25388058750b8a73de7336b5c6b694e9ddb55f1f63241c152d6ff6896fc2826'
            'e164449e396e4e7e038a4f557ed70e9d3c1bf06888c33f604f50d83fecc84186'
            '14af1fb3389301578386718f73760b9ac3d9bf488e01e6eea3b59667eb4cb607'
            '390ed6b2ad7d55ab251a793f81e0e9ba552e3e9f49c54d502647ed7b0d3231c2'
            'dac40bf9a6a9be4f5ac73d1eb8b35fa04ebf49781912de6761b5909da9bdd2f2'
            'ab8dbdc80569d77c70a6a58e5c5af0798afddf6f32df47c321957f095b8d7af9'
            '2087f3503b584fbb9add6d7185e1a654d0d592fc16f249cb9f3dc2294179684f'
            'b32bc3980224d1710013a1e19fab697b108bf1d70abd85c2fcab6379c2fab52e'
            'e41c115655fb162af7492eb3fb613561c1407d3bb3e9f2f1a5506516fa52a095'
            '09bc73a0853161ab6a6974465ced14a4e2d5c7e30fd1f78bad649e2cf3077437'
            '68d86dae7ed1c6f4e70f1ef3ed6ee5f45f3e82e83eb9084218f1189b88577f52'
            '02db6a33137c0cef27c59df29e430babe49ffe4e0d5e24c536feb44f3d75f927'
            'ce432789ee503d8c9309722add15ec81b05b061b6ac9aa22d44607ee1a133745'
            'd629b95cbdd4a27bfa3b3995d34cf1fa5ccc5632e5926a9a514d27956e4ec10d'
            '4f758428ed0dfd30837778575d014764d1a611509fd5b51ce22e7e87d0e4e8f5'
            'a14d3e6e8b770bb58f9e14953a968b96613222757904b862e27e88dccd3fc32e'
            '32f0dca72a09f5379e5be6b10052941b43dbfbbb0e69b17ace444f3b29a6e6b5'
            'a030e6ae0285524529937ceaabf4cdd4f873f9ac2dc117f5ca9791ed96193a89'
            '7f6adf8032034c4a2f420ad2e3f23c5466676cd1dad59a8aca21d734344e1d4f'
            'c31bbbd4efe0033fa4b5069ec55b947340311743b288a707de8e3ed6343d516c'
            'd72b3a77781f1847f75096ce32e215c36c8222788762c3bc9f8794360945c67d'
            'cfbdbe0651959bf9f4fe3731aed41f92aad6ffb4f7b70a4eca4709c9f7fb30d0'
            '41a40a69e62c58e7640abc891a51717a48c8e9acaca08f80e5520867d9bbaea8'
            '5a1c4f1e7481ada2b697ad4bf93d617065a8234f5824046f6a520f185d6682a6'
            '644e1ae68b7136523b4866f0284fde73fa718ddc0ce51f43f43187b4bb60ee5e'
            'c793d7ef814ef64b073e9185bd9beb22bf0a96f043bef0f19aeaf6414739f838'
            'aad6aa218cd1032c9cb2d3cc14cafcedc56a82456689fcfa78fdbf64c213ceaf'
            '20166776e0ba3d00b23586131843dac4e62bb6b46c19e9579cd146fdccdaaffc'
            'fbf8ca0159a075b9e6bba524b0e6d6400217f1c0b19cb5819a368237520bd7aa'
            '41b33d884ee7a517ba2ea4581ec0877ca8aedab65dadaaa93f4ba603d92b02bd'
            'e02ad3625420e5f52e2dce4097da70078d4099dae61d1ded4c924849cc2711f3'
            '8ef7cf3a159b6cc8268a50c143996991948029d15b70158d228310487228e263'
            '52ced48bd02d6779dc7779b10f0834bcdf2c455af6025d5539fba04b97c53131'
            '504b875cd3d6216a147007f9e6263a6e0cb66e88e5edcc9dc23cc782c43f489f'
            '5c738ebb075afc150f77a2f3c07aceb0ec297954c630abc4d151750789da3946'
            '2c407da7ce255c5a9617379077ecf3ba7995130aab43db8461cc63c1dccf884e'
            '33a4d07c7166d5216e69e79bb37f9032e77c61aa5f26f5da94abd022ab9c89c1'
            'd323e89b28a2a9ce2c8445277d9f032ac39064e670b1286a008700df28fff910'
            '2275016a00647f0a1eb5d8442372fce046b17b68e4ab5a8c8ff4ec8bd86d5e5d'
            'f2296270a3dc0cfd98661cf7a46e5384faa9d9f0e5cbff682fd6f3c66267d770'
            '294bc42ecd05b74b1362b1a0d141e162387e41a519e2fa9e01fd23337861cab0'
            'f27cc90f4f286a0e4d69c3b54647ed9cbd2959605ce1f51943f55f7bedb9dc5c'
            '859efffac985b5af5363486f9d349c93cf57c0b8be08e97518a37c01d2a893c3'
            'cdfb86f20f666b83a7a4e95ef3b6cda951a65f4b881dde69063bb1cc8da0582a'
            '4b1bf77f638b75614c6bf7df59ad2d79812bcbb4ad0d026a081a533a281c1041'
            '9aac2be1209a95bb33a01c85865e88a2f23738af1a1cba655c65cb8602239db6'
            '90bde941b5b972c53287289d34cab01d4d1660fcc29cf12a180d302f5d87320f'
            '0be117c87fff8d956159a4ecabbf438a722f4a485a9b3cf8994088a207186d05'
            '1e09dd8166f919a699594ef9d05b9354559bd0f9ef20113e550129eec7c50a0e'
            'cad923167249d2e54506dcc85a3468da15ac82177c5171c3671880cbf78dbf24')
