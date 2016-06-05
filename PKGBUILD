# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=sng
pkgver=1.1.0
pkgrel=1
pkgdesc="Convert PNGs to and from a text format representation"
arch=('i686' 'x86_64')
url="http://sng.sourceforge.net/"
license=('BSD')
depends=('libpng' 'netpbm')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha256sums=('119c55870c1d1bdc65f7de9dbc62929ccb0c301c2fb79f77df63f5d477f34619')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-rgbtxt=/usr/share/netpbm/rgb.txt
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
