# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-screenshot-git
pkgver=r150.6b67d49
pkgrel=2
pkgdesc="Gnome Shell extension for making and uploading screenshots"
arch=('any')
url="https://github.com/OttoAllmendinger/gnome-shell-screenshot"
license=('MIT')
depends=('gnome-shell')
makedepends=('git' 'zip' 'eslint')
source=("${pkgname}::git+https://github.com/OttoAllmendinger/gnome-shell-screenshot.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

	_extid="gnome-shell-screenshot@ttll.de"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	make EXTENSION_PATH="${_extpath}" install
}
