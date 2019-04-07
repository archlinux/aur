# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=unifydmin
pkgver=0.1.1
pkgrel=1
pkgdesc="Unified administration panel for heterogeneous Linux servers"
url="https://gitlab.com/gabmus/unifydmin"
arch=(any)
license=(GPL)
depends=(gtk3 fabric)
makedepends=(meson python)
provides=(org.gabmus.unifydmin)
source=("https://gitlab.com/gabmus/unifydmin/-/archive/${pkgver}/unifydmin-${pkgver}.tar.gz")
sha256sums=('ccf239795bc2df2ece4f265a27e7d181184fe3eaff3efc36c831862ddf41c1d8')

build() {
    arch-meson unifydmin-${pkgver} build
    ninja -C build
}

check() {
    meson test -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
