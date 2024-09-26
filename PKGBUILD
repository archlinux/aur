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

pkgver=132.0a1.20240926.094943

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

sha256sums=('23a863d1c076724c384aeee81671465ad165abee074b4741eeea948cd9569683'
            '66c95f3ffd686edf2c13bfaef5d4a9613fdbb2c28f56257daf3c7aa7dc00a0b0'
            'bc3e4ba1e80e90400bba08ac1a8aeb78d68c0cd4423642db92bd90da377bf02c'
            '07bb381c6670497abc2ee5f4a4c55ba75d1b1121d8732b515d5e7c4ee3311aa1'
            '23ca276e39af764e41bc1569f8611c66bf1746f8b33a7b6afc11949c9c6905d7'
            '969435ea3278538e1f3617436c20f81b7618d940d82ae82c1a79e9f1b04456f7'
            '7f4da05c0aa612f08342878ec466c036fc464b01c68560086ef1514fd6514571'
            'f632cd532a39e28f95b71ecf5e69cbe6b7c9ea7071f641a946820cd71bdc33cc'
            '8ecdd0352093c29c457896ee27c42d9119baf9fc62e722bf85476e0825976fc9'
            'ed9fdc916c26abba30324ff5800a9ee431b3c1be989d9208c9e38e73eb62f319'
            '586bf1c4f274186f094c22c905d04c6ab61db747ec208c4ba0bca494ab6174bb'
            'd85530d4bc5522b86dbfea654432295fa376290024272172a1814ad62977a9aa'
            '6a085b5b83ca7616e92757d91dd47671d28c2ada4adeb8422493be04f27dedda'
            'e9ed03ac7a193d4abea9c9d75fbc3b3f09e0d4c018ce4f364352e97c16dd1161'
            'f71aa2e0caf78a8aba5f9efd2708509ac14fbeb6c6b5eb9ac514c4d9ea9bdd34'
            '5baa819f55431be926ea8d7f8b6550cf464560e92f5482b9852b44731bbe9b80'
            '0cb361d9232e1de3f15cb6f9576e91f228d141533cb697a43eba0b64f142362a'
            '3f17e11f301ea7cc52c3fb7350db2c43f74af8d713b0a78d6fd23b6203ce17be'
            'affcf369364b8220107077d134cbc148ad0889c04d15255a0e44a06d5371614c'
            '4a01a1f51558467f28d6fb2609e21d12d542f6de989b3eec321f078358966451'
            'c6a8d9644073be6906c5da6bfd647ec8c042dd0a36de481b2f0b2bc9ffda80fd'
            'dca30bccbb7afa2c082933b84f4a5d870324f19951d38b0d51d8387513b13181'
            '6e72faf64c5016773783bddf9df39a37ca17da1a15b3e6d86f05930b62eeee04'
            '21ab147d654465b9ec9cac13228098ae4bc2a2585cf364c9b4536f7848037111'
            'e38bb620e90351aa3f93a9fb9f839661407b10884587ac51781a2d84cf782f8c'
            '230e191e43d120cf77a72c54da815a2986d15b72c7b903709d240ffafbc2d8e4'
            '26fd8a3224fd5fded8728ab3664880b3a329e4395380a2b414ea71148298bf81'
            '8bad46b0dd93c0df664eadb271957f72141d892ce4603a5434a092a7a887c3b2'
            'd844b56cdc4b8e5d16358310b62085c978874d7687931cd48dd36e59d8ccd39e'
            '7978ad58f3241b0c8ccc0e46e2079f1477908be83ef63e6b30bce3f219ff2854'
            '0a491842ac09fa15546414a83444dad1b031175c650e40c14cdc6e7bb6c9add8'
            '9fffd87d9efbedee59dd7004a09761e235bcc123c04b3ee1d1be2d0333bfe569'
            '02b4fb0796bbae58a74f8c370b1beecc410be20b1c03b859ee4e794595f2df3a'
            '57c2c0529bb1c6116be2253f93036073b5c89a26e568a6bed8f08b09320cc612'
            '78234f9b799d6580e07ac194b47c878db7fbeee6a835cbe50338bfecd347267f'
            'b02725093c5cf7ecfa871db08593e96bee81ecaeae501d45570bdef00ceb1bd2'
            '6ba522dcfff99b1cb3093786486d8d7f2bdb31ad5da6818e350a84300ba78d2a'
            '5c0366940427dae247ce52b91db5fb1b947cbf63970faa66e1087fb0a9efa162'
            '6231de13d58ca55c7262b4df7fff7ff95bf6b6c2b8fcb8924f6c832d684a714c'
            '3cf598f69a3c3c1167d9d4068639fe404f8e471cb06416fc8c7337c8dde5178b'
            '58fc911e9d1a24b4a4d9b0e3aa82d2520fe2c46f7be3d65cbb564fb0e1028113'
            '4ee01d1e8181a1b3b51b4d4cbfccd7076d1929bb5129a9f809cb268132d66b57'
            '4467bc710b337fb9ca69159be7fb055f5b989b69fd871c8e57e7cd17a1cfe289'
            '8fa360fcdd7ce204231eb3e7354e485ee29b7487843a28da4ade6e361c56be9a'
            '2f270b567a267d6ded323b9869699672c3ea68bb9fd1681735cd4a38bbb2d4a2'
            '1c44bcf316942cff58d2127596cc4fa77e247d58f7b45e9e4a9ee9d6c73e75b4'
            'a1fcc5dc3a279f6de1ff8c0bdb9b44af9d97a6abecb5d50df815972a118b14ab'
            '0d172f194c45535d23385f19318ff04b86f9c311a3fd0fa17e258f456ca7d3f9'
            'f77a3323f53a692efe7216538defb4995c4b4934ed94a1df0569b06f1173c766'
            '872beeb9a2bb8ef7cff5aa48515f30f2d5447e30209254535675de01787e3360'
            '60f3806952162c30aa5c87f32c2dbeaf83755cfdf6ff6047ed58e992afa69c69'
            'cd89746325a773396ffdee85ba268674e9fdc27764eecb90a3142d870b5a294f'
            '75f0339a04668dc5ca562b93154cad546c58313eb73293157f41344b6e34957b'
            '5b47f4852907b268fba727a63ba1f6bde03b1f58bcafbf77c1b5585fe17472af'
            '971e89f2b1c26f301825bfeb7bacd3565448ee596414f9045e1eee00e1be1cb6'
            '62d62eaeab52b3cd1286a6973732c7f080a88269c70f7471b413534168e120af'
            '073a6e517c9ea3410218cdf8ab07ea5ed7e286586e7e50df67d0b6e0d5fa3b92'
            '1e41f57bdfaf16eb5a1631fa5778561b9b94e45686b2845505e0896972c6a3dc'
            '023dd63c00482a2f7dfcf63c272f85ed842c7499ec0987d3a33974b7641bf809'
            '4b637344d331a5f67c830852058069382e559c94abd2fbba9dfb9bad117ae4e4'
            'd17ceb7bf1849646cf977b9d921b350c572e4087f60568d9904700d38f51176d'
            '4186459fcc0427d3f1fb00847fac6d0bdd03fd9f450ff5f7bad0138a8e1c2567'
            '4357f6f5ba5d10f61763f413aa9f17f9d89a037302ccd951e0b6e1d6e98a8e1a'
            '92f2261dab3708bfb46cc3769024651693bdce23b9422179a9b176babb08e8d5'
            'd3da7a712bacbc3bbcd2239a0ebe2a9ed8882ae64fb1bca8fd6882930304f674'
            'bafcef24a73026946ec4397d47088ede53cdbba4a99a731bfc584dacc8cb578b'
            '62710e4e4e71bf7969aca85dd0cd09e92a3c09551fd44e4deaea61d5b20b65ca'
            'a40dfb462c58c3dadbe3205d3937a94ad692753d87b7d68b48e25f268d9aa3e5'
            '7b569fa6f3e0ec87ea044dccce712717c05728c7c063ca888963ffb9d92b38c9'
            '26c74e52b5c610557ccc679d3f308572cd75570f8f57d75c7f0a2eaaeebd5007'
            '6fd845945dad98e919205fb60fc55e543b6070b2d0dc7658952e9b8e91c104ed'
            '099bfd01b1657bec9528623e0cbc78a06b7414f68613e8f5ca8a6840cc163b73'
            '6b99b0469d57c352ef08493b3ac862f968c680b93284f235838aaf16d35cee48'
            'dd5ad12a43a8af1974b085a9f649489ce13dfef055dd72526e0e0bfb88038e19'
            'c7dd1c6c3720d073a60263369e9f3f219a18ed818c72fe9a4c45c90f050b60d1'
            '580b4dca7322956a086b1fa2c13d53daf85a258467268a5240b1ab8f0b8d5231'
            '246b055adb1ede26780ea51c1a1e6881e48ed03afde1769772d975d24db92a93'
            'c2a040f3edd60a3f0df3cb0d3cd328f91c2a204a886faf21a6bc6a66b0ba794e'
            '059aec802efcdd985aaba8fdb46696c9fe0d560d028c6495276c864ef2bf0e8f'
            '33c4327ca645975253ab54bc9618b45cca4b96cbd4cf7f66d3895a532603fa4f'
            '0671a2210158db0fe5e1c82a911594f039c6d1ae1494b0a614e1f62e3ff25e15'
            '30f82d5c3ac81ad0e0492635eb4df6f330f744d8c17267aa4bc99e8de50f4c58'
            '214975ae322144cd7a0eb6ecb577584e84bbdc1efdaf5afa5f3310102b696748'
            '4c931376f0a0c333b98ccf8220045a18ec92ee6471c7f4b3c411131266bd78c5'
            'b34b62708b79797e8709a7cbd8b8f6a6b84b4afa2e0b9d84c37a5e22bbc4dee7'
            '4b53d2704d3173561ba0bb9ddc28fbc886bb06e8375484c580896e2a040b0715'
            '8372dcdabc93157cbc90de16813c0915230cd6e67f75d1eefe1de21c6eda4c5f'
            '526c84ca36bf68834e58976cb9382da9a921f5170ead8e24a36ace0499b712bc'
            '202480f959a82a7ec4b882a3dc864f5bc63d81706ff0b592a3dd66a70d6f02d9'
            '8c6fa863d026ac2de88fa56f02092e9ce10a9e7b46251755b724a51c4701cf73'
            '8b0643a1d310116a75f05ba7395d55cb91e80a670986739b32fb611124edfc32'
            '13bc19a2e0d821ca8015fd6e06522721ffd195aeb2962549fcf5e15a65d85ff0'
            '1318ff69a84c8ff414d26d7d5699e20cc4721d3dd3d849f0643be579fb2c0cd0'
            'dbb0486c2153a0b7ada435ef696a00d612ea4263ba14357a273c9e5812f920c7'
            '98898024ac97dc746a25f78e744f429ed635316318e8cb20410bfa68c097f3d6')
