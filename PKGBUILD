pkgname=cerebro-phonepi
pkgver=1
pkgrel=4
pkgdesc="Digispark power control daemon for PhonePi project"
url="https://github.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" )
depends=("i2c-tools" "xxoff-phonepi")
source=(git://github.com/PhonePi/phonepi.git)
sha256sums=("SKIP")

build() {
	cd "$srcdir/phonepi/src/Cerebellum/rpi_cerebra"
	make
}

package() {
	cd "$srcdir/phonepi/src/Cerebellum/rpi_cerebra"
	make DESTDIR=$pkgdir install
}
