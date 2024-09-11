# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.4.4.78dd5a0
pkgrel=1
pkgdesc="Gui settings mangohud"
arch=(x86_64)
url="https://github.com/radiolamp/${_pkgname%-git}"
license=(GPL-3.0)
depends=(
  glib2
  gtk4
  libadwaita
  libgee
)
makedepends=(
  git
  meson
)
options=(!debug)
source=("git+https://github.com/radiolamp/mangojuice.git") #tag=$pkgver
b2sums=(SKIP)

build() {
  arch-meson "$pkgname" build 
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
