# Maintainer: Pato05 <pato05mc@gmail.com>

pkgname=cppbtbl
pkgver=0.1.0
pkgrel=0
pkgdesc="A C++ wrapper around the UPower DBus API to get bluetooth devices' battery"
url="https://github.com/pato05/cppbtbl"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('sdbus-cpp')
makedepends=('cmake' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pato05/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('6f5fd1a48b9905179578081a2ccaf2f8a6b276bf62cecb248147e77663575ddf2d4f765f42bae034522554278fdde391fabfb994950624d550128c36674ccf95')

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

