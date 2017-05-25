# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.9.0
pkgrel=1
pkgdesc="Create D bindings from GObject introspection files"
arch=(x86_64 i686)
url="https://github.com/gtkd-developers/gir-to-d"
license=(LGPL3)
depends=(gcc-libs)
makedepends=(meson dmd)
source=($pkgname-$pkgver.tar.gz::"https://github.com/gtkd-developers/gir-to-d/archive/v$pkgver.tar.gz")
sha256sums=('22aa011c8a17d0e268a6f28861b4218579eeea686658f244f77a18e99d64024a')

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
