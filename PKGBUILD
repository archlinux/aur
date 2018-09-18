# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

pkgname=ixxat-socketcan
pkgver=1.1.148.0
pkgrel=2
pkgdesc="SocketCAN driver for IXXAT USB-to-CAN v2"
arch=('i686' 'x86_64')
url="https://www.ixxat.com/products/products-industrial/pc-interfaces/pc-can-interfaces/socketcan"
license=('GPL2')
makedepends=(linux-headers)
optdepends=('can-utils: Linux-CAN / SocketCAN user space applications')
install=$pkgname.install
source=("https://www.ixxat.com/docs/librariesprovider8/default-document-library/downloads/other-drivers/socketcan.zip?sfvrsn=c486dcd6_22")
md5sums=('c42d19b75802691b057a8163606903af')

_extramodules=extramodules-ARCH

build() {
	make
}

package() {
	mkdir -p $pkgdir/usr/lib/modules/$_extramodules
	install usb-to-can_socketcan/ixx_usb.ko $pkgdir/usr/lib/modules/$_extramodules
}
