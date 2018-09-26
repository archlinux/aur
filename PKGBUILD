# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=microsip
pkgver=3.19.8
pkgrel=2
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
arch=(x86_64)
url="https://www.microsip.org/"
license=(GPLv2)
depends=(wine lib32-libpulse xorg-xdpyinfo)
install=${pkgname}.install

source=("MicroSIP-Lite-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-Lite-${pkgver}.zip"
		"${pkgname}"
		"${pkgname}.desktop"
		"${pkgname}.png"
		"${pkgname}.reg")

sha256sums=('928f6ef508e69aca365f92a07a1b99e68d172305420822be5e4ea1cab1704276'
            '16151e9649dc79e5d161b75c06854e2b32606bb90b2d9ce9e0e49dc14fb6acaf'
            'd588c2b2e38e12d2be3dfdd9f2a63690293b884c7df240c441e271725b9a2ca2'
            '4d33d040f772c4b1f1652b8af59342bdec600fd3de875e7ef6ee1a43fc3415cf'
            'c97cde99004dbee5cb9b05a7b6bad117e5ec63cb1032fa56efdf07a4b27e3c1d')

package() {
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m0644 "License.txt"
	install -Dt "${pkgdir}/usr/share/doc/${pkgname}" -m0644 "MicroSIP Website.url"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "hangup.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "messagein.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "messageout.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringin.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringin2.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringout.wav"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "microsip.exe"

	install -Dt "${pkgdir}/usr/bin" -m0755 "${pkgname}"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "${pkgname}.reg"
	install -Dt "${pkgdir}/usr/share/applications" -m0644 "${pkgname}.desktop"
	install -Dt "${pkgdir}/usr/share/icons/hicolor/256x256/apps" -m0644 "${pkgname}.png"
}

