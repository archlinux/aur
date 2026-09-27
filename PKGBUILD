# Maintainer: xifan <xifan2333@gmail.com>
pkgname=ftty-bin
_pkgname=ftty
pkgver=0.3.0
pkgrel=1
pkgdesc="Ultra-lightweight minimalist Wayland terminal emulator with native Kitty graphics protocol"
arch=('x86_64')
url="https://github.com/xifan2333/ftty"
license=('GPL-3.0-only')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'freetype2' 'libglvnd')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xifan2333/ftty/releases/download/v0.3.0/ftty-0.3.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6c5989cba5f0f97f8d42fcf5e8a4f8f3f45987addfa02f463a2a271d0a1e3f9f')

package() {
	cd "${srcdir}/ftty-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
