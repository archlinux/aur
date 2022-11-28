# Maintainer: Antoni Przybylik <antoni.przybylik@wp.pl>

pkgname=kyua
pkgver=0.13
pkgrel=1
pkgdesc="Collection of libraries and tools to implement and run automated tests"
arch=('x86_64')
url="https://github.com/jmmv/kyua"
license=('BSD')
depends=('lua' 'sqlite' 'lutok=0.4')
makedepends=('doxygen' 'gawk')
source=('https://github.com/jmmv/kyua/releases/download/kyua-0.13/kyua-0.13.tar.gz')
sha1sums=('2e437ffdb96dfc6325e283e531a1a3e11bebe4d7')

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
