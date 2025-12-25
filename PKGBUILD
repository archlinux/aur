pkgname=cheeseburger
pkgver=1.1.2
pkgrel=1
pkgdesc="A lolcat clone in C++"
arch=('x86_64' 'aarch64')
url="https://github.com/lov3b/cheeseburger"
license=('BSD-3-Clause')
depends=('boost-libs')
makedepends=('cmake' 'boost' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ff65cd56b0a3e0b3a3c6109fb91aa8b57704d1bf4e00310899b5299309c9478')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
