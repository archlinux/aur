# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=2.5
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('e19f3cd4da01c59fc7073e8c0d737ee26c7d1285e8e685fdf29465fa294f99fb')

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

