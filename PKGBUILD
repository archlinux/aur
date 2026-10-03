# Maintainer: xifan <xifan2333@gmail.com>
pkgname=wayhud-bin
_pkgname=wayhud
pkgver=0.1.2
pkgrel=1
pkgdesc="Universal modern suckless Wayland on-screen HUD (GTK CSS styled)"
arch=('x86_64')
url="https://github.com/xifan2333/wayhud"
license=('MIT')
depends=('wayland' 'cairo' 'pango' 'libxkbcommon')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xifan2333/wayhud/releases/download/v0.1.2/wayhud-0.1.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0c8c473e7e63e416bda7e3f50869ad892b0a21d5fab53768f6a58bb3970a38a0')

package() {
	cd "${srcdir}/wayhud-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm4755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 man/wayhud.1 "${pkgdir}/usr/share/man/man1/wayhud.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
