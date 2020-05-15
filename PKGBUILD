# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libevdevplus
pkgver=0.1.1
pkgrel=1
pkgdesc="Easy-to-use event device library in C++"
url="https://github.com/YukiWorkshop/libevdevPlus"
license=('MIT')
arch=('x86_64')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c941b6b45f784c1e6c6f316f59256fabd604ac392db405cf7fd99de2686aaab0')
makedepends=('cmake' 'ninja')

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S "libevdevPlus-$pkgver" -B build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
