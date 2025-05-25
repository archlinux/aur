# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheSillyBoi
_pkgname=wretch
pkgname=${_pkgname}-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-release-${pkgver}-linux")
sha256sums=('f12c6f6b5b0accd597242e5c91fb886d89442197119da9b96a6a96bc7de06243'
            '5345462cedb10b66c9e9a1e1e6c769305ab08d70d21e16c0eb9117a5db779d0d')
sha256sums_x86_64=('61667bcaa7ab1b98982ddf5ea880b26aa144b81a745320e956dbe04cba0c1d48')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
