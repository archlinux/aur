# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

_pkgname=arrow-apache-arrow
pkgname=arrow-glib
pkgver=3.0.0
pkgrel=1
pkgdesc="Columnar in-memory analytics layer for big data."
arch=(x86_64)
url="https://arrow.apache.org"
license=(Apache)
depends=(arrow)
makedepends=(meson)
source=(https://github.com/apache/arrow/archive/apache-arrow-${pkgver}.tar.gz)
md5sums=('204f5fd21da84716311e30a524a1860d')

build(){
  cd arrow-apache-arrow-${pkgver}/c_glib
  meson setup build -Dprefix=/usr
  meson compile -C build
}

package(){
  cd arrow-apache-arrow-${pkgver}/c_glib
  meson install -C build --destdir=${pkgdir}
}
