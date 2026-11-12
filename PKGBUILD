# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=meowrain
_pkgname=localsend-go
pkgname=${_pkgname}-bin
pkgver=1.3.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="CLI implementation of LocalSend protocol in Go"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('28621f9484984c64ca4c97486ba7edc4aaee3e23cc602279de073cf252289d72'
            '7326ff7a39e63d2a101fa5969b44086d0f4e62c31aff7e26819d56144e8928e2')
sha256sums_x86_64=('6765b4e45f82be8887a00ff08d048337b78c55dcbeb9d5a6c5cf9774c5116744')
sha256sums_aarch64=('ae5c3fa06aae4904980c8e7c3de3457e82a91565da673eec1cbe4ff9c0163ae0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
