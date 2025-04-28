# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>

pkgname=folio
pkgver=25.02
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
b2sums=('SKIP')

build() {
  arch-meson ${pkgname^}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
