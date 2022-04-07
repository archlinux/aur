# Maintainer: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=3.2
pkgrel=1
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://github.com/otsaloma/catapult.git"
license=('GPL 3.0')
depends=('python' 'glib2' 'gtk3' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango')
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	make build
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
