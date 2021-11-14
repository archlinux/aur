# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xtruss
pkgver=20211025.c25bf48
pkgrel=1
pkgdesc="X11 protocol tracer, akin to strace"
arch=(x86_64)
url="https://www.chiark.greenend.org.uk/~sgtatham/xtruss/"
license=(MIT)
source=("https://www.chiark.greenend.org.uk/~sgtatham/xtruss/xtruss-$pkgver.tar.gz")
sha256sums=('8a4b8a1ed5c49f65152c4eb697ba83f6a73d65493a8e202a8f9aeedfabe07479')
makedepends=(cmake)

build() {
  cmake \
    -S xtruss-$pkgver \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
