#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=1.2
pkgrel=1
pkgdesc="Raspberry Pi Imaging Utility"
depends=('curl' 'libarchive' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2')
makedepends=('gcc' 'make' 'cmake')
arch=('x86_64')
url="https://github.com/raspberrypi/rpi-imager"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
license=("Apache")
sha256sums=('69c67d6a92629d6c701c0ffe29b3033032e9b808fe9948c8abcc83409fec93d8')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
