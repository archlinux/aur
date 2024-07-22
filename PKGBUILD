# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>

pkgname=folio
pkgver=24.11
pkgrel=1
pkgdesc="Beautiful markdown note-taking app for GNOME (forked from Paper)"
arch=(x86_64)
url="https://github.com/toolstack/$pkgname"
license=(GPL-3.0-only)
depends=(
  dconf
  glib2
  gtk4
  gtksourceview5
  libgee
  libadwaita
  pango
)
makedepends=(
  blueprint-compiler
  glib2-devel
  meson
  vala
)
options=(!debug)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('203e0670a5aefbf3c71cf345d8a81258e2746e6e527c103122d23611197c1e4f8d83fc6690017d37c991e3c339181c50bac4d5b46c7002354f1fb41b66e54605')

build() {
  arch-meson ${pkgname^}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
