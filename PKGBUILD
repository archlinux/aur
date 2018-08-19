# Maintainer: nosada <ngsksdt@gmail.com>

# This package requires too large space (over 3GB).
# You should check having enough space on your storage.

pkgname=knp
pkgver=4.19
pkgrel=1
pkgdesc="Japanese Dependency and Case Structure Analyzer"
url="http://nlp.ist.i.kyoto-u.ac.jp/index.php?KNP"
arch=("x86_64" "i686")
license=("custom")
depends=("juman")
conflicts=("crfpp")
source=("http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('5518d37437b699e00de2e98545d5b6a77f6ed7e5ee8f8cf756015cd577acc3bba7e6990addf247b7115464909d87b8cc60428dea3c6b18a4eb4ad05a78caf53f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
