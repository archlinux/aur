# Contributor: dpayne <darby.payne@gmail.com>
# Maintainer: dpayne <darby.payne@gmail.com>

pkgname="cli-visualizer"
pkgver=1.1
pkgrel=2
pkgdesc="A cli visualizer for mpd"
arch=('i686' 'x86_64')
url="https://github.com/dpayne/cli-visualizer/"
license=('MIT')
depends=('ncurses' 'fftw')
makedepends=('git' 'fftw' 'pkg-config')
conflicts=()
install=${pkgname}.install
source=('https://github.com/dpayne/cli-visualizer/archive/v1.1.tar.gz')
sha256sums=('13ae8ce89d3d2e41524a42dbb14343b951701f44650ea5a977c3311cb96a113f')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
  cd cli-visualizer || exit
  install -Dm755 build/vis "$pkgdir/usr/bin/vis"
  install -Dm644 examples/blue "$pkgdir"/usr/share/doc/"$pkgname"/blue
  install -Dm644 examples/config "$pkgdir"/usr/share/doc/"$pkgname"/config
  install -Dm644 examples/rainbow "$pkgdir"/usr/share/doc/"$pkgname"/rainbow
  install -Dm644 examples/basic_colors "$pkgdir"/usr/share/doc/"$pkgname"/basic_colors
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
