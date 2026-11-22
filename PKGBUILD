# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=netpeek
pkgver=0.3.5
pkgrel=1
pkgdesc="Mordern network scanner for GNOME"
arch=(any)
url="https://github.com/ZingyTomato/NetPeek"
license=(GPL-3.0-or-later)
depends=(
    dconf
    glib2
    gtk4
    hicolor-icon-theme
    libadwaita
    python
    python-gobject
    python-nmap
    )
makedepends=(
    git
    meson
    ninja
    )
source=("git+https://github.com/ZingyTomato/NetPeek.git#tag=v${pkgver}")
sha256sums=('d2b062d7837d2141f3752308d5c2ae9e77444b5e6b1390bf052d093145f844e3')

build() {
  cd NetPeek
  arch-meson build
  ninja -C build
}

package() {
  cd NetPeek
  DESTDIR="${pkgdir}" ninja -C build install
}
