# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=microsip
pkgver=3.22.3
pkgrel=2
_wrapperver=1.3
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
arch=(x86_64)
url=https://www.microsip.org
license=(GPL-2.0-or-later)

source=("MicroSIP-Lite-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-Lite-${pkgver}.zip"
		"microsip-${_wrapperver}.tar.gz"::"https://codeberg.org/pf-graveyard/microsip/archive/v${_wrapperver}.tar.gz")

sha256sums=('ef49f608e03019f3ebc274c25228b286ff41b963202c1e8ec82570290884fa8f'
            'a956fc39e86c01738fd9d1a9d51538c438fcbfbd3258caee68e03ec7cf78511b')

package() {
	depends=(wine libpulse)

	install -Dt "${pkgdir}"/usr/share/doc/microsip -m0644 MicroSIP.url
	install -Dt "${pkgdir}"/usr/share/microsip -m0644 {hangup,msgin,msgout,ringing,ringing2,ringtone}.wav
	install -Dt "${pkgdir}"/usr/lib/microsip -m0644 lame_enc.dll

	install -Dt "${pkgdir}"/usr/lib/microsip -m0644 microsip.exe

	install -Dt "${pkgdir}"/usr/bin -m0755 microsip/microsip
	install -Dt "${pkgdir}"/usr/share/microsip -m0644 microsip/microsip.reg
	install -Dt "${pkgdir}"/usr/share/applications -m0644 microsip/microsip.desktop
	install -Dt "${pkgdir}"/usr/share/icons/hicolor/256x256/apps -m0644 microsip/microsip.png
}
