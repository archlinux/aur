# Maintainer:  Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lcdf-typetools
pkgver=2.105
pkgrel=1
pkgdesc="Utilities for manipulating OpenType, PostScript Type 1, and Multiple Master fonts"
url="http://www.lcdf.org/type/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs')
source=(http://www.lcdf.org/type/$pkgname-$pkgver.tar.gz)
md5sums=('e3540d438902cb97ad8195d2c2c18ab7')

build() {
  cd "$pkgname-$pkgver"
  ./configure --without-kpathsea --prefix=/usr
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

