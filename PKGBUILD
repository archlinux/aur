pkgname="teensy-loader"
pkgver=1.56
pkgrel=1
pkgdesc="The Teensy Loader program communicates with your Teensy board when the HalfKay bootloader is running, so you can download new programs and run them"
arch=("x86_64")
url="https://www.pjrc.com/teensy/loader.html"
depends=(
    "gtk2"
    "libpng12"
    "libusb"
)
source=(
    "teensy-loader-$pkgver.tar.gz::https://www.pjrc.com/teensy/teensy_linux64.tar.gz"
    "https://www.pjrc.com/teensy/00-teensy.rules"
)
sha256sums=(
    "9d8325378fdd23343ed3f24342ab8bd50e6291ab4f1c74403d5f8e7e02ca4b66"
    "17f56b63603271e2cdae291fed347b66dfbdfd089b2847cf0b4383c877ffacfb"
)

package() {
    install -D -m755 teensy "${pkgdir}/usr/local/bin/teensy-loader"
    install -D -m644 00-teensy.rules "${pkgdir}/etc/udev/rules.d/00-teensy.rules"
}

