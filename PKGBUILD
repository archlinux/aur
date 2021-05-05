# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=libplctag
pkgver=2.3.6
pkgrel=1
pkgdesc='API for accessing Allen-Bradley and Modbus PLC data over Ethernet'
arch=('x86_64')
url="https://github.com/kyle-github/$pkgname"
license=('GPL')
makedepends=('cmake')
source=("$url/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  mkdir build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr ".."

  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
sha512sums=('a2ef3e46f48e7304ac9b7e0d90891ebe97956b0a43105b94c5a2df60b42f2e550062ce3eabd771f74c9ec3eb2800b50d588dd1da551a537593996505de914b7e')
