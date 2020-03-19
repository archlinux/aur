# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=microsip
pkgver=3.19.28
pkgrel=1
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
arch=(x86_64)
url="https://www.microsip.org/"
license=(GPL2)
depends=(wine lib32-libpulse xorg-xdpyinfo)
conflicts=(wine-staging)

source=("MicroSIP-Lite-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-Lite-${pkgver}.zip"
		"${pkgname}"
		"${pkgname}.desktop"
		"${pkgname}.png"
		"${pkgname}.reg")

sha256sums=('c8795cef6c2eca12524b8f821e4137cf7e811534877ab6c416af91ed603d7773'
            'e909ea376443dab9824f1efe7f838fe63833526c51a694c010c868e371a97ea4'
            'd588c2b2e38e12d2be3dfdd9f2a63690293b884c7df240c441e271725b9a2ca2'
            '4d33d040f772c4b1f1652b8af59342bdec600fd3de875e7ef6ee1a43fc3415cf'
            'c97cde99004dbee5cb9b05a7b6bad117e5ec63cb1032fa56efdf07a4b27e3c1d')

package() {
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m0644 "License.txt"
	install -Dt "${pkgdir}/usr/share/doc/${pkgname}" -m0644 "MicroSIP Website.url"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "hangup.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "msgin.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "msgout.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringing.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringing2.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringtone.wav"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "microsip.exe"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "lame_enc.dll"

	install -Dt "${pkgdir}/usr/bin" -m0755 "${pkgname}"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "${pkgname}.reg"
	install -Dt "${pkgdir}/usr/share/applications" -m0644 "${pkgname}.desktop"
	install -Dt "${pkgdir}/usr/share/icons/hicolor/256x256/apps" -m0644 "${pkgname}.png"
}

