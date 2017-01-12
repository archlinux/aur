# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libirecovery-git
epoch=2
pkgver=0.1.1.r109.gaaf89f2
pkgrel=2
pkgdesc="Library and utility to talk to iBoot/iBSS via USB"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org/"
license=('LGPL2.1')
depends=('libusb' 'readline')
makedepends=('git')
provides=("libirecovery")
conflicts=("libirecovery")
source=("git+https://git.libimobiledevice.org/libirecovery.git")
md5sums=('SKIP')

pkgver() {
	cd libirecovery

	git describe --long --tags | sed -r -e 's/-/.r/;s/-/./'
}

build() {
	cd libirecovery

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd libirecovery

	make DESTDIR="$pkgdir" install
}
