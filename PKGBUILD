# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.0.1
pkgrel=1
pkgdesc="A phone dialer and call handler."
arch=(i686 x86_64 armv6h armv7h)
url="https://source.puri.sm/Librem5/calls"
license=(GPL3)
depends=(gsound
         libhandy
         libpeas
         modemmanager)
makedepends=()
source=("https://source.puri.sm/Librem5/calls/-/archive/v${pkgver}/calls-v${pkgver}.tar.gz")
sha256sums=(SKIP)

build() {
    rm -rf build
    arch-meson calls-v${pkgver} build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
