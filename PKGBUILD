# Maintainer: Your Name <youremail@domain.com>

pkgname=gnome-shell-extension-night-light-slider
_srcname=gnome-shell-night-light-slider-extension
pkgver=23
pkgrel=1
pkgdesc="Manage GNOME night light temperature intensity from the panel."
arch=('any')
url="https://codeberg.org/kiyui/gnome-shell-night-light-slider-extension"
license=('GPL2')
depends=('gnome-shell')
makedepends=('meson')
source=($url/archive/$pkgver.tar.gz)
sha256sums=('a004e992f18378da99e2c010ed786b6d4bc7eaae3e1207790ccd6b98058de428')

build() {
    arch-meson $_srcname build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
