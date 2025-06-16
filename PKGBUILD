# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=microsip
pkgver=3.21.6
pkgrel=3
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
_repouser=post-factum
_reponame=microsip
_wrapperver=1.2
arch=(x86_64)
url=https://www.microsip.org
license=(GPL-2.0-or-later)

source=("MicroSIP-Lite-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-Lite-${pkgver}.zip"
		"${_reponame}-${_wrapperver}.tar.gz"::"https://codeberg.org/${_repouser}/${_reponame}/archive/v${_wrapperver}.tar.gz")

sha256sums=('25f081cb0850d245d3fa79f3e7273404be26a1aadfe80e2229b7f072f84d5d7c'
            'f1d2bd0fb7e017f477e1c7e191d0e4c8185e335d5a0e3fdfe8046c9e98a3a3e0')

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
