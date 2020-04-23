# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.9.0
pkgrel=2
pkgdesc="Virtual keyboard supporting Wayland, built primarily for the Librem 5 phone"
url="https://source.puri.sm/Librem5/squeekboard"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=('gnome-desktop'
         'python')
makedepends=('pkg-config'
             'meson'
             'intltool'
             'rust'
             'gtk-doc')
source=("https://source.puri.sm/Librem5/squeekboard/-/archive/v${pkgver}/squeekboard-v${pkgver}.tar.gz")
sha256sums=('SKIP')


build() {
    arch-meson "squeekboard-v${pkgver}" build -Dtests=false
    ninja -C build
}

# check() {
#     ninja -C build test
# }

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
