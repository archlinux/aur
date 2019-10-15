# Maintainer: orhun <github.com/orhun>
pkgname=zps
pkgdesc="A small utility for listing and cleaning up zombie processes."
pkgver=1.0.0
pkgrel=1
arch=('any')
url="https://github.com/orhun/zps"
license=('GPL3')
makedepends=('cmake')
provides=("$pkgname")
conflicts=("$pkgname")
source=('https://github.com/orhun/zps/archive/1.0.0-alpha.tar.gz')
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver-alpha"
  mkdir -p build && cd build/
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver-alpha/build"
  make DESTDIR="$pkgdir" install
}