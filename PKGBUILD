# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=panter-dsd
_pkgname=tatuin
pkgname=${_pkgname}-bin
pkgver=0.25.2
pkgrel=1
pkgdesc="Task Aggregator TUI for Obsidian, Todoist, Gitlab TODO and Github Issues"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
_stdlib=gnu
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-Linux-${_stdlib}-${arch[0]}.tar.gz")
sha256sums=('3f9e3e9a1af1c709e4191560ca9b3cb381f0b4c2da2646d5d00f599080682d28'
            '62c14d9e958517393c65f37f78ca5b8f891bb2d9c41784b22364af48deba1c2b')
sha256sums_x86_64=('5149b89358c4866e3ff139d741f5007ced6268b02b81a89a7cad46939cda0048')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
