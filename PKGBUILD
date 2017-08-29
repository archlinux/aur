# Maintainer: nosada <ngsksdt@gmail.com>

# This package requires too large space (over 3GB).
# You should check having enough space on your storage.

pkgname=knp
pkgver=4.17
pkgrel=1
pkgdesc="Japanese Dependency and Case Structure Analyzer"
url="http://nlp.ist.i.kyoto-u.ac.jp/index.php?KNP"
arch=("x86_64" "i686")
license=("custom")
depends=("juman")
conflicts=("crfpp")
source=("http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('7437781d2046431222fdb962e90cb98a6189d8efc09df77e7a0ea1a0d62f19cad38167fd77da75c7e5a014e6266ed9ecaa5b91be92ac8bfae7cbc4d92b1e0a2f')

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
