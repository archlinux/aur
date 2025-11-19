# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=crycco
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A literate programming tool"
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
sha256sums=('91c5a6fc53adf00971f7b4851ae27b91291e470a67f2474d00c965d05dc7d286'
            'ceaf8c21a688ce15b2575e4dbb0fa8a6b210720aa71596b004e18d4137a626c7'
            '08252fe65a458b0f5c61b2c4499ff8e41fdfd042033ccca80c3adab708815387')
sha256sums_x86_64=('4ad7cd4201b7d9a4462a38d92fbb2e362c8e39193ef46566c8913b12fe3371f5')
sha256sums_aarch64=('293ca85bb8befd5c97414f2a46ad4ded40803c3c283dba782422109092e770de')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
