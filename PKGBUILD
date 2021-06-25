# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marco Melorio <marco.melorio@protonmail.com>
# Contributor: Bakasura <bakasura@protonmail.ch>

_pkgname=libadwaita
pkgname=$_pkgname-shortwave
pkgver=r1937.afee036
_commit=9a52895fcd5a906791606400db1028fa0e527854
pkgrel=2
epoch=1
pkgdesc="Library full of GTK widgets for mobile phones (version required by shortwave)"
url="https://gitlab.gnome.org/GNOME/$_pkgname"
license=(LGPL)
arch=(i686 x86_64 armv7h aarch64)
depends=(gtk4)
makedepends=(git gobject-introspection meson sassc vala wayland-protocols)
source=("git+$url#commit=$_commit")
provides=($_pkgname)
conflicts=($_pkgname)
md5sums=(SKIP)

build() {
    arch-meson $_pkgname build -Dgtk_doc=false -Dexamples=true
    DESTDIR="$pkgdir" ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
