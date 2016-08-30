# Maintainer: Stipe Kotarac <stipe at kotarac dot net>
pkgname=slct
pkgver=0.05
pkgrel=1
pkgdesc="simple logfile clustering tool"
arch=('i686' 'x86_64')
url="https://ristov.github.io/slct/"
license=('GPL')
source=(https://ristov.github.io/slct/$pkgname-$pkgver.tar.gz)
md5sums=('0c6443502a693e06152c05473512b70d')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	gcc -o slct -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 slct.c
	install -D -m755 slct ${pkgdir}/usr/bin/slct
	install -D -m644 slct.1 ${pkgdir}/usr/share/man/man1/slct.1
}
