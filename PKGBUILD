# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=netpeek
pkgver=0.3.3
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
sha256sums=('4542842fe0fb0281b1c8d8b1a464adcf498a0d24e33a12699b3735abdc80c068')

build() {
  cd NetPeek
  arch-meson build
  ninja -C build
}

package() {
  cd NetPeek
  DESTDIR="${pkgdir}" ninja -C build install
}
