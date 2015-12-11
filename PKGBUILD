# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=fotoxx-maps
pkgver=1.1
pkgrel=2
pkgdesc="optional map files for Fotoxx"
url="http://www.kornelix.com/fotoxx"
arch=('any')
license=('custom:odbl')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz"
       http://www.opendatacommons.org/wp-content/uploads/2009/06/odbl-10.txt)
md5sums=('0d9f2d2715fea15ad9f4189caaf1112f'
         '73710f76b8f4359af1033cebcd26011c')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/odbl-10.txt \
	  $pkgdir/usr/share/licenses/$pkgname/odbl-10.txt
}

