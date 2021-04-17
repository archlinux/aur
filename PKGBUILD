pkgname="teensy-loader"
pkgver=1.52
pkgrel=2
pkgdesc="The Teensy Loader program communicates with your Teensy board when the HalfKay bootloader is running, so you can download new programs and run them"
arch=("x86_64")
url="https://www.pjrc.com/teensy/loader.html"
depends=(
    "libpng12"
    "libusb"
)
source=(
    "teensy-loader-$pkgver.tar.gz::https://www.pjrc.com/teensy/teensy_linux64.tar.gz"
    "https://www.pjrc.com/teensy/00-teensy.rules"
)
sha256sums=(
    "00c99f0ea6c686747595ad70401a8d78faa1c34a0171093c661566926dc03bfa"
    "7678442fb9f98289f93ff4938c221f0d582d19ec750823d66721abc926165810"
)

package() {
	install -D -m755 teensy "${pkgdir}/usr/local/bin/teensy-loader"
	install -D -m644 00-teensy.rules "${pkgdir}/etc/udev/rules.d/00-teensy.rules"
}

