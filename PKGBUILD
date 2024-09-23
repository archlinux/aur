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

pkgver=132.0a1.20240922.213737

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

sha256sums=('d9591cb104c7c9fa1b0d1dbb2b3e8ed63439798118a3e77e04765ed102891765'
            'da68a00f205deaf519780bc27856c9a1e3a1d6b3e5949b24e5547af72e3c3df0'
            'e26f938e3bee390c52ec8466e14d0ac34787013805808dbe4c7c2bfe39fa9ef7'
            '8f40c61d1bb8569eb34a327231d6ed061d117a0789ae43f3de249f08ea404761'
            'cb5251808cdbf085a85b6e7b1699bf72102f5c378e9d1d125b10e520db3aa10e'
            '0c244c4a5458c9477e7c800ddc9f968a757f253479a8b2f1a13e457f0919517a'
            'd23246657307796d6c87d4b2c27d1cf5130c6a4a7557ee680c6bea32e6d2de50'
            '16ab66e6a35242bdcbef4f7d5c2b6668e125cb73b06f80f07f267d4ba0728711'
            'bc25b4a05adf0bd6f3287162495539fa6779af6bf4647b15c2719324a78050b7'
            'a665e1b472847a482fd85838cc49443caeaa13bb5105f54a48eaa8b77390ed12'
            '4b061fdca152d6435d15b37578098afb87231215341d9e4ed39c6ffa27c4fce6'
            '1db99efb540b05dcf62cbdd4055bfa66b0352c0a85c11ca65d0fa71f64d93060'
            '69d3b4993dac335c81d9101c3b15f1b3faf6d2b77e8e726f97e7f394c31b6016'
            'd7c7bb462adfaf53987c751a879a0d1e0d13d7863e79d898f83f42d29214c650'
            'd1a7c44597aa862313c9d7e7c5de971b89c465fb6c9c9558ce4d556a4999cd82'
            '367ac3246d1b38b2d31f553e43a40f6ca31ba02fa532631dceffdc1741d34dd0'
            'd2fbfdae73ce6d06f612c84acaaadf1e836d82e67bc0eae252884e7be3106e7b'
            '19c7b8b2dd96bf0e3d6e8385a16dd74bb7e7856d073d683c52f7ca51c0e5ed62'
            '001bbd8ae65c45bb5b449df1b9fd03f5ac2a63763d7b0e0fb32dda662b0aa146'
            '493b24063c212c6fe0887691610698022a4d93fd1a6843e65d0b15ab1556509d'
            '53508381c98e338ff2aec72d18a2255574e936874a693791fc665469ac620e96'
            'de90e676a8f17f91d4107e9c5d3c9b7b918c95fb1646926110e269cd7218a1df'
            '425f03c80108c92035ed34ca4bbe3ea77396425eef179723c347c5130a67c601'
            '427fe20c49247e532d637fc40f722274e8e4680f5d04a9a94905b62bbc45094a'
            '005a9a582f8901d47b5ea9e0683a5d5aaf0220d71b80e81a6c58abcfe392281f'
            '58d7f7b3e7571d8ac137018531bd4d3dfcf3e72c83bc39ac1781fbd0664e575d'
            'b9a3be2e6e91343b0f8391075835f6063444f58cfcf5d216d554bb1d82dd7700'
            'f03fbfa768dc347118cb15d1b41e0bdced71d6eb8d746736c17bc060d7490df9'
            'c3edd8364ec14753f757a54d27d199b4e36fad669bf0ff0d6ec25d344b0dae2e'
            '49bfcee4b592fb055e2ce242e5621cfd58b0935ad5d57f08329fdd3564e9af00'
            'c0f84b0429961702b9198dbf6fb74034a5a7655d3d231a8ca33bca6eb808e652'
            '94a2e58956e5a9220bec4890a034ed811dee7e15663a8d606b2896520ce36310'
            'b5aa709e510fb9f3d361f23a55ec7fd6232d571f58a0c20752255bc019cbafee'
            '94c4c20f121f2a0270bfbbe10141d888a504a67446223fb64f5ed1ffeb7940fd'
            'ed0b2084f6eb4a4776b49391d50f3343043dbb0bb25eeb77d163c237d60c0b4b'
            'fadb77155e9a10437468cb9f24cd4c4d078b4bb05f136e4db1d6a9512c95b43e'
            '66d5a97997491a411ee9df4ac37f51829d1b49a4579c4b9b199c3a7e21083220'
            '83243dcba9cad7a29e379b4ce9dd81b4f26272302aaa0477ed748aac71ec8002'
            'fe28724e1994dbce0fde2515f5b781056f1b365ebd7e8dda940648b2fc695f76'
            '697064b1e0f17bbb28510d89ac67e447530fb0ada1aedb589b1e4499cbc5467b'
            'ff933593fbb0a33d58a58ba1021a075250396edabb6b477f34fea32e3ce2cd54'
            '6fecbe0f46cd90f2d0c6406812aa2bc021c39a19651244aaf8c813215f1c1b9a'
            '1611a38bef5d91b429ace0f3a565612c46d72597db803c310314a888211a7c45'
            '9cf3590c188a1f2e513c679f026580779357cca2a8d1eefed32736f9b24b0ebf'
            'd6b573bca1a18a55b09d0a37f8069770b091641e0dffe9dbdf8fa4d5b273bd61'
            'c0f678963944ee18d8575deb56dfe4f88486c69d374d19940e2f58f4181b7b3c'
            '2f32012c26c7894cda2ddff3fec74bc06df7bded378567c96b81285fb74e3be3'
            'af3432a7336a1a0cba7a8be5ef0f58850450bfadd4c3e26782ce54d170467047'
            '982a38ccead124deb2ef2cab3a2da47006e150bdadbcf68f23d501906312eb04'
            '2e373dae9b719e3aa7bcc241182ac269279537ee80a0dd17a4fa7abf7d3f1b51'
            '5fca4d8e6c9f4a9c8ea0ae8734ca54e8f551e73d9b4370b659e4eec418b89e3d'
            'a60f78e986f50015e5f3f420c3e874b3c9b29c07fe6798d02352eef16068f9ca'
            '189e405157040217adebe65a06f2a7f7fd0d49d1e9a45ad662da6348bee44dbc'
            '50c274180f536081883a2e82c633b0c35efb9d8921e05e393f59d359c1aef849'
            '0ba874bf96857377e7b181ad16fed94400fb7ec66cd79410b3cedc7525b273e4'
            '39c512db3f49c6fbea810b67e8b2ea8e33c73eba296d8f4bc5136e4f98ecc5a2'
            'f4897826d1d39f8ea2cd4d32b0bf3667f178ca0975dc147251a18d5c57d9b297'
            '791fc9272554cdfadc4fc8a3b60beefa7f6f629494a7a8cfa61510933e26a015'
            '77dd4d3e269acf21bc72d6915e990cc301dd79fca0a802aac3b36f58e38b3031'
            'fe80468ce30d72ced90791dc94db98b219a8ee050b72d9c1f982f3f0d1b62236'
            '23eb5c764ab2048a5d7f607faaeb3b04358a8e906b1c252e68c2481f850299ff'
            '41efc53013ca86d26f6873168e706a9b2d7448743fc1617c43d7c1c11611a6e4'
            '1d40124a155711aa6e95b3ec7f18d02ee1f60ad61a62dcd39cce0ed8bac0ddee'
            '6b93b111e187e84f7d8ea24d46995cfc5542354c04cdde7130002ff848d4e8f4'
            '561f781cbfe3c3dc36cc8bacf1b96ff15f0bcd83588233b728ce10f0dc2fdaf1'
            '7e17565d8721afe9998baea67e717b3d13f3d39baebea1b2d4b86ecd6148c321'
            'c983623adcd7312073d1b51819a221404ce37801e0ecc9a9a56c5e5789fe31b6'
            '6046671b20a42cbb35d3fc6e34fbaccf81119e89cf306316ba2244173a21d2e6'
            '8b677701a880034fdf290adb0397cb2f5169a4dca197ee21da178b7b18dac815'
            'fa30019b0bdc094198f88541dbe4463ab99b4be3fd15fbf9e3569166cbb9e280'
            '84bcb850af7ea02862d6455f6f0c6ed74d94a92e5891c474f41be1f94ebced88'
            'a8b0a1ec4e9b45023bb94741bd42f981f81fe0df1e58340fef8606db0aedfc19'
            '8b3ad6cd4e4af38990d4b2dab8b142a9384cebfc90fb92f2b1e0f8eed7d723fc'
            '1b00094f2865d92847a537efc4b5bf9d95487c1ad74bff4b780a15d9d68e94ba'
            '2909f0f9fc18634c73c18e17d59c0f752ecf1cf928c6729c7c49f6ee91069d91'
            '6a4a927f0e638fb83a23d44985f97a2b509d6136ec6cca79c32aa5494b3e8037'
            '2b7c3c5a57de35368c0c8e98f15c6ee1c8185fae68869ccdf7f00bc75808d3c5'
            'e60636af372c29d19a8378c92e442dd1909caf2d28b255f4db060cfbcd9a9a8b'
            'bfc996c8a907b5226268e9e527411611fda26ec187a842b1ff424992e7bcd45a'
            'a2616156127779d250af82dc20faf6a45fd54fd804a7e896eb2b05426554e78c'
            '8eb369059b3b4d50f9c5ef448aeda72da82a81790406e6bcdad720a4a87937d9'
            '0dc2aece4829d4b2fe2abe1da5c21f1e18cb4a939ed42348d704fc71be5eb887'
            '0159478e5ac05cbe0c616125869df70d71ebe8b74715c61a4e284c52be09ce6f'
            'e534484958eb10e301a73b53efa8666569a8347f599793db8a77adadbaacb51c'
            'd09b087a4289463b5919602f4c17173686871f6aa884b2ae35dc7b69bab672f7'
            '71cf33a39f824ba334402f34ab5ec7313b3897e903f483146d36ae4aa1be7d69'
            '4d0ada5ffb38ee3aa74f2dfc96bf27c8a804474600631677c5f61927ed51b24a'
            '7fec1538115a615c18f53e613892a99c6c5b0b2b1180cf0cbffcde503a491a35'
            '9b9c4ab944f3e006ac3c54773932372b59bb1513ca921408681f213fd0f0c654'
            'b8cf1573d21676f1c256f573f89b22d0d4a8359e5d8c7e196f87d03a043b581e'
            '535221ad9a59bd9d0bb0fd9e937a74acbf9a23fde065eb8104345bb961eb66d7'
            'e453a72973d1554e41a786e696ccb6367935cfa668a706d5b2efc6c97bd5e16d'
            '6eaae5ea3e72172cbcaa027e12ef3610e3330cbec3bc8d4f6d2a2fa8e9bb6711'
            '1f30c5725f1c4624736dc7a7b52d26d267f8e05de37ad0eea3abb2a75a6a1c0a'
            '3fd33ffa979db95aada5d5e533c6e944051ef4da68e1ef57a4e6d3e8a47fc875')
