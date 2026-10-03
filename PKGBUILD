# Maintainer: xifan <xifan2333@gmail.com>
pkgname=wayhud-bin
_pkgname=wayhud
pkgver=0.1.0
pkgrel=1
pkgdesc="Universal modern suckless Wayland on-screen HUD (GTK CSS styled)"
arch=('x86_64')
url="https://github.com/xifan2333/wayhud"
license=('MIT')
depends=('wayland' 'cairo' 'pango' 'libxkbcommon')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xifan2333/wayhud/releases/download/v0.1.0/wayhud-0.1.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b63776b16bba7b0bb5d34368037946fd6abbed025af99d5daf515438ac86c0e0')

package() {
	cd "${srcdir}/wayhud-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 man/wayhud.1 "${pkgdir}/usr/share/man/man1/wayhud.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
