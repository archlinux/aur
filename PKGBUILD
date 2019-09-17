# Maintainer: jxir <aur@jxir.de>

pkgname=avra-git
pkgver=1.4.1.r3.g55a17c3
pkgrel=1
pkgdesc="Assember for the Atmel AVR microcontroller family"
arch=('x86_64')
url="https://github.com/hsoft/avra"
license=('GPL2')
makedepends=('git')
provides=('avra')
conflicts=('avra')
source=('git+https://github.com/hsoft/avra.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/avra"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/avra"
	make
}

package() {
	cd "$srcdir/avra"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
