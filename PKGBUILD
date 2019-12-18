# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-screenshot-git
pkgver=r158.a12a8f2
pkgrel=1
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
