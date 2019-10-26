# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=outcurses
pkgver=0.0.4
pkgrel=2
pkgdesc="High-level UI elements built atop ncurses"
url="https://nick-black.com/dankwiki/index.php/Outcurses"
license=('Apache')
arch=('x86_64')
depends=('ncurses')
makedepends=('gtest' 'cmake')
source=("https://github.com/dankamongmen/outcurses/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('0799e6b77ed6a00866dd2f24fc15d345a5908c8a81c742ddc1338f59b3d1adf1')
