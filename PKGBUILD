# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.1.4
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
sha256sums=('3754256173a6a77a79c55cf5ae6887965ba972e0a95006e622e4cc488631e3a2')

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
