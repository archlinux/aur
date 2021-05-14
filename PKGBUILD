# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=juman++
_pkgname=jumanpp
pkgver=1.02
pkgrel=1
pkgdesc="Morphological Analyzer for Japanese"
url="https://nlp.ist.i.kyoto-u.ac.jp/index.php?JUMAN++"
arch=('i686' 'x86_64')
license=('custom')
source=(https://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=https://lotus.kuee.kyoto-u.ac.jp/nl-resource/${_pkgname}/${_pkgname}-${pkgver}.tar.xz)
depends=('gperftools' 'boost' 'libunwind')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
sha1sums=('020804115cbeb51cddbb9aef101c9669a7080515')
