# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=outcurses
pkgver=0.0.6
pkgrel=1
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

sha256sums=('7112fbbde61514717f46df1bcb8a3d8275aac00d9a4610cb2de9405555de8553')
