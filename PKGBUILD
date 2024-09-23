# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.6
pkgrel=2
pkgdesc="Gui settings mangohud"
arch=(x86_64)
url="https://github.com/radiolamp/${pkgname}"
license=(GPL-3.0-or-later)
depends=(
  glib2
  gtk4
  libadwaita
  libgee
)
makedepends=(
  git
  meson
  vala
  mangohud
  vulkan-tools
)

optdepends=(
  mesa-demos
  adwaita-icon-theme
)

options=(!debug)
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(74d418515248c0eafaa22bad563fe1a33a8a1cd7b626c3f88ef94e2cbcb276cd4db135035cd10a9a5decb4994afe699968cb9e4a3af31e458c7831afc46c6ff8)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
