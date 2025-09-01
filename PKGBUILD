# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=panter-dsd
_pkgname=tatuin
pkgname=${_pkgname}-bin
pkgver=0.22.4
pkgrel=2
pkgdesc="Task Aggregator TUI for Obsidian, Todoist, Gitlab TODO and Github Issues"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'openssl')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('3f9e3e9a1af1c709e4191560ca9b3cb381f0b4c2da2646d5d00f599080682d28'
            '280d9964f19630530e728495840dc8d58fae3a3de2177a3b47508534af020fc6')
sha256sums_x86_64=('084b0db82a39d2699c6cfb0e4b0df08e4baf99a8a3f63c0265efe000b8e03952')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
