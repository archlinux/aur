# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-launchers')
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK+ launchers for sway, i3 and some floating WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL3')
depends=('gtk3' 'gtkmm' 'nlohmann-json')

source=("https://github.com/nwg-piotr/nwg-launchers/archive/v$pkgver.tar.gz")
https://github.com/nwg-piotr/nwg-launchers/archive/v0.1.0.tar.gz

md5sums=('ff9cd0114090f943c6fe5b3fbfa43403')

package() {
  cd "$srcdir/"$pkgname"-$pkgver"/grid
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../bar
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../dmenu
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
}

