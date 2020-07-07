# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-print
pkgver=0.1.3
pkgrel=2
pkgdesc='Simple shim for printing support via Contractor'
arch=(x86_64)
url=https://github.com/elementary/pantheon-print
license=(GPL3)
depends=(
  cairo
  contractor
  glib2
  glibc
  gtk3
  pango
)
makedepends=(
  git
  meson
  vala
)
source=(git+https://github.com/elementary/pantheon-print.git#tag=${pkgver})
sha256sums=(SKIP)

build() {
  arch-meson pantheon-print build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
