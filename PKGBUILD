# Author: Dominic Radermacher <dominic.radermacher@gmail.com>
pkgname=ptouch
pkgver=1.3
pkgrel=1
pkgdesc="Command line tool to print text or graphic labels on Brother P-touch printers like PT-2430PC"
arch=('i686' 'x86_64' 'armv6h')
url="http://mockmoon-cybernetics.ch/computer/p-touch2430pc/"
license=('GPL2')
depends=('libusb>=1.0' 'gd>=2.0.16')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.txz)
sha256sums=('388448c311a99fad31f4315ff42375c9f7b9f71c4601397ef86d46b089404204')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}
package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
