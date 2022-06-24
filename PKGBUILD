# Maintainer: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=0.4.1
pkgrel=1
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://otsaloma.io/catapult "
license=('GPL 3.0')
depends=('python' 'glib2' 'gtk3' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango')
source=("https://github.com/otsaloma/catapult/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('52f537d5112b2805e08a53286276344921f8159073b9aa03d7b1c62e5fa18e2c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
