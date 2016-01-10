# Contributor: dpayne <darby.payne@gmail.com>
# Maintainer: dpayne <darby.payne@gmail.com>

pkgname="cli-visualizer"
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="A cli visualizer for mpd"
arch=('i686' 'x86_64')
url="https://github.com/dpayne/cli-visualizer"
license=('MIT')
depends=('ncurses' 'fftw')
makedepends=('git' 'fftw' 'pkg-config')
conflicts=()
install=${pkgname}.install
source=("git+https://github.com/dpayne/cli-visualizer")
md5sums=('SKIP')

pkgver() {
  cd cli-visualizer || exit
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd cli-visualizer || exit
  make
}

package() {
  cd cli-visualizer || exit
  install -Dm755 build/vis "$pkgdir/usr/bin/vis"

  mkdir -p "$pkgbuild/usr/share/doc/cli-visualizer/"
  cp examples/* "$pkgbuild/usr/share/doc/cli-visualizer/examples/"
}
