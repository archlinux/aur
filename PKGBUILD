# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-mmod-panel-git
_gitname=mmod-panel
pkgver=r40.40a58cd
pkgrel=2
pkgdesc="Create a customizable panel for Gnome 3"
arch=('any')
url="https://github.com/RyanGipson/mmod-panel"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/RyanGipson/mmod-panel.git')
sha256sums=('SKIP')

pkgver() {
	cd $_gitname

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_gitname

    _extid="mmod-panel@mmogp.com"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	install -dm755 "${_extpath}"
	cp -a * "${_extpath}"
}
