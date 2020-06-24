# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Forked from extra/thunderbird-i18n
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=thunderbird-beta-i18n
pkgver=78.0b3
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

md5sums=('146a5e1229c64f55e8168f913c314d87'
         '880c0cd04b4892c7b2079ac7258f3a97'
         '35a04e1ca9d845846e81dd2e64c2bac1'
         '0a40c5756a239b401b9d8ff7c5bf7b10'
         '6e4634b6bec643b16f237546bdbd84bf'
         '9c5f750e03ce069b49e516c32f2af5ce'
         '0433bc3fe12c90e5c420f3d3f7a5e0e1'
         '5a7f521e284808af4f42b74f1ab10bce'
         'a577bea1db15e3fe64ad688e91d16ef3'
         '87666b7ad0193576b1c217681f4f0ebb'
         '6a6c1af3383a04df385704c58d1de52d'
         '96ff61fbc7b3a24a00f4701ae3355e37'
         '060d01c87bccbbea3004bf02b81c868a'
         'd0c23a23a1df6523bb9bbf07d4205d60'
         '6414fd5ed525ede38866ff25b4aa2782'
         'a334b455609680fc87e73491e91a1232'
         '39bd2069bfeb479e470610093f5539ef'
         '2304dc6056a6b0b209c12eba01412b66'
         '00c9dd2fd9d3b05ce1c8a7538e611f2d'
         '766f1f168204821c35c47c5bc4f4f369'
         '31668e2e85cec7bc69de8c61b161169a'
         '83616808a760dfe1a5b99dc3291ba029'
         'bbc78969a84bb0a49c2e2142a1eb51d4'
         'a1e6a40ba1d0cabeaad36bdb725da074'
         'd96222d7bc383a40170488f323d4deb9'
         'bbea858b4d317e7cf7b28f74f10705ca'
         'df4376c6fa68a5cf8c008cbb2d8f74c5'
         '295bd8b25985b365e85bc093f710ea87'
         'c289b88a6a01520c995fa0c4c84751b8'
         '2ee7be3c9fcb3b21384cba16443cd8cd'
         '217e8d771c9e8c231a47b05c04a191a7'
         'e1b8b045ca3040093e382797a65af0ba'
         '0d6800f3d3234fc2cc35412231d956bc'
         '636093643a4d6df9e36e7cd45538d94c'
         '7e81cf94677ced55f1cdee506af2f4dc'
         'cb692cfe86d0ad85d78950b5597e9441'
         '9f7734c25db06e5586ff49da26b914cf'
         '6385b71867c75e0f3bdccbdc0a5b43d9'
         '6d7d74674c52fb556e0533660380fbb2'
         'e06f0b6e16b6253ab5baa6f3b9b855b0'
         '4f86439568a2e05e1c09c3d7a1a7c4e1'
         '7be112ea910c12bf17f5bd182aa1113b'
         '5c6491dc2741cde10ea0f86338620901'
         '80bbb2e46edf9a276fd0365bb2d49d76'
         '16e202a12f6520c2a21df13901ee4872'
         '5058ae7162882e13e146c21a3f7222d2'
         'a762817f4b8a20f468c2a4788892b318'
         '6fc95fcf9eb32ec25529396b9add2c3b'
         'd1ab954ae6124afb1e723e48d587e747'
         'e12f98db6b50fd55f152cd07cd87f439'
         '934dbed7f22c06a5c00497821b410a7c'
         '2a1310425dd2a5bb24321cb5fcff2fe5'
         '86743b67eb59d7de9f6d78f0bbbd1bde'
         '711823cc606bc473a03d36fcfab28f44'
         '14b3802ecbfc503bc7084dcf4aafc47e')

# vim: ts=2 sw=2 et:
