# Maintainer: Jerry Chanut <j.chanut@gmail.com>
pkgname=gnome-shell-extension-unblank-git
pkgver=r49.02c0920
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="${pkgdir}" install
}
