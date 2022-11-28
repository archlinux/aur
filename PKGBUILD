# Maintainer: Antoni Przybylik <antoni.przybylik@wp.pl>

pkgname=lutok
pkgver=0.4
pkgrel=1
pkgdesc="Lightweight C++ API library for Lua"
arch=('x86_64')
url="https://github.com/jmmv/lutok"
license=('BSD')
depends=('lua')
makedepends=('doxygen' 'gawk')
source=('https://github.com/jmmv/lutok/releases/download/lutok-0.4/lutok-0.4.tar.gz')
sha1sums=('f13ea7cd8344e43c71c41f87c9fdbc2b9047a504')

build()
{
	cd "$srcdir/${pkgname}-${pkgver}" || exit
	echo $PWD
	./configure --prefix=/usr/
	make
}

package()
{
	cd "$srcdir/${pkgname}-${pkgver}" || exit
	make DESTDIR="$pkgdir" install
}
