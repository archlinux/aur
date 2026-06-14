# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=ministream
pkgver=0.99.0
pkgrel=1
pkgdesc="Minimal (subset) appstream metadata parser"
arch=(x86_64)
url="https://gitlab.gnome.org/sp1rit/ministream"
license=(LGPL-2.1-or-later)
depends=(
    appstream # run time
    glib2
    glibc
    gobject-introspection # run time (g-ir-scanner, g-ir-compiler)
    )
makedepends=(
    git
    meson
    ninja
    )
source=("git+https://gitlab.gnome.org/sp1rit/ministream.git#tag=${pkgver}")
sha256sums=('e8e195504603631ce189b0d6800e156ae92aac9c10a2a758ee52c7df551f01c0')

build() {
  cd ministream
  arch-meson build
  ninja -C build
}

package() {
  cd ministream
  DESTDIR="${pkgdir}" ninja -C build install
}
