# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=notcurses
pkgver=0.9.2
pkgrel=1
pkgdesc="Modern TUI library"
url="https://nick-black.com/dankwiki/index.php/Notcurses"
license=('Apache')
arch=('x86_64')
depends=('ncurses' 'ffmpeg')
makedepends=('gtest' 'cmake')
source=("https://github.com/dankamongmen/notcurses/archive/v${pkgver}.tar.gz")

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

sha256sums=('4923b6e11c616876b7e512adb5382888a443f6aab870de757f7a0aeaec7ef9f2')
