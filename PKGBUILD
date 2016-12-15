# Contributor: dpayne <darby.payne@gmail.com>
# Maintainer: dpayne <darby.payne@gmail.com>

pkgname="cli-visualizer"
pkgver=1.5
pkgrel=5
pkgdesc="A cli visualizer for mpd"
arch=('i686' 'x86_64')
url="https://github.com/dpayne/cli-visualizer/"
license=('MIT')
depends=('ncurses' 'fftw')
makedepends=('git' 'fftw')
conflicts=('vis')
install=${pkgname}.install
source=('https://github.com/dpayne/cli-visualizer/archive/1.5.tar.gz')
sha256sums=('aa840f42727147baa78920b08ac5f4c32e4756e532fd675a22f4b2a009829294')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 build/vis "$pkgdir/usr/bin/vis"
  install -Dm644 examples/blue "$pkgdir"/usr/share/doc/"$pkgname"/blue
  install -Dm644 examples/config "$pkgdir"/usr/share/doc/"$pkgname"/config
  install -Dm644 examples/rainbow "$pkgdir"/usr/share/doc/"$pkgname"/rainbow
  install -Dm644 examples/basic_colors "$pkgdir"/usr/share/doc/"$pkgname"/basic_colors
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
