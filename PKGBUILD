# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.1.1
pkgrel=1
pkgdesc="Phone dialer and call handler"
arch=(i686 x86_64 armv6h armv7h)
url="https://source.puri.sm/Librem5/calls"
license=(GPL3)
depends=(folks
         gom
         gsound
         libhandy
         libpeas
         modemmanager)
makedepends=(gobject-introspection
             meson
             vala)
source=("https://source.puri.sm/Librem5/calls/-/archive/v${pkgver}/calls-v${pkgver}.tar.gz")
sha256sums=('f0f574e92368664a4dd9dff9521dfa7245b736206d9f95a0c00f5786a862c9cf')

build() {
    arch-meson calls-v${pkgver} build
    ninja -C build
}

# check() {
#     ninja -C build test
# }

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
