# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=gittype
pkgname=${_pkgname}-bin
pkgver=0.10.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A CLI code-typing game that turns your source code into typing challenges"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'zlib' 'git')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('55e5c74ba44b9c502390384a2c2133dfc5447a6f3f4dd0736ebcd1d3825ad4ee'
            '7d3884e3483b0d8d53cd33e291b38317d9e80283030ef17a8ec3396b1d5efca7')
sha256sums_x86_64=('4811313aa3b26208c94adeeee1cd2ceff40d6de8cb1238b9b6fd676fdac14f74')
sha256sums_aarch64=('03f996f7b17b87d23f49dd87c739cd09e9922979d8705697a428769a110c5283')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
