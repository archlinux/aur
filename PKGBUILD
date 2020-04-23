# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=microsip
pkgver=3.19.29
pkgrel=2
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

sha256sums=('bd9a2669f493c1f510d7a6153a072115c9d2571f441395239895c6d6535a9a55'
            'f35b60d2da37bb7d7a8a224eb8a392680824078179629d75c4f3efd3b0693980'
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

