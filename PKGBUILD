# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=netpeek
pkgver=0.3.2
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
sha256sums=('660b33cf3bd0f70deaf54b4eb2439d1c596034a80eee95882915e98630b55b0f')

build() {
  cd NetPeek
  arch-meson build
  ninja -C build
}

package() {
  cd NetPeek
  DESTDIR="${pkgdir}" ninja -C build install
}
