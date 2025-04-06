# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gsvg
pkgver=0.10.4
pkgrel=1
pkgdesc="GObject API for SVG"
arch=(x86_64)
url="https://gitlab.com/gsvg/gsvg"
license=(LGPL-2.1-only)
depends=(gxml graphene)
makedepends=(git meson vala gobject-introspection)
source=("git+https://gitlab.com/gsvg/gsvg.git#tag=${pkgver}")
sha256sums=('841f1169d16cf68da896cdaf3ad4392e166980df58246786957e0f788d12c150')

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
