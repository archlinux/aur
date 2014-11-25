# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

pkgname=openwince-jtag
pkgver=0.5.1
pkgrel=1
pkgdesc="Software package to work with JTAG-aware hardware devices, from the OpenWinCE project"
url="http://openwince.sourceforge.net/jtag/"
source=(http://downloads.sourceforge.net/openwince/jtag-${pkgver}.tar.bz2)
md5sums=('3171d51fec40e9f338ea2d388544fd66')
depends=('readline' 'openwince-include<=0.4')
arch=('i686')
license=('GPL')

build() {
	cd $startdir/src/jtag-$pkgver
	./configure --prefix=/usr || exit 1
	make || exit 2
	make DESTDIR=$startdir/pkg install || exit 3
}
