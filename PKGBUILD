# Maintainer: Young Acinonyx <young.acinonyx [at ] gmail [dot] com>

pkgname=ezusb
pkgver=1.5.3
pkgrel=1
epoch=
pkgdesc="Driver for EZ100PU/EZMINI smart card readers. Smartnonus compatible."
arch=('x86_64')
url="http://www.nonus.com.br/smartnonus/"
license=('unknown')
makedepends=('unzip')
source=("http://www.nonus.com.br/download/smartnonus/2011810151801402.zip")
md5sums=('c4adcc5cb7f34f3a6092b1474c06c513')

prepare() {
	cd "$srcdir/EZUSB_Linux/"
	unzip -qo EZUSB_Linux_x86_v$pkgver.zip
	unzip -qo EZUSB_Linux_x86_64_v$pkgver.zip
}

package() {
	mkdir -p "${pkgdir}/usr/lib/pcsc/drivers/$pkgname.bundle/Contents/Linux"
	cp -Rfv "${srcdir}/EZUSB_Linux/EZUSB_Linux_x86_64_v${pkgver}/driver_${pkgname}_v${pkgver}_for_64_bit/drivers/Info.plist" "${pkgdir}/usr/lib/pcsc/drivers/${pkgname}.bundle/Contents/"
	cp -Rfv "${srcdir}/EZUSB_Linux/EZUSB_Linux_x86_64_v${pkgver}/driver_${pkgname}_v${pkgver}_for_64_bit/drivers/${pkgname}.so" "${pkgdir}/usr/lib/pcsc/drivers/${pkgname}.bundle/Contents/Linux"
	# Uncomment to enable 32-bit support
	#mkdir -p "$pkgdir/usr/lib32/pcsc/drivers/$pkgname.bundle/Contents/Linux"
	#cp -Rfv "$srcdir/EZUSB_Linux/EZUSB_Linux_v${pkgver}/driver_${pkgname}_v${pkgver}/drivers/Info.plist" "$pkgdir/usr/lib32/pcsc/drivers/${pkgname}.bundle/Contents/"
	#cp -Rfv "$srcdir/EZUSB_Linux/EZUSB_Linux_v${pkgver}/driver_${pkgname}_v${pkgver}/drivers/${pkgname}.so" "$pkgdir/usr/lib32/pcsc/drivers/${pkgname}.bundle/Contents/Linux"
}
