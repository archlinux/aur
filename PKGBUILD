#Package for libIEC61850
#Library headers are prefixed with libiec61850 (standard with cmake install)
#I've tested the library for x86_64 and ARM architectures;
#	(ARM v5 softfloat, and ARM v7 hardfloat.) However this package has so far
#	only been tested on x86_64 - I've included i686 as well, as it ought to work.
#Packager Henrik Juul Pedersen <henrikjuul AT gmail>

pkgname=libiec61850
pkgver=0.9.2.1
pkgrel=1
pkgdesc="libIEC61850 provides a server and client library for IEC 61850"
arch=('x86_64' 'i686')
url="http://libiec61850.com/"
license=('GPLv3')
source=("http://libiec61850.com/libiec61850/wp-content/uploads/2016/06/$pkgname-$pkgver.tgz")
sha256sums=('85132b12f65282ea14ede46b90b9ee0f68566bb08564d04e3cf157e16df09bb0')

build() {
	cd $pkgname-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/ CMakeLists.txt
	make -j
}

#Install prefix set by cmake
package() {
	cd $pkgname-$pkgver
	make install
}
