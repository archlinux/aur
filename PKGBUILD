# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheSillyBoi
_pkgname=wretch
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=2
pkgdesc="A simple Fetch CLI program Built with Rust"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-release-${pkgver}-linux")
sha256sums=('f12c6f6b5b0accd597242e5c91fb886d89442197119da9b96a6a96bc7de06243'
            'dc10f827056d8938fca83d3e215e738bbf2591f9cdf3e8781e632430dd5a9201'
            'f0fba33bd0c11f7f9bef5e4f929a2eb34d197497e0eedd11a988c91932b837c7')
sha256sums_x86_64=('9a4b0bba8d52dafcf22fc0a708d5b41114d7d1fc4a150dcdd60d7d86d33ddbb5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
