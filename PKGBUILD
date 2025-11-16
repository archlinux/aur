# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kxxt
_pkgname=cargo-visualize
pkgname=${_pkgname}-bin
pkgver=2.2.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Know your dependencies via interactive cargo dependency graph visualization"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0-or-later')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('9562f7ebafb7aa2273a542efd4729779d580ff36d6f6cce9e66877c458ae5859')
sha256sums_aarch64=('bf5789124b141685ada54defa8d70a0f70948a7d9fbd17576332c2bc854a8cb7')


package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
