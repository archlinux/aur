# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dhth
_pkgname=tomo
pkgname=${_pkgname}-bin
pkgver=0.2.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A no-frills pomodoro progress indicator for terminal multiplexers"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('gcc-libs' 'glibc' 'alsa-lib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('72f48bc31bd31135288de128240c10dd7209057b222f3e2edcf713f2d46d76d9')


package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
