# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-launchers')
pkgver=0.1.5
pkgrel=1
pkgdesc="GTK+ launchers for sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL3')
depends=('gtk3' 'gtkmm' 'nlohmann-json')

source=("$url/archive/v$pkgver.tar.gz")

md5sums=('a1c050599b0b3c77bc0cbe0aca4c2225')

package() {
  cd "$srcdir/$pkgname-$pkgver/grid"
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../bar
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../dmenu
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
}

