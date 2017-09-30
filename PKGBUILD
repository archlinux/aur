# Maintainer: nosada <ngsksdt@gmail.com>

# This package requires too large space (over 3GB).
# You should check having enough space on your storage.

pkgname=knp
pkgver=4.18
pkgrel=1
pkgdesc="Japanese Dependency and Case Structure Analyzer"
url="http://nlp.ist.i.kyoto-u.ac.jp/index.php?KNP"
arch=("x86_64" "i686")
license=("custom")
depends=("juman")
conflicts=("crfpp")
source=("http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('6bb2c72b847a050079ee290bd35a8f5dd825987ddeaa982629827161d5ca26df9a9765b9733d43f282f37b20f4451a6aa3ace9ec65a4d880215abebc9ef15042')

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
