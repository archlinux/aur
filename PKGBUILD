# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=0xjuanma
_pkgname=golazo
pkgname=${_pkgname}-bin
pkgver=0.25.0
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
            '6d85c8dbb4ae87993660f2f37dcf85a400549edb969b22e79a70067721058d85'
            'e5f43b842f617dab500772337c78cbb95429d364a5bb8b70f6e7810f1786d67f'
            '20bc01f3c8fe1dcb7cd9520771ebbcf4b22bf8b67aa1175cb836259640973570')
sha256sums_x86_64=('f31201ff6010a8d96955b44e2616ebe30fe4d2915e186eb56985d602bca4097c')
sha256sums_aarch64=('422ab2bda48d523a2329138767a0bac2e0f6f679f31008a4887bb276e233bc0d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "NOTIFICATIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/NOTIFICATIONS.md"
	install -Dm644 "SUPPORTED_LEAGUES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUPPORTED_LEAGUES.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
