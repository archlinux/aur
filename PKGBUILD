# AUR Maintainer: shadichy <shadichy@blisslabs.org>
pkgname=ibus-lotus
pkgver=1.0.2
pkgrel=1
_ver=1.0.2
_upstream_ver=v1.0.2
pkgdesc="A Vietnamese IME for IBus - fork of ibus-bamboo"
arch=(any)
license=('GPL3')
url=https://github.com/LotusInputEngine/$pkgname
depends=('ibus')
optdepends=(
	'kdotool: for switching modes on KDE Plasma'
	'gnome-shell-extension-window-calls-extended: for switching modes on GNOME Shell'
)
makedepends=('go' 'gtk3' 'libx11' 'libxtst')
conflicts=('ibus-bamboo-git' 'ibus-bamboo' 'ibus-lotus-git' 'ibus-lotus-bin')
provides=('ibus-lotus')
source=("${pkgname}-${_ver}.tar.gz::${url}/archive/${_upstream_ver}.tar.gz")
sha256sums=('a15b7febdb5b3f0280ffc4efbfab4d3e55db135f0be860660735bc641a1710e4')

build() {
	cd "${pkgname}-${_ver}"
	make
}

package() {
	cd "${pkgname}-${_ver}"
	make DESTDIR="$pkgdir/" install
}
