# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: fluke

pkgname=libdes
pkgver=4.04b
pkgrel=1
pkgdesc="library for DES encryption"
arch=('i686')
url="http://linux.maruhn.com/sec/libdes.html"
license=('custom')
depends=('glibc')
source=(ftp://ftp.kfki.hu/pub/packages/security/ssh/ossh/libdes-4.04b.tar.gz)
md5sums=('c8d5c69f86c2eedb485583b0305284a1')

build() {
  cd $srcdir/des
  make
}

package() {
  mkdir -p $pkgdir/usr/lib $pkgdir/usr/bin $pkgdir/usr/include $pkgdir/usr/share/man/man1
  cd $srcdir/des
  make LIBDIR=$pkgdir/usr/lib BINDIR=$pkgdir/usr/bin INCDIR=$pkgdir/usr/include MANDIR=$pkgdir/usr/share/man install
}
