# Maintainer: ynnsn
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=microsip
pkgver=3.22.9
pkgrel=3
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
arch=(x86_64)
url=https://www.microsip.org
license=(GPL-2.0-or-later)

source=("MicroSIP-Lite-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-Lite-${pkgver}.zip"
				"microsip"
				"microsip.desktop"
				"microsip.png"
				"microsip.reg")

sha256sums=('eeb3b4939015a1caa9e168583ca5f14956684c48f247c3fa2e04a093fe9541ec'
            '1281b272d173d9ade5f31915804fbb953f61425c0b303af6c097332fbb240a2c'
            '3e505193aba33ca68d9ca0e64624ae0dfe415a6b7e1252b11aaf45d4628f72bf'
            '4d33d040f772c4b1f1652b8af59342bdec600fd3de875e7ef6ee1a43fc3415cf'
            'c97cde99004dbee5cb9b05a7b6bad117e5ec63cb1032fa56efdf07a4b27e3c1d')

package() {
	depends=('wine' 'libpulse')

	install -Dt "${pkgdir}"/usr/share/doc/microsip -m0644 MicroSIP.url
	install -Dt "${pkgdir}"/usr/share/microsip -m0644 {hangup,msgin,msgout,ringing,ringing2,ringtone}.wav
	install -Dt "${pkgdir}"/usr/lib/microsip -m0644 lame_enc.dll
	install -Dm0644 "MicroSIP.exe" "${pkgdir}/usr/lib/microsip/microsip.exe"
	install -Dt "${pkgdir}"/usr/bin -m0755 microsip
	install -Dt "${pkgdir}"/usr/share/microsip -m0644 microsip.reg
	install -Dt "${pkgdir}"/usr/share/applications -m0644 microsip.desktop
	install -Dt "${pkgdir}"/usr/share/icons/hicolor/256x256/apps -m0644 microsip.png
}
