# Maintainer: Anonymous

pkgname=loiq
pkgver=0.3.1a
pkgrel=4
pkgdesc="Low Orbit Ion Cannon - Qt Edition"
url='http://sourceforge.net/projects/loiq'
arch=('x86_64' 'i686')
source=("http://downloads.sourceforge.net/project/salix-sbo/13.37/loiq/${pkgname}-${pkgver}.tar.bz2")
license=('GPL')
depends=('qt4')
sha1sums=('74bf705cb96dd2929b02a92bab3e0140')
sha1sums=('a6661fc1b25de36e473bf01823796bc74fe64648')

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake-qt4 "../loiq-${pkgver}"
  make
}

package() {
  install -Dm755 build/loiq "${pkgdir}/usr/bin/loiq"
}
