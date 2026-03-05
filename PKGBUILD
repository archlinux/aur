# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pamburus
_pkgname=termframe
pkgname=${_pkgname}-bin
pkgver=0.8.2
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
sha256sums_x86_64=('ee7b6b7233b498d902e364d8ef8da170bd75f4f57a38de8436f91db5d105dc02')
sha256sums_aarch64=('76f52859ddc7a15a2bd8256280858025c2f80de4971fcbcce0cedd48e8801dc9')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
