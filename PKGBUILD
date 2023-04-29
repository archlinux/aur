# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-miniview-git
pkgver=r98.7ad154b
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
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

	_extid="miniview@thesecretaryofwar.com"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	install -dm755 "${_extpath}"
	cp -a * "${_extpath}"
}
