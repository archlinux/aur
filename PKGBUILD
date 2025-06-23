# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=microsip
pkgver=3.21.6
pkgrel=4
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
_repouser=post-factum
_reponame=microsip
_wrapperver=1.3
arch=(x86_64)
url=https://www.microsip.org
license=(GPL-2.0-or-later)

source=("MicroSIP-Lite-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-Lite-${pkgver}.zip"
		"${_reponame}-${_wrapperver}.tar.gz"::"https://codeberg.org/${_repouser}/${_reponame}/archive/v${_wrapperver}.tar.gz")

sha256sums=('25f081cb0850d245d3fa79f3e7273404be26a1aadfe80e2229b7f072f84d5d7c'
            'a956fc39e86c01738fd9d1a9d51538c438fcbfbd3258caee68e03ec7cf78511b')

package() {
	depends=(wine libpulse)

	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 License.txt
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 MicroSIP.url
	install -Dt "${pkgdir}"/usr/share/${pkgname} -m0644 hangup.wav
	install -Dt "${pkgdir}"/usr/share/${pkgname} -m0644 msgin.wav
	install -Dt "${pkgdir}"/usr/share/${pkgname} -m0644 msgout.wav
	install -Dt "${pkgdir}"/usr/share/${pkgname} -m0644 ringing.wav
	install -Dt "${pkgdir}"/usr/share/${pkgname} -m0644 ringing2.wav
	install -Dt "${pkgdir}"/usr/share/${pkgname} -m0644 ringtone.wav
	install -Dt "${pkgdir}"/usr/lib/${pkgname} -m0644 lame_enc.dll

	install -Dt "${pkgdir}"/usr/lib/${pkgname} -m0644 microsip.exe

	install -Dt "${pkgdir}"/usr/bin -m0755 ${_reponame}/${pkgname}
	install -Dt "${pkgdir}"/usr/share/${pkgname} -m0644 ${_reponame}/${pkgname}.reg
	install -Dt "${pkgdir}"/usr/share/applications -m0644 ${_reponame}/${pkgname}.desktop
	install -Dt "${pkgdir}"/usr/share/icons/hicolor/256x256/apps -m0644 ${_reponame}/${pkgname}.png
}
