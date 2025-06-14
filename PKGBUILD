# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="kapitano"
pkgver="1.1"
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
sha256sums=("541ff3e04df2b8f602dfd7789d9ee90530b299c170f79bbaab4c4e12a8023a94")

build() {
  opts=()
  arch-meson build "${pkgname}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
  install "${startdir}/page.codeberg.zynequ.Kapitano.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install "${startdir}/page.codeberg.zynequ.Kapitano-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
}
