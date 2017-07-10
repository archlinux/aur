# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=cerebro-phonepi
pkgver=1
pkgrel=6
pkgdesc="Digispark power control daemon for PhonePi project"
url="https://gitlab.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" )
depends=("i2c-tools" "xxoff-phonepi")
source=('git+https://gitlab.com/PhonePi/Phone')
sha256sums=("SKIP")

build() {
	cd "$srcdir/Phone/src/Cerebellum/rpi_cerebra"
	make
}

package() {
	cd "$srcdir/Phone/src/Cerebellum/rpi_cerebra"
	make DESTDIR=$pkgdir install
}
