# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.12.1
pkgrel=1
pkgdesc="Create D bindings from GObject introspection files"
arch=(x86_64)
url="https://github.com/gtkd-developers/gir-to-d"
license=(LGPL3)
depends=(gcc-libs)
makedepends=(meson dmd libphobos)
source=($pkgname-$pkgver.tar.gz::"https://github.com/gtkd-developers/gir-to-d/archive/v$pkgver.tar.gz")
sha256sums=('fb3b4ee1f8e9c3c6e20c2605cf8dc95750bd71a8c4018ad91d219ed4886b500d')

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson ../$pkgname-$pkgver --prefix=/usr
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
