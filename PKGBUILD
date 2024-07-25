# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gcad3d-bin
pkgver=2.60.06
pkgrel=1
pkgdesc="Parametric 3D CAD with viewer, import, export, NC"
arch=(x86_64)
url="https://www.gcad3d.org"
license=(GPL-3.0-or-later)
depends=(
  at-spi2-core
  cairo
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glu
  gtk2
  gtkglarea
  harfbuzz
  libglvnd
  pango
)
optdepends=('xorg-xwayland: run under Wayland')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=(${pkgname%-bin}-$pkgver.deb::$url/download/gCAD3D-$pkgver-bin-amd64.deb)
b2sums=('563bc2b34b16fffbdbf410d86ecee9b59e5dd60fce871505eb96c80aa931742619374eb3828dc0d3075fb2f44e3f6a369fa054a5d3cfb03860720afb372d2ebb')

package() {
  bsdtar -xf "$srcdir"/data.tar.xz -C "$pkgdir"
}
