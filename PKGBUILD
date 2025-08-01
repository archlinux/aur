# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=netpeek
pkgver=0.2
pkgrel=1
pkgdesc="Mordern network scanner for GNOME"
arch=(x86_64)
url="https://github.com/ZingyTomato/NetPeek"
license=(GPL-3.0-or-later)
depends=(python python-gobject gtk4)
makedepends=(git meson ninja)
source=("git+https://github.com/ZingyTomato/NetPeek.git#tag=v${pkgver}")
sha256sums=('09c5feb1323ff1406d230173980ba6903cc5adb2393cb61386e8b2b628dd7e6a')

build() {
  cd NetPeek
  arch-meson build
  ninja -C build
}

package() {
  cd NetPeek
  DESTDIR="${pkgdir}" ninja -C build install
}
