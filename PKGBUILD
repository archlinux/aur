# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=albertoboccolini
_pkgname=sqd
pkgname=${_pkgname}-bin
pkgdesc="A SQL-like document editor"

pkgver=0.0.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums=('859eb190b73b79fb7ff00b19bec989abe222efe8127df15c5bf857fdbbd61abe'
            '125c9c7dbd503cf595b0c5a5b24ffaccbbbaaa54fe3587235656309ad7cfa69c')
sha256sums_x86_64=('dbe92d293979ddea367c78140bdf45d890f448e7be75a136a0eb53c3db9e0b2c')
sha256sums_aarch64=('664d3b9d45b46d4c4f90f9d85733e69928e05f4c5cce9c9b46ecd005630a373d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
