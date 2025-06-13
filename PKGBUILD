# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="kapitano"
pkgver="1.0"
pkgrel="1"
epoch="1"
pkgdesc="Modern ClamAV front-end that uses gtk4/libadwaita"
arch=("any")
url="https://codeberg.org/zynequ/Kapitano"
license=("GPL-3.0-or-later")
depends=("glib2" "gtk4" "libadwaita" "python-gobject")
makedepends=("git" "meson" "appstream")
provides=("kapitano")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/zynequ/Kapitano/archive/${pkgver}.tar.gz")
sha256sums=("f05124ac2c3cceb8e636f3eef9ba6677ed35302541d6ac68948857a794e246e0")

build() {
  opts=()
  arch-meson build "${pkgname}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}
