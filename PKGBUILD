# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=dynamic-wallpaper-editor
pkgver=1.11.0
pkgrel=1
pkgdesc='Dynamic Wallpaper Editor'
arch=(any)
url='https://github.com/maoschanz/dynamic-wallpaper-editor'
depends=(python hicolor-icon-theme)
license=(GPL3)
makedepends=(meson ninja)
source=("$pkgname-$pkgver.tar.gz::https://github.com/maoschanz/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0e34de690bdd969bdccf44a4fd82b544507d0b8afbd1e32339090a658704bf84')

build() {
  mkdir -p build
  arch-meson build $pkgname-$pkgver -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et
