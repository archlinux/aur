# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.1
pkgrel=1
pkgdesc="optional map files for Fotoxx"
url="http://www.kornelix.com/fotoxx"
arch=('any')
license=('custom:odbl')
source=("http://www.kornelix.com/uploads/1/3/0/3/13035936/$pkgname-$pkgver.tar.gz"
       http://www.opendatacommons.org/wp-content/uploads/2009/06/odbl-10.txt)
md5sums=('df386c31b0d0d9873366cb55e488dd46'
         '73710f76b8f4359af1033cebcd26011c')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/odbl-10.txt \
	  $pkgdir/usr/share/licenses/$pkgname/odbl-10.txt
}

