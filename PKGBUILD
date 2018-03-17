# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-mmod-panel-git
_gitname=mmod-panel
pkgver=45.297c654
pkgrel=1
pkgdesc="Create a customizable panel for Gnome 3"
arch=('any')
url="https://github.com/cyberlis/mmod-panel"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/cyberlis/mmod-panel.git')
sha256sums=('SKIP')

pkgver() {
	cd $_gitname

	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd $_gitname

    _extid="mmod-panel@mmogp.com"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	install -dm755 "${_extpath}"
	cp -a * "${_extpath}"
}
