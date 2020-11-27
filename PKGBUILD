# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-disconnect-wifi-git
pkgver=26.r0.g7281cf1
pkgrel=1
pkgdesc="Adds a disconnect option for Wifi in status menu"
arch=('any')
url="https://github.com/kgshank/gse-disconnect-wifi"
license=('GPL')
depends=('gnome-shell')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/kgshank/gse-disconnect-wifi.git')
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/gse-disconnect-wifi
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	_uuid='disconnect-wifi@kgshank.net'

	cd $srcdir/gse-disconnect-wifi/$_uuid
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	cp -r * "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
