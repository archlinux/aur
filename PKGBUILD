# Maintainer: Martino Pilia <martino.pilia@proton.me>
pkgname=openocd-raspberrypi-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="OpenOCD build for Raspberry Pi pico"
arch=("x86_64")
url="https://github.com/raspberrypi/openocd"
license=('GPL2')
depends=('libftdi-compat' 'libusb-compat' 'hidapi' 'capstone' 'libjaylink' 'libftdi')
provides=(openocd)
conflicts=(openocd)
source=("https://github.com/raspberrypi/pico-sdk-tools/releases/download/v2.2.0-3/openocd-0.12.0+dev-x86_64-lin.tar.gz")
sha256sums=('934c8b1a5d2f85a64e02255bc1da1ce78d5266416a0e845d18dbde251a1ad3ed')

package() {
	install -D -m755 \
		"${srcdir}/openocd" \
		"${pkgdir}/usr/bin/openocd"

	install -d -m755 \
        "${pkgdir}/usr/share/openocd"

	cp -a \
		"${srcdir}/scripts" \
		"${pkgdir}/usr/share/openocd/scripts"
}

