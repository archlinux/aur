# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Forked from extra/thunderbird-i18n
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=thunderbird-beta-i18n
pkgver=78.0b4
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

sha256sums=('82843e7973ddb2c2967a72d7475b6f5cec6444bea8a43acc97f2211d55301583'
            '4e7120c3567078964bae56e5d2f3282f1569f58ef3fd6a8de905e422b8d747d0'
            '9a9b8f2c43155007c41d2fcea474f68b222bc23c1a64320b2f7980262b788d48'
            '487c4b2379ba0236b5a5eee03f77fcca14cb0238bd00300783560f9f08a1eed0'
            '06ac6dd3f1ff88b42672cadb88852d42efc05acfe17b4ab008a9bd0ff1d0d85d'
            '86d1bd60ac2acc202e4c502cab50f6e60c31d93915f6744c95df849be9887e0c'
            '8c817e8368905bf83a35ce35832fb76bf869a58a2de95e2584876508ef0d3a50'
            '2b4a018ca5a6de0d956aef7105646ee0a7461a6cf7288d7ae49ec7261341ca20'
            '2cdb58d28c926e7ff994d240eb945aaeae5466aeaded810cca3a18aa0529a8f1'
            '47cce3a3a5f8a528ed83d47b8276b7cf5fca31195c53f319c3489be10d5dee2d'
            '14784abd72e52917a47aa3dd9bf8cf61f10c6b99da8a9bbc88c86e3a9c2792d0'
            'e854fc005c8eefce0f35c1a98f3f4ace6bbae61cc20a2c7101fab4c69e7c1718'
            '6eb0c77bcad69e58c191c8facffdf837f64c86be6eec4a2c07e09cb5f93f3e28'
            'a7060b8984a9a62df478e2135015c5f5aeb6ea6efa09c182faa87258dbfa2145'
            '3cdadc0001eaa7610891c190630c6af5c5f28e8086441959f51fb0f6e5606a9d'
            '7eb61d41385964abfaeca54068524a2135bda393c350770d20c71fdf4d01664f'
            '6460f09ca4e1959f75e76bbc4bd6599c237c4fc76df13e74894dcd05c48cdd60'
            '0699b8fc2f22b8fc186f59e053558f0f8587895341ae8e71f8d14a1a595b0f07'
            'b5ee30b785639efaadc9a6637ac879068b8d9fe78af0beb81e5ddf850b1ce83f'
            '11ee36453614212f046e73d59a22d597aeeb8e0e8ea5efe20e080b49960a0202'
            '2f0c137856f96fb9a97312fff1381313cceccf781c754a238e4cac494ad9ded8'
            '8eb58f5334d0f12ca3354feb9ab92901c586ad6e34946851f9cd428b94b2a62c'
            '50c8db6233617128537b73e68512581fc31b7141cb78f57ef82022c4ef69cfb6'
            'b09c24004403ae3b94e3fcf73f1b39b9a5ed8db1be655f6437dcd38c50d21015'
            'd41bd286c2f67dbbd64a2cf1790d2d4e05f9494bd4470ca77c89c9352d07d64a'
            'b9aff4ddd2051ebd01d2f4c101143c490343a90ff25970fdf3c3c13a4ec50ec4'
            '797e6661e1b9954013c216c914f5bff05f4f79de6740a8ac69926eed83d94000'
            'e38cc062ba21cfb6ebc74ced68b3767eb94924c8aceafcba8c49963a6353391b'
            'ef17499c0064ea4f629f7701cc2fad887bb62f5e4319c0ec742247709b58733c'
            '68492df1dc772f5a414e2c5cd491e3ae26a3f7fbbd20f470aa1a002aef3a7292'
            '18418eb374d83709a33b18aebfab413872b2376be4d0277183864b3385029189'
            '87140b8315a2851e88d86853276707bc0d0e3cdaa642af6b8186066a56622523'
            '825352725d5163fe29cc292f94b25637c3ff37d33742d50b50268f751cb9ecb9'
            '523aa58535fb10ef45e20d1e1b4645b6c29f54c56c63e23ec10092525fa9de93'
            '2db12a3c6b14459aed74a30ff080639bb46cc265e77301602eebb38ec85e1161'
            '9a124d1de0189a6fa20d6a96feff693ac408993c1bb251fc5c178e4ab5ed4723'
            '1d8b9adb01ed6fa0bf4d5ee7df712c31dab55d99dec0f5844e99fc868aca48ca'
            '5a70bcd266b6e573c61021e28dc1636b727189a8cc1d88e370d4a81b8f95d242'
            'f098a63bcba7e290110f664190c4640856dbaa851c641cb46daadfacbdcb0b00'
            'a80c1aefb54639359efed34d4a976c348e0bb0a14e4e544c6f2077cc487222af'
            'c4949c88069501bf558482030011e5ababa54d4e1a3dfb81042d356b87f638e2'
            'f7b147f9b6103904615fef6986373244a390054f391b6dffde1159488da68827'
            '4f2c9b0694230ec0f5010d869d015b7d04d3cd7e52137c3de92ec3c49e03a2ce'
            'd6c3ffc0993ed535fc6e4304d15c9852246b6588e29a61e0626a209aa1da70f5'
            'cf0adafca12666aa07e9aca69718d427d1b29158cbc7e86e08f12b6fa279170a'
            '77044c2352d106c8528b2fec0d0092fed6fbf42dd63d805331b355f9cfa32221'
            '47b7c444efee6f37aec651f1a7c14cc90544740cc1fcd90357ea99bdd78f6249'
            'af1dd7fa1006739738766b4a3e6df1e26ab23e7421ec3119744cfc8d3fe14710'
            'ee86782e7cd3c5a884492fafebd7a78457ac24e8f7a2b942c1f85ec7077178c6'
            '8c51f91c2021eee4f650a741b592082311e77e61929a5cd972f32d36cfc295f7'
            'e6d90ef57bd30643e9d12d227883c32b11f1d8cae58375db9d01ad026ec5e9de'
            'af45108e3d121d62f784b4a9541def943d36f3c964add8bd22fe6318fe9e9266'
            '6d907f5e7a0adf022bde27590c2207000d85a45c7d9a000009ad9f2fb42a413c'
            '1e31f791397b583929047257e95cae9232f0e5d08b80521fd4d7332a748af7b6'
            '99f7026216361df15e7c4000665a34b404acbb8038d51d194dfc60c823fd50fb')

# vim: ts=2 sw=2 et:
