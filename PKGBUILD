# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hjson
_pkgname=hjson-go
pkgname=${_pkgname%-go}-cli-bin
pkgver=4.6.0
pkgrel=1
pkgdesc="Hjson in Go"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname%-go}_v${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname%-go}_v${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname%-go}_v${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums=('a3b3d309b774913dafd47225c1c6bbed1b23aa1780ca1cc89ea1bad0d82cf7b1'
            '1efa3b9ddaa20f92cc14028302b104bf90962656bd17b23cfe06cb5813433789')
sha256sums_x86_64=('cdd496a8d3eb5f90c621d3b0b03219d5d713e4b4077a41dd6feed86e4622befe')
sha256sums_i686=('b5a8351bc0e7abe64b6e186dd6bccc1dbcfa6ff37734720586f31a39b3ec3d9b')
sha256sums_aarch64=('6da0b43c71436e73562f4d1b129ead9a3808442e1aa91fd071bde7767450b687')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${pkgname%-cli-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
