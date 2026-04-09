# Maintainer: realSUDO <github.com/realSUDO>
pkgname=typeape
pkgver=1.0.0
pkgrel=1
pkgdesc='Fast, minimal terminal typing speed test'
arch=('x86_64')
url='https://github.com/realSUDO/typeape'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -j$(nproc)
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" cmake --install build
}
