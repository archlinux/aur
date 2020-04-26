# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-launchers')
pkgver=0.1.7
pkgrel=2
pkgdesc="GTK+ launchers for sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'nlohmann-json')

source=("$url/archive/v$pkgver.tar.gz")

md5sums=('ac5f1b1360f6c6a96661498e329a5370')

package() {
  cd "$srcdir/$pkgname-$pkgver/grid"
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../bar
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../dmenu
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
}

