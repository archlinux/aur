# Maintainer: Szymon Scholz
# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

pkgname=openwince-include
pkgver=0.4.2
pkgrel=1
pkgdesc="A collection of the useful independent include files for C/Assembler developers, from the OpenWinCE project"
url="http://openwince.sourceforge.net/jtag/"
source=(https://archive.org/download/include-${pkgver}.tar/include-${pkgver}.tar.bz2)
arch=('i686' 'x86_64')
license=('BSD')

build() {
	cd ${srcdir}/include-$pkgver
	./configure --prefix=/usr || exit 1
	make || exit 2
}

package() {
        cd ${srcdir}/include-$pkgver
	make DESTDIR=${pkgdir} install || exit 3
}
md5sums=('e564c941363c958a7cd953ad97c1faa4')
