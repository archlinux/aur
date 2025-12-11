# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=sixteen
pkgname=${_pkgname}-bin
pkgver=0.6.2
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
            '6d356fd59f9d73e72e01302c5736e29d884e35ec6e62f95482fb71db320e9879')
sha256sums_x86_64=('8c543fd472c122bfce0cc2012c160afd4eaf219286a07d7e2b89fb25c0b5d7d8')
sha256sums_aarch64=('ace8feeb14bdc94bb615cecdd818f9a28f6d24ea5595ab5a2588142008fb921a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
