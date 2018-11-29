# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Wascar Adrien Jussak TuxnVape <adrien.jussak@wascardev.com> 

pkgbase=lightning-i18n
pkgver=6.2.3.1
_thundver=60.3.1
pkgrel=1
pkgdesc="Language Pack for lightning extension"
arch=('any')
url="http://www.mozilla.com/"
license=('MPL' 'GPL')

_languages=(
  'ar     "Arabic"'
  'ast    "Asturian"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'br     "Breton"'
  'ca     "Catalan"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'es-AR  "Spanish (Argentina)"'
  'es-ES  "Spanish (Spain)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'he     "Hebrew"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ko     "Korean"'
  'lt     "Lithuanian"'
  'nb-NO  "Norwegian (Bokmål)"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'tr     "Turkish"'
  'uk     "Ukrainian"'
  'vi     "Vietnamese"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=()
_url=https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/${_thundver}/linux-x86_64/

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=lightning-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=(thunderbird-${_thundver}-$_locale.tar.bz2::"$_url/$_locale/thunderbird-${_thundver}.tar.bz2")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=(${source[@]%%::*})

_package() {
  pkgdesc="$2 language pack for Lightning"
  depends=("thunderbird" "thunderbird-i18n-$1")
  install=lightning.install
  mkdir thunderbird-$_thundver-$1
  bsdtar xf thunderbird-$_thundver-$1.tar.bz2 -C thunderbird-$_thundver-$1  
  install -Dm644 "${srcdir}/thunderbird-$_thundver-$1/thunderbird/distribution/extensions/{e2fda1a4-762b-4020-b5ad-a41df1933103}.xpi" \
 "${pkgdir}/usr/lib/thunderbird/extensions/{e2fda1a4-762b-4020-b5ad-a41df1933103}.xpi"
}
            
sha256sums=('3851b7e64434bc423c82d1be0901fc363f87a953955730aeaceda1c507b8574f'
            'caf63d7bb9d5752fe4386d35770b4e37aa2d7420c07ca87c89e85efe55eba5e6'
            '80fe291c607d9a378b25f95a6bf4ca9e066d8d3350cafb960c907f8cc314360f'
            'b619d657608e7b1efde768fe073e2985c4c18838f9485919e4ca65893a76275c'
            '3b2af9848f12ec05da177e01c18eb52f456554c54de8f44a483c6a248d2f5672'
            '670e95b9eec44b62b435ab29907b52363eb39ff0ab350798ee12200f8cc0126b'
            'ed51d4a063fd33c91cddf5f55f9d37d83c31cb503a1c5527ac784a420b802cfd'
            '07654ac5dd933bf9fab587f9d7976c951ffd525cb5db8eb0fc1952d4f38534ec'
            '8595443b004f25f0cd8d4fa2721a3f0246325b2d047dee654a1a00942f2cf930'
            '47aaa9f8f0370fa409a5999a5e4d2c9c1ef3f1c72c0ecf54368b4e7425537afd'
            '5d24cf08d2c816a7955cea34128fdf28ee2f346ee9778cc5cd1def2ee741c7f1'
            '87647cca93d7e5d7bd7012e1ea398c6a67d5374a9eb57281e3ee0fdbdc951ddc'
            'eafd0bb3343d477049f6b386c3fa5d6547e7626ba4aac547b16fd2d8d5c5be46'
            '11c9471b775a7137da4a2a3bb9c9017766dd6a2a4c5472d26147ca2cf2cbf915'
            '4a38a07221c8c23aeae0e3588ffb5b87e00a6adccfa25928ef7fbb8f10118771'
            '9df2fad4c5983057595a7c5d2df3045147c76959b1ed7533dc2eb887948389af'
            '70efe6eeb79a3dc535834e3f33c6c5ee7ba10230b09d32a15f33ee2750d0a4c3'
            'c9efe9625654e37124bf6673158da754e690cbb08a986775534a240dcc6dc77d'
            '3f4b3a827b9eed5429d761d49553ad4eb2278ad661ae2bbe951bc14c97bfee1e'
            '291d32420d5c707d98a41958b172701436dba1206ddd7f9de0deb64edfb4d42c'
            '24f83d30799fdc607c3d1b05ca0bcd76a968275b19eb8d5a484a958f112d4b89'
            'd425b5200f3605243a6dabfeaadf6ed3978b8c0ed7ded63895a495174f7a41d3'
            '5e60f0c49207845aa4651fdc06a6147b11b04dbf9737095b461e233c500460c8'
            '00a04c816cf1f15c648a890c14a88770c589ae6d7d15c17c8e047d299d243529'
            'd34bf363ff35772d49b8dd3eb4ea4d0d00a32960c3a641d1267edbf44e404611'
            '159b331602df241cd9492df9df58af8d1ea9ea46ebbb4625711725e5b4dcd15f'
            '6ef8f4c0296ac82ba224b8d11bd85795149a3c74cf3bea51d786b97769527746'
            '4ee7579c963469bed8ab8398dcc16639769a11534c25765d02058c290b7aa4e3'
            '0dde48b33cc948aaee683c69c854b1e13d7f2b5a8c88c131f4f4864b36a9021a'
            'c17cdbfbd83ee1e2536feec75446dac765e61e6047efd3158871b3ca76d4d31a'
            'a166548b99d333b2ac682c68e9e6782ccd9ad6a5951dc560c732427e5f8450a5'
            '0a32ae6c62aaf51ea1215f717174f067b3f8799dad0e971908583b0cf4b69d66'
            '6c37b178b6f3db8e1915ce78562204676a2307a621282dfb91d2dc454c672a81'
            'aed40ae709b315c2bd4045539a98db2de12321c66779c28939855c31d6c99763'
            '2638fad35ff05da264f2add7516a6f83ba80fcdc8d3f4ddc8ce1d99f04ac99de'
            'ca86d3ba870731f2fd0dba88ba0d6a6a74d1b3fd48d7c5860d7ddbbd67a6c2ae'
            '1b75d184229ece53a933924fe1e23b4e72ddc522b1258fa8812b3f584093fbeb'
            '2770913cf7280686eb8e191da185c2b9e98323aa5777714ef3709e1460dd9e4a'
            '073f2f8827a96022fc4feace62713d3ea31e0efe6921e7805d1dda0eebd4ab92'
            'd3c7e2673012ee1b84a52d845b6ad430039dae3d742c92de560c6484d638ed44'
            '8ba739c50d1d639f8a8afa4a8065eb6957cb68445b868056badb5ef44ef78b11'
            'c875a3cc64b4a4982f87c7222537d021f0b51b61ef2d9815be0d84429dcb0916'
            'a6d74d9f6d6e370b981e24b31a167df2811672b68ce50abf3217140a46e07cc9'
            'd4211f4913c93341773edf54fb367f5d54c193342a290f72f921bcf76e604232'
            'a800f83eaa61fd7b2f3c0264bdaf8b14662503df85f14aedbfd7575feb2008cb'
            '752b2b777bd05e20dc505a0845c73e2631f7f0f979a3f5710171f8d3a873c4d9'
            'bde5b705b195abc3b105ff57b281b3293909e9ffa5cae004cc2341e0b390a7ff'
            'd283b7f2c1df2f13f51affb6c115fefcb0ac8dd90e9ca3e4bde5b669d4ef4638'
            '091ec3df4291a4161380c67f25578c3f1d13ee362361f9742eaa3e34456ce0d5'
            'd64bd1253cb442f574b4af81959851ad189f575cd012ed70ffa7415d1428dff6'
            'bae33e2d2da2d8adbc1718f37426ccec38ed989f7ff239c8eb166a664e96f34f'
            'bdfeea4e0ff1f8a53d60c3d48c1643757d838178bb48c6c1db2a0e4820434c4b'
            '022b7fad4cc65fca5f882b4298730714a193e9f19c366b471e033a8a0a91716a'
            'aa91334b4bffa0afc2d7c07258dec47320ddeb41c8ce7559e26f0dc310b5f30b'
            '7d18444a94b903842591be121658d2e7ffbf84c2ad607da03e17f64cb7650dab')

