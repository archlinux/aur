# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=notcurses
pkgver=1.1.3
pkgrel=1
pkgdesc="Modern TUI library"
url="https://nick-black.com/dankwiki/index.php/Notcurses"
license=('Apache')
arch=('x86_64')
depends=('ncurses' 'ffmpeg')
makedepends=('cmake' 'pandoc' 'python-cffi' 'python-setuptools')
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
  make DESTDIR="$pkgdir/" CMAKE_INSTALL_PREFIX="$pkgdir/" install
}

check() {
  cd "$pkgname-$pkgver/build"
  make test
}

sha256sums=('bff7de2bffba1ae54fd2155fa4be69809f18f361a817d8bcb0786dafe7211c1c')
