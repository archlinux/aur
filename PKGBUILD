# Maintainer: RickaPrincy <rckprincy@gmail.com>

pkgname=dumb_types
pkgver=1.0.0
pkgrel=1
pkgdesc="Header-only C++ library providing convenient data types (header only)"
arch=('any')
url="https://github.com/RickaPrincy/dumb_types"
license=('MIT')
makedepends=("cmake")

source=("dumb_types.tar.gz::https://github.com/RickaPrincy/dumb_types/releases/download/v$pkgver/dumb_types.tar.gz")
sha256sums=("a9b87cc3da72c3ce746380fa207f52229f8907e1735aaf8e9b1d5abd19df4929")

build() {
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
