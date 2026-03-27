# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hymkor
_pkgname=cure
pkgname=${_pkgname}-bin
pkgdesc="Color-Unicoded moRE"

pkgver=0.3.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686')
_barch=('linux-amd64' 'linux-386')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/readme.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.zip")
sha256sums=('d5cfae9b0b96305185d2656b86d33a6fc3c05e29d67917bf4854c64867debfb3'
            '343ea0833babb8750cd80b80e433cbcbd64f807313642b047952841b4817c2ed')
sha256sums_x86_64=('6d15bf00235bac7abe1e750a9479faf03d704650ffdb1812fa1a964c88f5c33d')
sha256sums_i686=('952d149f6e6df2e4c7c5051e9e3970195027f1824613af5b8ff1e1b0d2356fd5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
