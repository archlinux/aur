# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.11.0
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
sha256sums=('3eddb4e152a83214ef485825ea5bfbc7bd382a867c8e5c8c23c9346529eddbed')


build() {
    arch-meson "squeekboard-v${pkgver}" build -Dtests=false
    meson compile -C build
}

# check() {
#     meson test -C build --print-errorlogs
# }

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
