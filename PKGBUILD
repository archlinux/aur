# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gnome-shell-extension-desk-changer-git
pkgver=23.r0.g7fc9ef7
pkgrel=1
pkgdesc="Gnome shell wallpaper changing extension with multiple profile support."
arch=(any)
url="https://github.com/BigE/desk-changer/"
license=('GPL')
depends=('gnome-shell>=3.18' 'python-gobject')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=gnome-shell.install
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^version-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d $pkgdir/usr/share/gnome-shell/extensions/
	cp -a desk-changer@eric.gach.gmail.com/ $pkgdir/usr/share/gnome-shell/extensions/
}
