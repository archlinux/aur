# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gnome-shell-extension-desk-changer-git
pkgver=27.r11.g757f533
pkgrel=1
pkgdesc="Gnome shell wallpaper changing extension with multiple profile support."
arch=(any)
url="https://github.com/BigE/desk-changer/"
license=('GPL')
depends=('gnome-shell>=3.18' 'python-gobject')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=gnome-shell-extension.install
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
# vim:set ts=2 sw=2 et:
