# Maintainer: Henrik Harmsen <henrik åt harmsen döt se>
pkgname=dragonfly-navigator-git
pkgver=r286.14b755a
pkgrel=1
pkgdesc="Dragonfly Navigator: A simple and efficient dual pane file manager for Linux."
arch=('x86_64')
url="https://github.com/suncore/dflynav"
license=('GPL-3.0-or-later')
depends=('python-pyqt6')
makedepends=('git' 'python-pyqt6')
source=('git+https://github.com/suncore/dflynav')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dflynav/src"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/dflynav/src"
  export DESTDIR="$pkgdir"
  ./build "arch"
}

package() {
  cd "$srcdir/dflynav/src"
  export DESTDIR="$pkgdir"
  ./package "arch"
}
