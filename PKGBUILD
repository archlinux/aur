# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>

pkgname=folio
pkgver=24.12
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
b2sums=('aaa1587aa58c921930bafc536265c49f2a6ce3a2fb2466b592c5c18a822e2eef6ee586079ce163ae4b16b541219df0d5c47c35630ab9d635cfeef5610f271278')

build() {
  arch-meson ${pkgname^}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
