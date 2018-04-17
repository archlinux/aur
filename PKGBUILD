# Contributor: dpayne <darby.payne@gmail.com>
# Maintainer: dpayne <darby.payne@gmail.com>

pkgname="cli-visualizer"
pkgver=1.7
pkgrel=7
pkgdesc="A cli visualizer for mpd"
arch=('i686' 'x86_64')
url="https://github.com/dpayne/cli-visualizer/"
license=('MIT')
depends=('ncurses' 'fftw')
makedepends=('git' 'fftw')
conflicts=('vis')
install=${pkgname}.install
source=('https://github.com/dpayne/cli-visualizer/archive/1.7.tar.gz')
sha256sums=('0445fbfad9707668a70ff146f3f24308f28fa0ae67a7010bfdea0dacba75b75b')

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
