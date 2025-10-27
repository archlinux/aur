# AUR Maintainer: shadichy <shadichy@blisslabs.org>
_pkg=ibus-lotus
pkgname=${_pkg}-bin
pkgver=1.0.2
pkgrel=1
_upver=1.0.2
pkgdesc="A Vietnamese IME for IBus - fork of ibus-bamboo"
arch=(any)
license=('GPL3')
url=https://github.com/LotusInputEngine/$_pkg
depends=('ibus')
optdepends=(
	'kdotool: for switching modes on KDE Plasma'
	'gnome-shell-extension-window-calls-extended: for switching modes on GNOME Shell'
)
makedepends=('bash')
conflicts=('ibus-bamboo-git' 'ibus-bamboo' 'ibus-lotus-git' 'ibus-lotus')
provides=('ibus-lotus')
source=("${_pkg}-${_upver}.zip::$url/releases/latest/download/${_pkg}-${_upver}.zip")
sha256sums=('08915ed241be90e49eb1e5c2506052a0d6f9cfdf63207b7ca2dff207b5b0a77f')

package() {
	cd "${_pkg}-${_upver}"
	env DESTDIR="$pkgdir" bash ./install
}
