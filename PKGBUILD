# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=2.6
pkgrel=2
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.com/picpuz/"
license=('GPL3')
depends=('gtk3')
makedepends=('pkgconfig')
source=("http://www.kornelix.com/uploads/1/3/0/3/13035936/$pkgname-$pkgver.tar.gz")
md5sums=('38f7d3852853bed419070df2418cf4a8')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr LDFLAGS="-lpthread"
}
package() { 
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/share/doc/$pkgname/$pkgname.man
}
