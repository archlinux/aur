# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.8.8
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
b2sums=(05c8b887122aef44cbcf254d355cf4eb04ecec7a889676f96735b9709b5fb9b5b65ce9eef9e44417e0ce2caaf0e90740b6b02e1af47ae7d2820beea2798fa0e6)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
