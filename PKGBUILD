# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libirecovery-git
epoch=2
pkgver=0.1.1.r84.ge4349e5
pkgrel=1
pkgdesc="Library and utility to talk to iBoot/iBSS via USB"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org/"
license=('LGPL2.1')
depends=('usbmuxd-git' 'libimobiledevice-git')
makedepends=('git')
provides=("libirecovery")
conflicts=("libirecovery")
source=("git://git.sukimashita.com/libirecovery.git")
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
