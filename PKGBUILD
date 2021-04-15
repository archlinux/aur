# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-gnome-ui-tune-git
pkgver=1.1.0.r1.g8b0b758
pkgrel=1
pkgdesc="Tunes the overview UI of GNOME 40"
arch=('any')
url="https://github.com/axxapy/gnome-ui-tune"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/axxapy/gnome-ui-tune.git')
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/gnome-ui-tune
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $srcdir/gnome-ui-tune
	_uuid='gnome-ui-tune@itstime.tech'

	install -Dm644 *.js *.json -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
