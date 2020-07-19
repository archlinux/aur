# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Forked from extra/thunderbird-i18n
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=thunderbird-beta-i18n
pkgver=79.0b1
pkgrel=1
pkgdesc='Language pack for Thunderbird Beta'
url='https://www.mozilla.com/thunderbird'
arch=('any')
license=('MPL' 'GPL')
depends=("thunderbird-beta>=$pkgver")

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
_url=https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=thunderbird-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("thunderbird-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=(${source[@]%%::*})


_package() {
  pkgdesc="$2 language pack for Thunderbird Beta"
  depends=("thunderbird-beta>=$pkgver")
  install -Dm644 thunderbird-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/thunderbird/extensions/langpack-$1@thunderbird.mozilla.org.xpi"
}

sha256sums=('364bbc916c6f9064c9141bc8f6e5af3e0dd472053da81e21cd5a9267362e3ddf'
            'f1ea7b116278a8bdcf635ec5ebd53259e44e6de8c2e66e171e599a762c7476af'
            'c6b8947b7253e0303d5801911ed8813a7b1d8fdca0190f84dafba80a4e27629f'
            '15b81d4da14d2e54cccac5a50afbb7b62b0926c987ae9661a5683d43ce6a7375'
            '5b60450b6b72a0c74e998372c3e46c4850481663e735f61df53dd7b24ec063fb'
            'b5668fdcba9e003d2cc70adc3828336090546140c6c8333e31ae6a74097c7de7'
            '9d32632ed1a0dc126c56d0a2559b7013bf513174c7499167da1eb2dbe39d986e'
            'be44483b737a3bea651c16b575f1baea35cd0db4f5e6caac7a852a06e28ee5db'
            '8fbe94bce21857d79732abb3fe7283daeb2ab135dd544969308c67d5ca8b10da'
            '501381add2c07d26aad7e3178c66d44e0287899930f41ba65ca5530848ed0d53'
            '728c81fc320d1dfd6e5ef8b04a271c7d95688be976403da07747032f7ef140ca'
            'a9e50c7b868ebd56d6932d4c35c5b283352750c7a02f4a9baabb109659861d7a'
            'e6640cd220971c0bd829688f61afa5f02a321e9dc129fab98c171fbd715d3d37'
            '68afc88642d00aa8923b6857f81461a0da7213258fd9f1df5ece0b0364723510'
            '70732d37ec009bb8bf23e1eded6075c8316c574d3b16cd48f645434f06f68af6'
            '8ec65bcc80e5e0ca809b4654623bb6a67b678a66aea02819c2d4bc1195e5157d'
            '066f4dd4a96dc5685e33b43550a8f5c4b0a3e68e14a748cc23c39e134aa64595'
            'b6446c2555a2130a54041fe73e34a1e50ac5bc8ce79947d980f8e5f79b513c95'
            'e88501f552884c48e3fe61f90fcf56542eadaf694a34ee72bf6f9c6783cf3d2d'
            'e8f9946aa718112f6229548610df7f68f2e1a0fa0b1e71867c309c3ea6855dd7'
            '6bdb851b2ec08c8104f0ac9be5aa1968d19753394324aad4882651c6dd6b0488'
            'd0ad2541942ff631abb4b05ed84297154382ca4ccc1d50effb54a6b69249f585'
            '00ad9c15dd381d9f82f55b5203029302678d08b80681f558218001e5bb578fbe'
            'a29e489adab87175c1366eee0de2760759678de364363d3940c6d99527c590c6'
            '35f81f63c83824138acc6f494baeef89cea245cd0fa2433b824494a3e72f9a18'
            '33df5045e109fb65546adfd4bb1f281ad807d6a7d7ffe40ac95c13e6908f69d5'
            '927951c53fe344e14f0585ea28d94662ae2190ca6b322592008d6e6af1900d61'
            'a28e29a30efe1bbf586bb7b846a396437b28cded0b109c38ecda7377f20ec230'
            '80db2a7105efd6430af3c3ff603370784d829fb9959f388977e089b6a121d485'
            'df9dd2e7d529b6f03eda962bfdbb0aae4f0b4ddcd23bb2d93e700c42bf8027d7'
            'd4f7d04e2624c568ebbae8f986340678534271351bbeeb422b32aae71f2469ad'
            'ead6c366c70be967bb2f554ef0cbc50701f5ddc174294d54c54fe2aff93fdc40'
            'f32098287b7f62c97fb67264ed81df47c76319a0442bbfe8944f4dbeb9b4574b'
            '15b19d8627abefc29642a1f667a45514a3b804e244eebcc20bd4004dbff276cb'
            'f9f0c03da5c23de49eb098e82dd6c1412193a5ee9999111cf0d624c28cbc8fae'
            'bf7633c8c8a6ef8cc302a3d6a4c720c58cf233604c788fac9f6b816576e64a1b'
            '94af078b1f44dbfd4237d362d7f9868e1df3bdabbd214435600a51800cf89b77'
            '0a25c893466a37303df4a35978994127383ed91979239ecaefc243bb407d1e27'
            '32bc7768d799b885dc7fa993ef165863355e1f43a52f706f2256d74dc966a9f1'
            '800ca6592504baa0095fb329783a54265d5c998a1fffd1424cc8ca614bd4bac7'
            'a7de8c04472d7a75fa17f70dff6bb3a2eb1c998282adcb88a2c8739a8790e503'
            'aeab7ca879087771d83aca8f122fcfdb105eb508668f7061ddc3853f78427826'
            '433e4bd09934334cfaeba830d422ca5bb02c28302d5d256879c7be8c973fdc42'
            '91f018dce21b4b41b3b94f4e6bf762db8aeb0c8dbc02437fe84f1f370360e111'
            'a41eda56dbbbb44a6afc7505907d8ccae51b7fcee37bcb7628a9ef7d530237da'
            'dcb5dda1451da203a83306df28ef6ffe58cf9578f30aa3c932164abc99c55e8f'
            '1a2a3ffdc6ff16221f5a47660664313620b04bcdc7d24bcd16c599c83022d919'
            'dab12267088ab4fa80a770eebc7f3eea7591458e2e3826d2183c0b1b1fa74105'
            'd7ab31d3c253e00d42d79d0790d181a7568f148743ab972af521610c21ceed13'
            '34d59c0cdf86b81f8cdcccf59eab0f3e92876672284f4a66fca220540128e3aa'
            '04f0f4f699da25594208980154ea0892a91755c6c6346edc6e1c2c43c61725ae'
            'd7e3df8f8df0a1115b32db827375e7541ad1b27127dc6ac90a7aadb600c559e1'
            '46b08fdd5b6191e75006f3ca6a477f62c123466c8f003c879e4d09fd74cf7934'
            'e3df91d27f58822417139c005747a73d84cd4f26dadf6b48b96231184db5904e'
            'ab0335dc5b612c14a5c3cdb10aac727e7e8333e6112b01c00446393a942e5646')

# vim: ts=2 sw=2 et:
