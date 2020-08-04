# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=microsip
pkgver=3.20.0
pkgrel=1
pkgdesc="Open source portable SIP softphone for Windows based on PJSIP stack"
_repouser=post-factum
_reponame=microsip
_wrapperver=1.0
arch=(x86_64)
url="https://www.microsip.org/"
license=(GPL2)
depends=(wine lib32-libpulse xorg-xdpyinfo)
conflicts=(wine-staging)

source=("MicroSIP-Lite-${pkgver}.zip"::"https://www.microsip.org/downloads/?file=MicroSIP-Lite-${pkgver}.zip"
		"${_reponame}-${_wrapperver}.tar.bz2"::"https://gitlab.com/${_repouser}/${_reponame}/-/archive/v${_wrapperver}/${_reponame}-v${_wrapperver}.tar.bz2")

sha256sums=('da028d90b8e53871257025f85943d5debcd0532ae3b807f71af3cd5a89cb1fc5'
            '760c5ad743af3157c20c644f3af90b99b46097de1dbc8b2f8c025de9d2dd7205')

package() {
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m0644 "License.txt"
	install -Dt "${pkgdir}/usr/share/doc/${pkgname}" -m0644 "MicroSIP Website.url"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "hangup.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "msgin.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "msgout.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringing.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringing2.wav"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "ringtone.wav"
	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "lame_enc.dll"

	install -Dt "${pkgdir}/usr/lib/${pkgname}" -m0644 "microsip.exe"

	install -Dt "${pkgdir}/usr/bin" -m0755 "${_reponame}-v${_wrapperver}/${pkgname}"
	install -Dt "${pkgdir}/usr/share/${pkgname}" -m0644 "${_reponame}-v${_wrapperver}/${pkgname}.reg"
	install -Dt "${pkgdir}/usr/share/applications" -m0644 "${_reponame}-v${_wrapperver}/${pkgname}.desktop"
	install -Dt "${pkgdir}/usr/share/icons/hicolor/256x256/apps" -m0644 "${_reponame}-v${_wrapperver}/${pkgname}.png"
}

