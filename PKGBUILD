# Maintainer: surefire@cryptomile.net

pkgname=gnome-shell-extension-quake-mode-git
pkgver=2+0+g6cc6ca7
pkgrel=1
pkgdesc='Adds support quake-mode for any application'
arch=('any')
url='https://github.com/repsac-by/gnome-shell-extension-quake-mode'
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-quake-mode')
provides=('gnome-shell-extension-quake-mode')
groups=('gnome-shell-extensions')
source=('git+https://github.com/repsac-by/gnome-shell-extension-quake-mode.git')
sha256sums=('SKIP')

pkgver() {
	cd gnome-shell-extension-quake-mode
	git describe --long --tags | sed 's/^v//;s/-/+/g'
}

build() {
	cd gnome-shell-extension-quake-mode
	glib-compile-schemas quake-mode@repsac-by.github.com/schemas/
}

package() {
	cd gnome-shell-extension-quake-mode

	install -d "$pkgdir/usr/share/gnome-shell/extensions"
	cp     -rt "$pkgdir/usr/share/gnome-shell/extensions" quake-mode@repsac-by.github.com

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
