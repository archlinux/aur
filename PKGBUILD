# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-mmod-panel-git
pkgver=0.1.4.r28.g40a58cd
pkgrel=1
pkgdesc="Create a customizable panel for Gnome 3"
arch=('any')
url="https://github.com/RyanGipson/mmod-panel.git"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
	cd "${srcdir}/${pkgname}"

    _extid="mmod-panel@mmogp.com"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	install -dm755 "${_extpath}"
	cp -a * "${_extpath}"
}
