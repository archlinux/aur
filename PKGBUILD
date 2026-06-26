# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=0xjuanma
_pkgname=golazo
pkgname=${_pkgname}-bin
pkgver=0.30.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Terminal app for keeping up with live football/soccer. Check scores, match events, and stats from major leagues without leaving your terminal"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "NOTIFICATIONS-${pkgver}.md::${_urlraw}/docs/NOTIFICATIONS.md"
        "SUPPORTED_LEAGUES-${pkgver}.md::${_urlraw}/docs/SUPPORTED_LEAGUES.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('4dc0a5daa325b37f64f50f726db4dd94342dcfec49bd0fe80266a0ef59953bfa'
            '99e01ed57e52af9da49f8c5d96c7ef63e453c28626fddea8a025e01a32853e0d'
            'e5f43b842f617dab500772337c78cbb95429d364a5bb8b70f6e7810f1786d67f'
            'd1aee49dacb94346f8834e5d8c8d5e8c11d51a5843718133ca5fa0f58d562b92')
sha256sums_x86_64=('8f7ea8f0c413e95977f3c6078810d95a455f7d805cc27a4c914ceb241bc0cd1a')
sha256sums_aarch64=('f028ea180ec36f9a31d75498379d592fd83e4275ed2329aec5a96ee66ad12941')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "NOTIFICATIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/NOTIFICATIONS.md"
	install -Dm644 "SUPPORTED_LEAGUES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUPPORTED_LEAGUES.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
