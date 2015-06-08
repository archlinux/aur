# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sawfish-pager  
pkgver=0.90.4
pkgrel=1 
pkgdesc="A pager for sawfish"
url="http://sawfish.wikia.com/wiki/Main_Page"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sawfish')
source=(http://download.tuxfamily.org/sawfishpager/${pkgname}_${pkgver}.tar.xz)
md5sums=('5f2df9cc76a225a6bd91798e80f19a4e')
options=('!libtool')
build() {
  cd $srcdir/${pkgname}_${pkgver}
  ./configure --prefix=/usr
  sed -i 's+1.8.1\/++' Makefile
  make 
}
package() {
  cd $srcdir/${pkgname}_${pkgver}
  make DESTDIR=$pkgdir install
}
