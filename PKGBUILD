# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-launchers')
pkgver=0.1.8
pkgrel=1
pkgdesc="GTK+ launchers for sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'nlohmann-json')

source=("$url/archive/v$pkgver.tar.gz")

md5sums=('2531c502ac2081449d3992657db48fb4')

package() {
  cd "$srcdir/$pkgname-$pkgver/grid"
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../bar
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../dmenu
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
}

