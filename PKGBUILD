pkgname="teensy-loader"
pkgver=1.58
pkgrel=2
pkgdesc="The Teensy Loader program communicates with your Teensy board when the HalfKay bootloader is running, so you can download new programs and run them"
arch=("x86_64")
url="https://www.pjrc.com/teensy/loader.html"
depends=(
    "gtk3"
    "libpng"
    "libusb"
)
source=(
    "teensy-loader-$pkgver.tar.gz::https://www.pjrc.com/teensy/teensy_linux64.tar.gz"
    "https://www.pjrc.com/teensy/00-teensy.rules"
)
sha256sums=(
    "3c772aea35569122e3b4ccbfc2febbe014a8c356a3809d3f85a8fe57bc56f9b9"
    "17f56b63603271e2cdae291fed347b66dfbdfd089b2847cf0b4383c877ffacfb"
)

package() {
    install -D -m755 teensy "${pkgdir}/usr/bin/teensy-loader"
    install -D -m644 00-teensy.rules "${pkgdir}/etc/udev/rules.d/00-teensy.rules"
}

