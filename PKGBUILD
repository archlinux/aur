# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

pkgname=openwince-include
pkgver=0.3.2
pkgrel=1
pkgdesc="A collection of the useful independent include files for C/Assembler developers, from the OpenWinCE project"
url="http://openwince.sourceforge.net/jtag/"
source=(http://downloads.sourceforge.net/openwince/include-${pkgver}.tar.bz2)
md5sums=('2e9c1ae3b9ddc81e52a0f624193ceb64')
# for 0.4.2 md5sums=('e564c941363c958a7cd953ad97c1faa4')
arch=('i686')
license=('BSD')

build() {
	cd $startdir/src/include-$pkgver
	./configure --prefix=/usr || exit 1
	make || exit 2
	make DESTDIR=$startdir/pkg install || return 3
}
