# Maintainer: Micro <microgamercz@proton.me> -> https://github.com/MicrogamerCz

pkgname=piqi-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Unofficial Qt API for Pixiv (with async support)"
arch=(x86_64)
url="https://github.com/MicrogamerCz/Piqi"
license=(Unlicense)
depends=(qcoro)
provides=('piqi')
makedepends=(extra-cmake-modules git)
source=("git+https://github.com/MicrogamerCz/Piqi")
sha256sums=('SKIP')

build() {
  cmake -B build -S Piqi \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
