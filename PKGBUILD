# Maintainer: Radiolin <anton.osi2011@gmail.com>

pkgname=mangojuice
pkgver=0.5
pkgrel=1
pkgdesc="Gui settings mangohud"
arch=(x86_64)
url="https://github.com/radiolamp/${pkgname}"
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
  vala
)

optdepends=(
  vulkan-tools
  mesa-demos
)

options=(!debug)
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=(SKIP)

build() {
  arch-meson ${pkgname}-$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
