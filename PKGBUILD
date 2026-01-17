# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=sixteen
pkgname=${_pkgname}-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A base16 theme browser"
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
            '788ac7f953fe904bfaa3ee91eb0a8de4406fb79f44fad2b42f6f9eb002212ef8'
            'c1472fc2e63d73d0863b6899ce0cdde4a5d8b798da35230521d39058c3f59c04')
sha256sums_x86_64=('11d3765df5b6ea7a2ab84f1b1a76aa04547190de82190ce583442da12c217afe')
sha256sums_aarch64=('f4140457055112d6c784087fd0f4ae6fa4dc48b3364990ccf93dc6ced11ca4f6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
