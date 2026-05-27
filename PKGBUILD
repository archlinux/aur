# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bellicose100xp
_pkgname=jiq
pkgname=${_pkgname}-ai-bin
pkgdesc="Interactive JSON query tool with real-time output and AI assistant"

pkgver=3.29.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0' 'MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-bin})
depends=('glibc' 'gcc-libs' 'jq')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('b4b6d1d75b10f30f7902a0c436dace80da39e3784d7e17007b7ff2bcb0148ba8')
sha256sums_aarch64=('4fd2918ecd9df9d1f16ef29074c659ae257b149a8c6cb2e53239c7c440587826')



package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
