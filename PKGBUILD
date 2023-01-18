# Maintainer: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=0.6
pkgrel=1
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://otsaloma.io/catapult "
license=('GPL 3.0')
makedepends=('python-setuptools')
depends=('python' 'glib2' 'gtk3' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango')
source=("https://github.com/otsaloma/catapult/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('94c7c2864683109591883fbf775f4ff445d101eb4dcd0334d097f75b46df27a1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
