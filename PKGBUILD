# Maintainer: jtts
# From hunspell-sv-se:
# Contributor: Oscar Carlsson <oscar.carlsson (at) gmail.com>

pkgname=hunspell-sv
pkgver=20160510
_pkgver=2.40
__pkgver=2-40
pkgrel=1
pkgdesc="Swedish dictionaries for Hunspell"
arch=('any')
url="http://www.dsso.se/"
license=('LGPL3')
depends=('hunspell')
source=("http://extensions.libreoffice.org/extension-center/swedish-spelling-dictionary-den-stora-svenska-ordlistan/releases/$_pkgver/ooo_swedish_dict_$__pkgver.oxt")
sha256sums=('b982881cc75f5c4af1199535bd4735ee476bdc48edf63e3f05fb4f715654a7bc')

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
