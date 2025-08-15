# Maintainer: Henrik Harmsen <henrik åt harmsen döt se>
pkgname=dragonfly-navigator-git
pkgver=r287.4d2df79
pkgrel=1
pkgdesc="Dragonfly Navigator: A simple and efficient dual pane file manager for Linux."
arch=('x86_64')
url="https://github.com/suncore/dflynav"
license=('GPL-3.0-or-later')
depends=(
  'kcoreaddons'
  'ki18n'
  'python-exifread'
  'python-inotify-simple'
  'python-pillow'
  'python-pillow-heif'
  'python-pyqt6'
  'qt6-base'
)
makedepends=(
  'git'
  'python-pyqt6'
  'cmake'
  'extra-cmake-modules'
  'gtkmm3'
  'kcoreaddons'
  'ki18n'
  'kio'
  'ktextwidgets'
  'kwidgetsaddons'
  'kxmlgui'
)
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

