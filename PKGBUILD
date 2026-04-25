# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pamburus
_pkgname=termframe
pkgname=${_pkgname}-bin
pkgver=0.8.4
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Convert terminal output into an SVG file"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
_clib="gnu"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'zlib')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}-${_clib}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}-${_clib}.tar.gz")
sha256sums=('ff7169dd7f49cfd2491e92944b22d3c0ffb9eb738f16d221cc3d3ce6fc839fd5'
            'c6e49bc1727eaa0b08247fab16baf90c491d2ea7a24258d01d2231ae1c2689b6')
sha256sums_x86_64=('7f6dd0f9202211d4d0c45be97fd41058b70944aff44b444fe32eb0207f679867')
sha256sums_aarch64=('5f651b970f789c0344c76d5c8e4055bb9515d3a8dd8bc1733ffc987abc057f23')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
