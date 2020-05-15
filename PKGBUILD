# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libuinputplus
pkgver=0.1.4
pkgrel=1
pkgdesc="Easy-to-use uinput library in C++"
url="https://github.com/YukiWorkshop/libuInputPlus"
license=('MIT')
arch=('x86_64')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a537e156d11ad00c643b93cbd9b712d3ec9d0ae8e40731ff763fe9a6ffe97458')
makedepends=('cmake' 'ninja')

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -S "libuInputPlus-$pkgver" -B build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
