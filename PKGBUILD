# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=popa3d
pkgver=1.0.3
pkgrel=1
pkgdesc="tiny POP3 daemon designed with security as the primary goal"
arch=(i686 x86_64)
url="http://www.openwall.com/popa3d/"
license=('BSD')
depends=()
source=(http://www.openwall.com/popa3d/$pkgname-$pkgver.tar.gz)
md5sums=('aa754b86537660d47e5a65eda58be668')

build() {

	cd $srcdir/$pkgname-$pkgver
	make LIBS=-lcrypt

}

package() {

	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir/ \
	  PREFIX=/usr \
	  SBINDIR=/usr/bin \
	  MANDIR=/usr/share/man \
	  install
	install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
