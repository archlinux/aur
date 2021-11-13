pkgname="teensy-loader"
pkgver=1.52
pkgrel=4
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
    "00c99f0ea6c686747595ad70401a8d78faa1c34a0171093c661566926dc03bfa"
    "17f56b63603271e2cdae291fed347b66dfbdfd089b2847cf0b4383c877ffacfb"
)

package() {
    install -D -m755 teensy "${pkgdir}/usr/local/bin/teensy-loader"
    install -D -m644 00-teensy.rules "${pkgdir}/etc/udev/rules.d/00-teensy.rules"
}

