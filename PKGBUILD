# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Maintainer: Uffe Jakobsen <uffe at uffe dot org>
# Contributor: oldNo.7 <oldNo.7@archlinux.org>

pkgname=catapult
pkgver=1.2
pkgrel=1
pkgdesc="App launcher for Linux, similar to ulauncher(wayland support)"
arch=('any')
url="https://otsaloma.io/catapult "
license=('GPL-3.0-only')
makedepends=('python-setuptools')
depends=('python' 'glib2' 'gtk4' 'python-gobject' 'libkeybinder3' 'gettext' 'libqalculate' 'pango' 'python-cairo')
source=("$pkgname-$pkgver.tar.xz::https://github.com/otsaloma/catapult/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7df25751cc341e624c396aaf2673466cc0718f8786cc6eb1e077f8d0ef944aff')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    #git apply $srcdir/$pkgname.patch
    make build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr/local install
}
