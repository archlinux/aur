# Maintainer: xifan <xifan2333@gmail.com>
pkgname=wayhud-bin
_pkgname=wayhud
pkgver=0.1.3
pkgrel=1
pkgdesc="Universal modern suckless Wayland on-screen HUD (GTK CSS styled)"
arch=('x86_64')
url="https://github.com/xifan2333/wayhud"
license=('MIT')
depends=('wayland' 'cairo' 'pango' 'libxkbcommon')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xifan2333/wayhud/releases/download/v0.1.3/wayhud-0.1.3-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('130c66264214ffab1c07958d2b2fd59a52b054e0dc87cb6e2d725beec05b0c54')

package() {
	cd "${srcdir}/wayhud-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm4755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 man/wayhud.1 "${pkgdir}/usr/share/man/man1/wayhud.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
