# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pamburus
_pkgname=termframe
pkgname=${_pkgname}-bin
pkgver=0.10.2
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
sha256sums_x86_64=('f2aa448493f737e61e59d5c4fc858b95ca8155bf40aee950100d0421bcfaca7c')
sha256sums_aarch64=('cbaaefca03f75abf1972ac753babbce885858adde226ab8a4608e15d2e5c5f11')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
