# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sortpuz  
pkgver=1.4
pkgrel=1
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order."
url="http://www.kornelix.com/sortpuz"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
conflicts=('fixme')
replaces=('fixme')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('b2692fc9f04e850b2dfea85048bd977b')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
 LDFLAGS="-lpthread" make PREFIX=/usr 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir PREFIX=/usr install
}
