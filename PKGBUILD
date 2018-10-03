# Maintainer: jtts
# From hunspell-sv-se:
# Contributor: Oscar Carlsson <oscar.carlsson (at) gmail.com>

pkgname=hunspell-sv
pkgver=20180717
_pkgver=2.41
__pkgver=2-41
pkgrel=1
pkgdesc="Swedish dictionaries for Hunspell"
arch=('any')
url="https://sfol.se/"
license=('LGPL3')
depends=('hunspell')
source=("https://extensions.libreoffice.org/extensions/swedish-spelling-dictionary-den-stora-svenska-ordlistan/$_pkgver/@@download/file/ooo_swedish_dict_$__pkgver.oxt")
sha256sums=('48c8d0d548232215384c47ba18ac03bbef3af4c11ffd5e1057272353ba60225f')

package() {
  cd $srcdir/dictionaries
  install -D -m644 sv_SE.dic $pkgdir/usr/share/hunspell/sv_SE.dic
  install -D -m644 sv_SE.aff $pkgdir/usr/share/hunspell/sv_SE.aff
  install -D -m644 sv_FI.dic $pkgdir/usr/share/hunspell/sv_FI.dic
  install -D -m644 sv_FI.aff $pkgdir/usr/share/hunspell/sv_FI.aff

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
  ln -sv /usr/share/hunspell/sv_SE.dic .
  ln -sv /usr/share/hunspell/sv_SE.aff .
  ln -sv /usr/share/hunspell/sv_FI.dic .
  ln -sv /usr/share/hunspell/sv_FI.aff .
  popd
}
