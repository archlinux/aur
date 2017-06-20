# Maintainer: Sergey Malkin  <adresatt@gmail.com>
pkgname=nemu
pkgver=1.2.0
pkgrel=1
pkgdesc="ncurses interface for QEMU"
arch=('i686' 'x86_64')
url="https://bitbucket.org/PascalRD/nemu"
license=('BSD')
depends=('qemu' 'glibc' 'ncurses' 'sqlite' 'udev' 'libusb')
source=("https://bitbucket.org/PascalRD/$pkgname/get/v$pkgver.tar.bz2")
md5sums=('6fbd0e997433ddfeedab2ad718335155')

build() {
	cd PascalRD-nemu-c1c41178bb79
	mkdir build
	cd build
	cmake ../
	make
}

package() {
	cd PascalRD-nemu-c1c41178bb79/build
	make DESTDIR="$pkgdir/" install
}
