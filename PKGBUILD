# $Id:$
# Maintainer: Abhishek Dasgupta <abhidg@gmail.com>
pkgname=hodie
pkgver=1.4
pkgrel=1
pkgdesc="Prints the date in Latin."
url="http://hodie.sourceforge.net"
arch=(i686 x86_64)
license=('custom')
source=(http://downloads.sourceforge.net/hodie/$pkgname-$pkgver.tar.gz
        Makefile.diff)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i ../Makefile.diff || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}
md5sums=('fd3f23135fd74e17516aa0c08757edd9'
         'c65fae177943033f068cdeca16f7bd49')
