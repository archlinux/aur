# Maintainer: xifan <xifan2333@gmail.com>
pkgname=ftty-bin
_pkgname=ftty
pkgver=0.4.5
pkgrel=1
pkgdesc="Ultra-lightweight minimalist Wayland terminal emulator with native Kitty graphics protocol"
arch=('x86_64')
url="https://github.com/xifan2333/ftty"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'freetype2' 'libglvnd')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xifan2333/ftty/releases/download/v0.4.5/ftty-0.4.5-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a94d886fc6a0f122880342e88b84f330faa2a7b4c16cd7ad837d5eebc592fc9b')

package() {
	cd "${srcdir}/ftty-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 doc/ftty.1 "${pkgdir}/usr/share/man/man1/ftty.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
