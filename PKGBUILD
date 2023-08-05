# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=libplctag
pkgver=2.5.5
pkgrel=1
pkgdesc='Portable and simple API for accessing Allen-Bradley and Modbus PLC data over Ethernet.'
arch=('x86_64')
url="https://github.com/kyle-github/$pkgname"
license=('GPL')
makedepends=('cmake')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('ff9aee851c75fca28dc8a1e500d456d48fe34ba7046860a951be9d47a2e2afa2')

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
