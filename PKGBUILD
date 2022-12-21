# Maintainer: Pato05 <pato05mc@gmail.com>

pkgname=cppbtbl
pkgver=0.2.0
pkgrel=0
pkgdesc="A C++ wrapper around the UPower DBus API to get bluetooth devices' battery"
url="https://github.com/pato05/cppbtbl"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('sdbus-cpp')
makedepends=('cmake' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pato05/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e974d22b752a699c0ca36e961b2634a34c73e0ea25fbabdf3d449a20fc1517c03adafe72b37869c19da6f677184e1720b81cfcda72b0c093137c7f8e24758277')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make install DESTDIR="$pkgdir"
}

