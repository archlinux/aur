# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.8.9
pkgrel=1
pkgdesc="A convenient alternative to GOverlay for configuring MangoHud"
arch=(x86_64)
url="https://github.com/radiolamp/${pkgname}"
license=(GPL-3.0-or-later)
depends=(
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  libadwaita
  libgee
  pango
  mangohud
  fontconfig
)
makedepends=(
  git
  meson
  vala
)

optdepends=(
  vulkan-tools
  mesa-utils
  vkbasalt
)

options=(!debug)
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(SKIP)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
