# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=advancescan
pkgver=1.17
pkgrel=1
pkgdesc="A command line rom manager for MAME, MESS, AdvanceMAME, AdvanceMESS and Raine"
arch=('i686' 'x86_64')
url="http://advancemame.sourceforge.net"
depends=('')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/advancemame/$pkgname-$pkgver.tar.gz)
md5sums=('9a231fc4f609b5ad08f79a392eb60c85')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr || return 1
	make || return 1
}

package() {
    cd $srcdir/$pkgname-$pkgver
	# Binaries
	install -D -m755 advscan $pkgdir/usr/bin/advscan
	install -D -m755 advdiff $pkgdir/usr/bin/advdiff
	# Documentation
	install -D -m644 doc/advscan.1 $pkgdir/usr/share/man/man1/advscan.1
	install -D -m644 doc/advdiff.1 $pkgdir/usr/share/man/man1/advdiff.1
}
