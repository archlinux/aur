# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=drawing
pkgver=0.2
pkgrel=1
pkgdesc="Drawing application for the GNOME desktop"
url="https://github.com/maoschanz/drawing"
arch=(any)
license=(GPL)
depends=(gtk3 python)
makedepends=(meson python)
provides=(com.github.maoschanz.Drawing)
source=("https://github.com/maoschanz/drawing/archive/${pkgver}.tar.gz")
sha256sums=('83873fcda8102f51c9e5ecd17e95086d0e9ac8196bcf9e202d6e30c0c926fa35')

build() {
    arch-meson drawing-${pkgver} build
    ninja -C build
}

#check() {
#    meson test -C build
#}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
