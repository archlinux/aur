# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=libnetstack
pkgver=0.7.0
pkgrel=1
pkgdesc="Networking stack cache atop netlink"
url="https://nick-black.com/dankwiki/index.php/Libnetstack"
license=('Apache')
arch=('x86_64')
depends=('ncurses')
makedepends=('gtest' 'cmake' 'libnl')
source=("https://github.com/dankamongmen/libnetstack/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$pkgname-$pkgver/build"
  make test
}

sha256sums=('c4b5862c17dc60d1c46f259eeecc44bf9bed9b8372af14e5b21983a7471abcd4')
