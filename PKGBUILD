# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Celestial Walrus <aur@celestial.cf>

pkgname=cava
pkgver=0.6.1
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('any')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser')
source=("https://github.com/karlstav/cava/archive/$pkgver.tar.gz")
sha512sums=('fb8a685f5c758ca1d95d3bbafadd4dbbf109592b6c3052b0821c2f69f3423e0af7657de4c3c1cdbd1523748bf56a09cbf706afa404051a6fba8139ca128ebecb')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 cava "$pkgdir/usr/bin/cava"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
