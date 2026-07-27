# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=netpeek
pkgver=0.3.0
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
sha256sums=('a62859b9eef7092251cbf4884c9259d115437ab289dd0dfcb3bc40ee5946ce1a')

build() {
  cd NetPeek
  arch-meson build
  ninja -C build
}

package() {
  cd NetPeek
  DESTDIR="${pkgdir}" ninja -C build install
}
