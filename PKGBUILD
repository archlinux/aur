# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.10.0
pkgrel=1
pkgdesc="Virtual keyboard supporting Wayland, built primarily for the Librem 5 phone"
url="https://source.puri.sm/Librem5/squeekboard"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=('feedbackd'
         'gnome-desktop'
         'python')
makedepends=('pkg-config'
             'meson'
             'intltool'
             'rust'
             'gtk-doc')
source=("https://source.puri.sm/Librem5/squeekboard/-/archive/v${pkgver}/squeekboard-v${pkgver}.tar.gz")
sha256sums=('f85d049c89eb5781e9d251babe90c38656b2e6437ec7de8b3c9a3d100355ce4f')


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
