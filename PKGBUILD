# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=shipments
pkgver=0.3.0
pkgrel=1
pkgdesc="A GTK3 mobile/desktop application for tracking multiple shipments"
arch=('any')
url="https://git.sr.ht/~martijnbraam/shipments"
license=('GPLv3')
groups=()
depends=('python-gobject')
makedepends=('git' 'meson')
optdepends=()
source=("shipments::git+https://git.sr.ht/~martijnbraam/shipments#tag=$pkgver")
sha256sums=('SKIP')

check() {
	meson test -C build
}


build() {
	arch-meson $srcdir/$pkgname build
	meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
