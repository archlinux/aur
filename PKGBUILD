# Maintainer: Jhon Diaz <electimon@gmail.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=libideviceactivation-git
epoch=1
pkgver=1.1.0.r0.gb02cc45
pkgrel=1
pkgdesc="Activates iDevices using a single tool."
arch=('i686' 'x86_64')
url="http://github.com/libimobiledevice/libideviceactivation"
license=('LGPL')
depends=('curl' 'libplist-git' 'libxml2' 'libimobiledevice-git')
makedepends=('git')
source=("git+https://github.com/libimobiledevice/libideviceactivation")
md5sums=('SKIP')


pkgver() {
	cd libideviceactivation

	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd libideviceactivation

	./autogen.sh --prefix=/usr

	make
}

package() {
	cd libideviceactivation
	
	make DESTDIR="$pkgdir" install
}

