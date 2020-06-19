# Maintainer: Nafis <mnabid.25@outlook.com>

_pkgname=gnome-github-notifications
pkgname=gnome-shell-extension-github-notifications-git
pkgver=r31.358c5a4
pkgrel=1
pkgdesc="Integrate Github's notifications within the GNOME desktop environment"
arch=('any')
url="https://github.com/alexduf/gnome-github-notifications"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+https://github.com/alexduf/${_pkgname}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	_uuid="github.notifications@alexandre.dufournet.gmail.com"
	mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}
	cp -r ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}
}
