# Contributor: royrocks <royrocks13@gmail.com>
pkgname=binclock
pkgver=1.5
pkgrel=1
pkgdesc="Displays system time in binary format."
arch=(i686 x86_64)
url="http://www.ngolde.de/binclock.html"
license=('GPL')
depends=('gcc')
source=(http://www.ngolde.de/download/$pkgname-$pkgver.tar.gz)
md5sums=('d26ea67970c782ee56c87595ed3bfef0')
build() {
 cd $startdir/src/$pkgname-$pkgver
 install -d m644 $startdir/pkg/usr/man/man1/
 install -d m644 $startdir/pkg/usr/share/binclock/
 install -d m644 $startdir/pkg/etc/
 install -d m644 $startdir/pkg/usr/bin
 make PREFIX=/usr || return 1
 make PREFIX=$startdir/pkg/usr DESTDIR=$startdir/pkg MANPATH=$startdir/pkg/usr/man/man1 CONF=$startdir/pkg/etc/ INSPATH=$startdir/pkg/usr/bin HOME=$startdir/pkg/usr/share/binclock install

}
