pkgname="teensy-loader"
pkgver=1.40
pkgrel=2
pkgdesc="The Teensy Loader makes getting code into your Teensy easy."
arch=("x86_64")
url="https://www.pjrc.com/teensy/loader.html"
depends=(
    "libpng12"
    "libusb"
)
source=(
    "teensy-loader-$pkgver.tar.gz::https://www.pjrc.com/teensy/teensy_linux64.tar.gz"
    "https://www.pjrc.com/teensy/49-teensy.rules"
)
sha256sums=(
    "b4e26c4717afae5dee397fa3a0660a3e499e573e5edab259c5fd52beb221032e"
    "7c17bb6dcef244fbf8bc9bd85a7eb812eebe60f6a6a3d47bceddde84c77c5914"
)

package() {
	install -D -m755 teensy "${pkgdir}/usr/local/bin/teensy-loader"
	install -D -m644 49-teensy.rules "${pkgdir}/etc/udev/rules.d/49-teensy.rules"
}

