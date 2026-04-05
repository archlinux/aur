# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.9.0
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
b2sums=('634672648f8f52eab7d97a0b6d529ffb1e29f4e22b82d1bf1abc6cfa106efb01a3b45380dad6cea907d090a03dbb62d700c80bcfa41e033e78a0e268270db9a0')

build() {
  arch-meson ${pkgname}-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
