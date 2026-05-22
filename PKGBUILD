# Maintainer: Nirvam <marvinbeeblebrox at gmail dot com>

pkgname=ashell-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A ready to go Wayland status bar for Hyprland and Niri"
url="https://github.com/MalpenZibo/ashell"
license=("MIT")
provides=("ashell")
conflicts=("ashell" "ashell-git")
depends=(
	"libxkbcommon"
	"wayland"
	"dbus"
	"libpipewire"
	"libpulse"
)
optdepends=(
	"hyprland"
	"niri"
)
arch=("x86_64")
install="${pkgname}.install"
options=(!strip)
source=(
	"ashell-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/ashell-x86_64-unknown-linux-gnu.tar.xz"
	"ashell.service"
)
sha512sums=('8676cb46e4efe420b39888038c5ade73b2ec9eec1cf44019ccf9efdd3180e34df10a5e508876e17909c2d89786ea4c5c19bbe23e1b545b92f43153db7d14a5a0'
	'dd4488aeef3bc08a82882dd69c2b470c407fa7440abb86ed79e883cc8a5e8621292861d221ee42b2ca130ecc0155660663ce41faacbf5576bbbe986189cb6287')

package() {
	_output="${srcdir}/ashell-x86_64-unknown-linux-gnu"
	install -Dm0755 "${_output}/ashell" "${pkgdir}/usr/bin/ashell"
	install -Dm0644 "${_output}/LICENSE" "${pkgdir}/usr/share/licenses/ashell/LICENSE"
	install -Dm0644 "${_output}/README.md" "${pkgdir}/usr/share/doc/ashell/README.md"
	install -Dm0644 "${srcdir}/ashell.service" "${pkgdir}/usr/lib/systemd/user/ashell.service"
}
