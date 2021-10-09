# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xtruss
pkgver=20210911.854c36a
pkgrel=1
pkgdesc="X11 protocol tracer, akin to strace"
arch=(x86_64)
url="https://www.chiark.greenend.org.uk/~sgtatham/xtruss/"
license=(MIT)
source=("https://www.chiark.greenend.org.uk/~sgtatham/xtruss/xtruss-$pkgver.tar.gz")
sha256sums=('94609812c613477201048e10757d185fe2e9e08f42949249e4ea713bce843f04')
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
