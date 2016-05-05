# Maintainer: jtts
# From hunspell-sv-se:
# Contributor: Oscar Carlsson <oscar.carlsson (at) gmail.com>

pkgname=hunspell-sv
pkgver=20151223
_pkgver=2.39
__pkgver=2-39
pkgrel=2
pkgdesc="Swedish dictionaries for Hunspell"
arch=('any')
url="http://www.dsso.se/"
license=('LGPL3')
depends=('hunspell')
source=("http://extensions.libreoffice.org/extension-center/swedish-spelling-dictionary-den-stora-svenska-ordlistan/releases/$_pkgver/ooo_swedish_dict_$__pkgver.oxt")
sha256sums=('c58b7797de1cca1c7f8333a009a2ab391ef0bd89e4b815671148f4b137fe5aab')

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
