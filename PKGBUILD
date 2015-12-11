# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=2.1
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.com/findwild"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('f2d5e674d9de9283cc6b8783351bb9e8')

build() {
  cd $srcdir/$pkgname-$pkgver
  export PREFIX=/usr
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make LDFLAGS="-lpthread" 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install 
  rm $pkgdir/usr/share/doc/$pkgname/$pkgname.man
}
