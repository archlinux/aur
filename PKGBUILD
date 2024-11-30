# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gcad3d-bin
pkgver=2.60.06
pkgrel=2
pkgdesc="Parametric 3D CAD with viewer, import, export, NC"
arch=(x86_64)
url="https://www.gcad3d.org"
license=(GPL-3.0-or-later)
depends=(
  at-spi2-core
  bash
  cairo
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
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
source=(${pkgname%-bin}-$pkgver-$pkgrel.deb::$url/download/gCAD3D-$pkgver-$pkgrel-bin-amd64.deb)
b2sums=('925fdd924678648c479a1b0b373d2d1007d13fa10720ab0b3ed85d2335ad4e186b7de32870359e8272da38a17234d16103fded54633e59e14ed0ec01cf05338a')

package() {
  bsdtar -xf "$srcdir"/data.tar.xz -C "$pkgdir"
}
