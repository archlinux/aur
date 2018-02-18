# Maintainer: Sergey Malkin  <adresatt@gmail.com>
pkgname=nemu
pkgver=1.4.0
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=('i686' 'x86_64')
url="https://bitbucket.org/PascalRD/nemu"
license=('BSD')
depends=('qemu' 'glibc' 'ncurses' 'sqlite' 'udev' 'libusb')
source=("https://bitbucket.org/PascalRD/$pkgname/get/v$pkgver.tar.bz2")
md5sums=('44d004c35803423cbb7b1f9d0f00205b')

build() {
	cd PascalRD-nemu-1e73a64638ef
	mkdir build
	cd build
	cmake ../
	make
}

package() {
	cd PascalRD-nemu-1e73a64638ef/build
	make DESTDIR="$pkgdir/" install
}
