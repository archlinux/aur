# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=avr8-burn-o-mat
_pkgname=AVR8_Burn-O-Mat
pkgver=2.1.2
_pkgver=2_1_2
pkgrel=2
pkgdesc="GUI for the avrdude Atmel progammer tool"
url="http://burn-o-mat.net/"
depends=("avrdude")
license=("GPL3")
arch=('x86_64')
source=("http://burn-o-mat.net/${_pkgname}_${_pkgver}.zip"
        "avr-burn-o-mat")
sha256sums=('96a212a3951d736c5e93c7133e424297fbd5e71a999b7123f6c18fc64073600a'
            'a387e203ffdefeccb9766e017650871b5699100e44fb120316803b3d5338368c')
package() {
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/share/${pkgname}/lib"
	install -dm755 "${pkgdir}/usr/bin"
	
	cd "${srcdir}/${_pkgname}"
	cp "AVR8_Burn_O_Mat.jar" "${pkgdir}/usr/share/${pkgname}"
	cp "AVR8_Burn_O_Mat_Config.xml" "${pkgdir}/usr/share/${pkgname}"
	cp "AVR8_Burn-O-Mat.png" "${pkgdir}/usr/share/${pkgname}"
	cp "AVR8_Burn-O-Mat_Icon_16.png" "${pkgdir}/usr/share/${pkgname}"
	cp lib/*.jar "${pkgdir}/usr/share/${pkgname}/lib/"
	
	cp "${srcdir}/avr-burn-o-mat" "${pkgdir}/usr/bin/avr-burn-o-mat"
}
