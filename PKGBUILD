# Maintainer: Shiba
pkgname=gnome-shell-extension-add-on-desktop-git
pkgver=r7.8651303
pkgrel=1
pkgdesc="GNOME Shell extension to add applications launcher on your desktop"
arch=('any')
url="https://github.com/maoschanz/gnome-shell-extension-add-on-desktop"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/maoschanz/gnome-shell-extension-add-on-desktop.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	_extid='add-on-desktop@maestroschan.fr'
	cd "$srcdir/${pkgname%-git}"

	install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
	cp -R convenience.js extension.js metadata.json locale/ "${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"
}
