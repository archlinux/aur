# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Forked from extra/thunderbird-i18n
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=thunderbird-beta-i18n
pkgver=77.0b1
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

md5sums=('7729e5caaab9a5e7a911635b2a2d8891'
         'ddd10d426fca78341d02224207304cda'
         '9962d3606005153f22ac9287ede63de2'
         '3c5290822a567ebb430ad4b7bca49427'
         '88593810c172a407e9fdbed1ba1bb8be'
         '4acbcf7efeb2d4aec7cc13ea77972263'
         'ccb9bf890aabedb458e291904ab1566d'
         '57335f64cf33da1de96b55b96cdd2144'
         'b49d3ec11b56563c72aed11495cd25f0'
         '172dfa4465822967465d0aa8c244b928'
         'b12756e0a5b644d1ecbfcbfa7fd18adf'
         'e1c43d3f1e1bdf5b19883db383b6aad1'
         '0f8861741a20920ef85a27487fd34831'
         'df72c7ef6678dbdbb318f81886a58dc0'
         '9472dce0a290aab4cb14a680ac1a4d33'
         '428a9b88dcd78f928568d456a7170ec8'
         'ed44dc7b14026e77e1aa7d7a541c4516'
         'b607c49a01669a67131e1cf3a4df5958'
         '7de5ee55bf4d7a43fca98056331d566d'
         '5063585db3e52e481dbd9e4b85ee6f69'
         'c084c498fb35e0df0c7c240437140aec'
         '12c2d8e916ce443f4476805cb21f5fa5'
         '59e07a3c198dde396bcb29a8164465c6'
         '16f72b46e4f3755e3d852febceb90bad'
         'e2a2cc5257094c67af8ba5fd8bc3f95d'
         'e5e131c29c7336533dc3ea3e74e9ef95'
         '62e7c9b242abc8bc9e275162c15129b8'
         'f74c071c4eacf3afc5ceafda7dad6203'
         '530beb1a4602c648f21df729502b0738'
         '6de4e32b00a3f2d3215f22123b90dc09'
         'aeee8c40661852f8789202f349a127af'
         '6d667b4855f9da232990702ed1e91677'
         '01673b5f685313807aeed3aeda13e909'
         'a05f1150944db862f1137f06862be01e'
         '46cff2415b2577cdef11253c23df806c'
         'e9f9e09e4e8685675167965cf13e6509'
         '54ae55ec01d3e8cd467a8077ed2806db'
         'f6331d607c1de544a5ca2b5565da5491'
         'fd0b0c5e2bba17adb0bb70db2f4d1cee'
         '3add8ea405cf66cc91dc925de189b8f2'
         'a04f2605d0107a3e557214315c7e202d'
         'fdcd184d6d642e13eef69174c11d18a2'
         'f8c7c2552209cdad4f3a13eef7b25255'
         '6a21bce197279ef4aeaa66eec2640658'
         '29b6b05fbacc7435d34a6191aff996c0'
         '76c39e081dfdadf05c628045011cee44'
         'b11a66fc021a08a97a1b3d08dafd0af1'
         'e0c5dff65b3eaf95ffe2d36cabdbc17c'
         '2f899c8fc97f2551fb955dfd3ae5bcb9'
         '614c734310997d16f10dec5bb70d368b'
         '26a37e2b42291c171b8ddcca26cedc34'
         'e36b1005d1427ea49c6c6b5d7a6d32f5'
         'f52b39499fd6f896afad8de8b5881e1e'
         'b315105070df552f8e3cecea2cf09cd0'
         '9731de0fef2732f35f6bddda8c7390d4')

# vim: ts=2 sw=2 et:
