# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Contributor: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=1.1
pkgrel=1
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://otsaloma.io/catapult "
license=('GPL 3.0')
makedepends=('python-setuptools')
depends=('python' 'glib2' 'gtk4' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango')
source=("https://github.com/otsaloma/catapult/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr/local install
}
