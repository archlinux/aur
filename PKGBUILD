# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.11.1
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
source=("${url}/-/archive/v${pkgver}/squeekboard-v${pkgver}.tar.gz")
sha256sums=('52838b2223c2031b4a1b0cf0d5680582b950e5ac3f820d8a3ade1bc476194804')


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
