# Maintainer: Claudio Lanconelli <lancos@libero.it>

pkgname=ponyprog-bin
pkgver=2.08d
pkgrel=5
pkgdesc="PonyProg is a serial device programmer based on some simple and cheap interfaces for the PC"
arch=('any')
url="http://www.LancOS.com"
license=('GPL')
depends=("libx11" "libxt" "libxext" "libxaw")
provides=("ponyprog")
conflicts=("ponyprog")
source=("http://downloads.sourceforge.net/project/ponyprog/PonyProg%20sources/PonyProg2000-2.08d.tar.gz"
	"fix-build.patch"
	"ponyprog.desktop"
	"ponyprog.png")
md5sums=("19d12a550d1ce7b4f034a918e04dbe2a"
	 "24333137616811ce10a386b207ea873c"
	 "614b9bcd0a846373b4c32de89ec2bd71"
	 "9ff33c34d7a43d26b83b2ea40ceea7a6")

package() {
	cd "${srcdir}/PonyProg-${pkgver}"

	msg2 'Adding binary'
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755    "${srcdir}/PonyProg-${pkgver}/bin/ponyprog2000" "${pkgdir}/usr/bin"

	msg2 'Adding application'
	install -m755 -d "${pkgdir}/usr/share/applications"
	install -m644    "${srcdir}/ponyprog.desktop" "${pkgdir}/usr/share/applications"

	msg2 'Adding pixmap'
	#convert "${srcdir}/PonyProg-${pkgver}/ponyprog.ico" "${srcdir}/ponyprog.png"
	install -m755 -d "${pkgdir}/usr/share/pixmaps"
	install -m644    "${srcdir}/ponyprog.png" "${pkgdir}/usr/share/pixmaps"
}
