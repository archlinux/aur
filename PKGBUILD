# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.14.0
pkgrel=1
pkgdesc="Create D bindings from GObject introspection files"
arch=(x86_64)
url="https://github.com/gtkd-developers/gir-to-d"
license=(LGPL3)
depends=(gcc-libs)
makedepends=(meson dmd libphobos)
source=($pkgname-$pkgver.tar.gz::"https://github.com/gtkd-developers/gir-to-d/archive/v$pkgver.tar.gz")
sha256sums=('cf3504f59b3bd17925336491517eb76515fa382e156051a55347cca949256681')

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
