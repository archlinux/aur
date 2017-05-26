# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.10.0
pkgrel=1
pkgdesc="Create D bindings from GObject introspection files"
arch=(x86_64 i686)
url="https://github.com/gtkd-developers/gir-to-d"
license=(LGPL3)
depends=(gcc-libs)
makedepends=(meson dmd)
source=($pkgname-$pkgver.tar.gz::"https://github.com/gtkd-developers/gir-to-d/archive/v$pkgver.tar.gz")
sha256sums=('b229ff65093fdc99a7265650462746fb168181bd68c8e4ced3e01befb147a9eb')

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
