# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=2.4
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.net/findwild/findwild.html"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('4f265ad15032b23d62c6c23c783018ec9698fb3b945ef1425dec364308128815')

build() {
  cd $pkgname-$pkgver
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install 
  rm "$pkgdir"/usr/share/doc/$pkgname/$pkgname.man
}

