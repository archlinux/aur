# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=wayland-utils
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland tools to display information about current compositor"
url="https://gitlab.freedesktop.org/wayland/wayland-utils"
arch=(x86_64)
license=(MIT)
depends=(wayland wayland-protocols)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.freedesktop.org/wayland/${pkgname}/-/archive/${pkgname}-${pkgver}/${pkgname}-${pkgname}-${pkgver}.tar.gz)
sha256sums=('72fc2471715077000f76833d72ad59ed24e3a3f77b47f77e45ae669bef99947a')


build() {
  arch-meson ${pkgname}-${pkgname}-${pkgver} build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
