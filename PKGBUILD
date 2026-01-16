# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=panter-dsd
_pkgname=tatuin
pkgname=${_pkgname}-bin
pkgver=0.26.0
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
            '9d2427a08325ee4b4aca01e70b78a212ce297a1ca2d135a7e00375fec3410f88')
sha256sums_x86_64=('908bd465e60df516ade0b9c73e1ac0a9152fc9d19015da33a92590f745d018bf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
