# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-extensions-in-system-menu-git
_pkgname=extensions-in-system-menu
pkgver=r12.e9fc3e7
pkgrel=1
pkgdesc="Adds menu items to the system menu for the Extensions or the Tweaks app"
arch=('any')
url="https://github.com/Leleat/extensions-in-system-menu"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Leleat/extensions-in-system-menu.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	_uuid='extensions-in-system-menu@leleat-on-github'

	install -d "$pkgdir/usr/share/gnome-shell/extensions"
	cp -r "$_uuid" "$pkgdir/usr/share/gnome-shell/extensions"
}
