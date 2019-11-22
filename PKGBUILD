# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=outcurses
pkgver=0.0.9
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

check() {
  cd "$pkgname-$pkgver/build"
  make test
}

sha256sums=('da5aba7ff4cd33b4b956c5708c2e05f779f582d077f84b031627c602bc1fa89a')
