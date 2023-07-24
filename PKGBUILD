# Maintainer: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=0.9
pkgrel=1
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://otsaloma.io/catapult "
license=('GPL 3.0')
makedepends=('python-setuptools')
depends=('python' 'glib2' 'gtk3' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango')
source=("https://github.com/otsaloma/catapult/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f6c89b68e1e51c065d5244276bd7dae01375452e11ea528081de57ec0d564c59')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
