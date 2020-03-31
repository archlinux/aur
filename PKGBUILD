# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-launchers')
pkgver=0.1.3
pkgrel=1
pkgdesc="GTK+ launchers for sway, i3 and some floating WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL3')
depends=('gtk3' 'gtkmm' 'nlohmann-json')

source=("$url/archive/v$pkgver.tar.gz")

md5sums=('b76be386cc855829d1f6929414f9611c')

package() {
  cd "$srcdir/$pkgname-$pkgver/grid"
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../bar
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
  cd ../dmenu
  make PREFIX=/usr DESTDIR="$pkgdir" clean install
}

