# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=2.5
pkgrel=3
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('8282e8c884ed2cad9bc9ac9ae12bd8976812b139e7bfd641e6302bc9b4d26266')

build() {
  cd $pkgname
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install 
  rm "$pkgdir"/usr/share/doc/$pkgname/$pkgname.man
}

