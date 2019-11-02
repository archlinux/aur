pkgname="teensy-loader"
pkgver=1.48
pkgrel=1
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
    "2796165aa188bed65879989197ce87662f3e288af6607626868649680edf4619"
    "7c17bb6dcef244fbf8bc9bd85a7eb812eebe60f6a6a3d47bceddde84c77c5914"
)

package() {
	install -D -m755 teensy "${pkgdir}/usr/local/bin/teensy-loader"
	install -D -m644 49-teensy.rules "${pkgdir}/etc/udev/rules.d/49-teensy.rules"
}

