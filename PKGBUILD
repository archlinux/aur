# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=ministream
pkgver=0.99.1
pkgrel=1
pkgdesc="Minimal (subset) appstream metadata parser"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/ministream"
license=(LGPL-2.1-or-later)
depends=(
    appstream # runtime
    glib2
    glibc
    gobject-introspection # runtime (g-ir-scanner, g-ir-compiler)
    )
makedepends=(
    git
    meson
    ninja
    )
source=("git+https://gitlab.gnome.org/GNOME/ministream.git#tag=${pkgver}")
sha256sums=('5036976cde1f67e6d9e1d45ad99abcd8e90567b1bb485e41622b72c406b2d77d')

build() {
  cd ministream
  arch-meson build
  ninja -C build
}

package() {
  cd ministream
  DESTDIR="${pkgdir}" ninja -C build install
}
