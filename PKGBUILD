# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pamburus
_pkgname=termframe
pkgname=${_pkgname}-bin
pkgver=0.7.7
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
            'd673fce84c24d313f19ac91d85c26aa6158db084140422d7c0b7ac2fdd5b0d5f')
sha256sums_x86_64=('ab1729efd63e97519acbdd4eaf06b295ea2f3389bd0d6ccd48a828d2e8c9affc')
sha256sums_aarch64=('28c82d1456dea1e738de3a08411b740067f316d847862ac7f1cfc33690596b0e')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
