# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=panter-dsd
_pkgname=tatuin
pkgname=${_pkgname}-bin
pkgver=0.22.2
pkgrel=1
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
sha256sums_x86_64=('47edb9f4291a8aab0d7a9bf3046c3308d8e19a9d331b0017caa97a76a6e0bc20')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
