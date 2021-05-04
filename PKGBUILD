# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sawfish-pager  
pkgver=0.90.4
pkgrel=2
pkgdesc="A pager for sawfish"
url="http://sawfish.wikia.com/wiki/Main_Page"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sawfish')
source=(https://download.tuxfamily.org/sawfishpager/${pkgname}_${pkgver}.tar.xz)
sha256sums=('1ed6701ce65b3791e5ba9b54e65594502aa4e736db7a670e31fa0ddf24cecd6e')
options=('!libtool')

build() {
  cd ${pkgname}_${pkgver}
  ./configure --prefix=/usr
  sed -i 's+1.8.1\/++' Makefile
  make 
}
package() {
  cd ${pkgname}_${pkgver}
  make DESTDIR="$pkgdir" install
}
