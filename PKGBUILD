# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=libnetstack
pkgver=0.7.3
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

sha256sums=('ad2395af5a76015e652e6c5d2a7f4a1e48f78aa88d01bf079908021fbdff5929')
