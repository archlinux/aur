# Maintainer: jxir <aur@jxir.de>

pkgname=avra-git
pkgver=1.4.2.r13.g1b1b3fb
pkgrel=1
pkgdesc="Assembler for the Atmel AVR microcontroller family"
arch=('x86_64')
url="https://github.com/hsoft/avra"
license=('GPL2')
depends=('glibc')
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
