# Maintainer: Mark Wagie <mark.wagie at tutanota dot com>
pkgname=sticky-git
pkgver=1.0.r0.g82db5a5
pkgrel=1
pkgdesc="A sticky notes app for the Linux desktop"
arch=('any')
url="https://github.com/collinss/sticky"
license=('GPL')
depends=('gtk3' 'xapps' 'gspell' 'python-gobject' 'python-xapp')
makedepends=('git')
optdepends=('libappindicator-gtk3: for tray icon')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/collinss/sticky.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cp -r etc usr "$pkgdir"
	chmod +x "$pkgdir/usr/bin/${pkgname%-git}"
}
