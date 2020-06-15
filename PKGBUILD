# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.1.6
pkgrel=1
pkgdesc="Phone dialer and call handler"
arch=(i686 x86_64 armv7h aarch64)
url="https://source.puri.sm/Librem5/calls"
license=(GPL3)
depends=(feedbackd
         folks
         gom
         libhandy
         libpeas
         modemmanager)
makedepends=(gobject-introspection
             meson
             vala)
source=("https://source.puri.sm/Librem5/calls/-/archive/v${pkgver}/calls-v${pkgver}.tar.gz")
sha256sums=('d92f993409e9247b377a40ebbd681bd1302bcd4cb7d476625bba00b5595574e7')


build() {
    arch-meson calls-v${pkgver} build -Dtests=false
    ninja -C build
}

# check() {
#     ninja -C build test
# }

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
