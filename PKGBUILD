# Maintainer: xifan <xifan2333@gmail.com>
pkgname=ftty-bin
_pkgname=ftty
pkgver=0.4.2
pkgrel=1
pkgdesc="Ultra-lightweight minimalist Wayland terminal emulator with native Kitty graphics protocol"
arch=('x86_64')
url="https://github.com/xifan2333/ftty"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'freetype2' 'libglvnd')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xifan2333/ftty/releases/download/v0.4.2/ftty-0.4.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('487e15ea147d4ee8f9fd9405324a2003a6589646537159a85210dca1828383b9')

package() {
	cd "${srcdir}/ftty-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
