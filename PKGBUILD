#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=1.3
pkgrel=1
pkgdesc="Raspberry Pi Imaging Utility"
depends=('curl' 'libarchive' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('gcc' 'make' 'cmake')
arch=('x86_64')
url="https://github.com/raspberrypi/rpi-imager"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
license=("Apache")
sha256sums=('087eb16c1d17d32c3c8771914bd76122e2a901c94ba52ea7e39a2e98bc23e77a')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
