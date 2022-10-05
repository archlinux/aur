# Maintainer: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=0.5
pkgrel=1
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://otsaloma.io/catapult "
license=('GPL 3.0')
depends=('python' 'glib2' 'gtk3' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango')
source=("https://github.com/otsaloma/catapult/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d4dc162cc78a80a1d11d1f6f4b3e06889d1491904477ca223e5f0ad3c484587c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
