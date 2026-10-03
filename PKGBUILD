# Maintainer: xifan <xifan2333@gmail.com>
pkgname=ftty-bin
_pkgname=ftty
pkgver=0.4.4
pkgrel=1
pkgdesc="Ultra-lightweight minimalist Wayland terminal emulator with native Kitty graphics protocol"
arch=('x86_64')
url="https://github.com/xifan2333/ftty"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'freetype2' 'libglvnd')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xifan2333/ftty/releases/download/v0.4.4/ftty-0.4.4-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f336735dfae742aa3de72883aeb19622771eddd543fb1cbf68108aef9a2353d3')

package() {
	cd "${srcdir}/ftty-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 doc/ftty.1 "${pkgdir}/usr/share/man/man1/ftty.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
