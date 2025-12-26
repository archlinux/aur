# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=sixteen
pkgname=${_pkgname}-bin
pkgver=0.6.3
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
            '70b072779777bd93b7894a7026cb3f2f2e3e11f11413e9c3b027ec4f3cc8e0a4')
sha256sums_x86_64=('e74484fbef79d27c16d1f9df52812183607028a327de4fcf1a5eec18bfb6d5cd')
sha256sums_aarch64=('8005be38275370e1cc977a0f081b2c3704890943d5a102fb9aed5f4eb0717278')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
