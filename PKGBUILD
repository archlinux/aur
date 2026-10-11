# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=markterm
pkgname=${_pkgname}-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="A terminal markdown renderer"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('dbbffa23a676d422aa7460b468c731e4fe3a007414e14d787a3d3f3fb55b1713'
            '558aeb63b4e769b87b14ab81b47c315cee92ee5de5a5bb00c82d74c4f4a77fd5'
            '6fd5eeb509f743c9b383e4c5577abbfa5be0a44bd8f72ccaccd042dcf6585e56')
sha256sums_x86_64=('00ff49928b7ea77b26579505305f936976b32cdabd2a80dab829210b20559956')
sha256sums_aarch64=('668b02e211107d4f6e67a155240db484ea112d5ba801139eda9554417569f782')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
