# Author: Dominic Radermacher <dominic.radermacher@gmail.com>
pkgname=ptouch
pkgver=1.3.1
pkgrel=1
pkgdesc="Command line tool to print text or graphic labels on Brother P-touch printers like PT-2430PC"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://mockmoon-cybernetics.ch/computer/p-touch2430pc/"
license=('GPL2')
depends=('libusb>=1.0' 'gd>=2.0.16')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('327c383c47fb92d34c06b737ca25874326ce2936fb5a94ae38c48f16c14658a3')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}
package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
