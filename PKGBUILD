# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: sxe <sxxe@gmx.de>

pkgname=kuickshow
pkgver=0.9.1
pkgrel=3
pkgdesc="A very fast and convenient image viewer"
url="http://userbase.kde.org/KuickShow"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'imlib' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'docbook-xsl')
install=${pkgname}.install
source=("http://hosti.leonde.de/~gis/${pkgname}-${pkgver}.tar.bz2")
md5sums=('ac8a7b411445fa91a3fbce76e32ee063')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
