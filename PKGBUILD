# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.6
pkgrel=1
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
b2sums=(b965c791bc418088eecc22909b46c10682fc7997b2c1778ea16467aa0eb07e376f4855a39142271c3119def042b29b1ebc09c79e542cdb6eec9077810df198d7)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
