# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-miniview-git
pkgver=19.0755ec4
pkgrel=1
pkgdesc="GNOME Shell plugin that shows a preview window overlay"
arch=('any')
url="https://github.com/iamlemec/miniview"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+https://github.com/iamlemec/miniview.git")
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname}

	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd ${pkgname}

    _extid="miniview@thesecretaryofwar.com"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	install -dm755 "${_extpath}"
	cp -a * "${_extpath}"
}
