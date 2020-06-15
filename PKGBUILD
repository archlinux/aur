# Maintainer: Junio Calú <junio.calu@gmail.com>

pkgname=dde-pstate
pkgver=0.2.0
pkgrel=1
pkgdesc="Intel pstate dock plugin for Deepin V20"
arch=('x86_64')
url="https://github.com/SeptemberHX/dde-pstate"
license=('GPL')
depends=('deepin-network-utils' 'qt5-base'
         'procps-ng' 'deepin-dock')
makedepends=('cmake' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeptemberHX/dde-pstate/archive/$pkgver.tar.gz")
sha512sums=('652502df6090808553ff7974e5e69de3b893ddf824ef2a0123965ceca48903c5dcb1e87e07adaa4509adc34515c9956d64164ca14450b1af27d8e071bd3a9508')

build() {
  cd $pkgname-$pkgver
  cmake .	\
  	-DCMAKE_INSTALL_PREFIX=/usr \
    	-DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
