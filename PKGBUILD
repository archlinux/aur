# Maintainer: Jerry Chanut <j.chanut@gmail.com>
pkgname=gnome-shell-extension-unblank-git
pkgver=7a9a146
pkgrel=1
pkgdesc="Unblank screen when screen saver becomes active."
arch=(any)
url="https://github.com/sunwxg/gnome-shell-extension-unblank"
license=('MIT')
depends=('gnome-shell>=3.26')
makedepends=('git')
provides=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')
_extname="unblank@sun.wxg@gmail.com"

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --always | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="${pkgdir}" install
}
