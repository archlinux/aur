# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gresg
pkgver=0.6.0
pkgrel=2
pkgdesc="XML resources generator"
arch=(x86_64)
url="https://gitlab.com/esodan/gresg"
license=(GPL-3.0-only)
depends=(gxml)
makedepends=(git meson vala)
source=("git+https://gitlab.com/gsvg/gresg.git#tag=${pkgver}")
sha256sums=('SKIP')

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
