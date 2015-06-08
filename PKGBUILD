# Contributor, Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=findwild
pkgver=2.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
pkgdesc="A program to find files with a nice gtk interface"
url="http://www.kornelix.com/findwild"
source=("http://www.kornelix.com/uploads/1/3/0/3/13035936/$pkgname-$pkgver.tar.gz")
md5sums=('3fc03be068e55e4a491e36a5767dc0be')

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
