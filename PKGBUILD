# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bellicose100xp
_pkgname=jiq
pkgname=${_pkgname}-ai-bin
pkgdesc="Interactive JSON query tool with real-time output and AI assistant"

pkgver=3.31.2
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
sha256sums_x86_64=('6883215578eff60163b63fe68009a8098156d36d04b3aa56eee1375da2790241')
sha256sums_aarch64=('2054ebcdd0cf0168d8b51c0292f29155cda8a2655e459bbb5ca272d1a0804b45')



package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
