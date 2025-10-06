# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Maintainer: Uffe Jakobsen <uffe at uffe dot org>
# Contributor: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=1.4
pkgrel=1
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://otsaloma.io/catapult "
license=('GPL-3.0-only')
makedepends=('python-setuptools')
depends=('python' 'glib2' 'gtk4' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango' 'python-cairo')
source=("$pkgname-$pkgver.tar.xz::https://github.com/otsaloma/catapult/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0b935bc221cde11cb54026ccf9fd571b04174465ca5ef41bff8332410565a50b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    #git apply $srcdir/$pkgname.patch
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr/local install
}
