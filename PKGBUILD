# Maintainer: orhun <github.com/orhun>
pkgname=zps-git
pkgdesc="A small utility for listing or cleaning up zombie processes."
pkgver=0.1
pkgrel=1
arch=('any')
url="https://github.com/orhun/zps"
license=('GPL3')
makedepends=('cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('https://github.com/orhun/zps/archive/0.1.tar.gz')
sha256sums=('SKIP')

build() {
  cd ${pkgname%-git}-$pkgver
  mkdir -p build && cd build/
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
