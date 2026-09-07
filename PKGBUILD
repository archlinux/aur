# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=0xjuanma
_pkgname=golazo
pkgname=${_pkgname}-bin
pkgver=0.33.0
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
            '8bcf8e6b79f798019407da1f35d46bd04b452271558c3ac2a2080ee9b21c9d70'
            'e5f43b842f617dab500772337c78cbb95429d364a5bb8b70f6e7810f1786d67f'
            'dab858f4b2d6e4b283524432d2b2a8834bb6e668a9c2333faacbc23e048b8c65')
sha256sums_x86_64=('7da7303d5dc35c0bdd16a191cc914cb167dc669c4383766ba3f57a71c79c30a5')
sha256sums_aarch64=('cb9705cd644aeee692b1788bd727f8db70ee04baa30aa3d5d2b83d00b28e8c23')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "NOTIFICATIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/NOTIFICATIONS.md"
	install -Dm644 "SUPPORTED_LEAGUES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SUPPORTED_LEAGUES.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
