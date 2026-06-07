# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=netpeek
pkgver=0.2.7
pkgrel=1
pkgdesc="Mordern network scanner for GNOME"
arch=(any)
url="https://github.com/ZingyTomato/NetPeek"
license=(GPL-3.0-or-later)
depends=(python python-gobject python-nmap gtk4 libadwaita glib2)
makedepends=(git meson ninja)
source=("git+https://github.com/ZingyTomato/NetPeek.git#tag=v${pkgver}")
sha256sums=('87befd36df1aa8a1eee16e38c3a64d7918c687ddd41342b04a279e9d5ff2d7a2')

build() {
  cd NetPeek
  arch-meson build
  ninja -C build
}

package() {
  cd NetPeek
  DESTDIR="${pkgdir}" ninja -C build install
}
