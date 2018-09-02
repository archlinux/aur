# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=glibd
pkgver=2.0.0
pkgrel=2
pkgdesc="D bindings for the GLib C Utility Library"
arch=(x86_64)
url="https://github.com/gtkd-developers/GlibD"
license=(LGPL)
depends=(libphobos glib2)
makedepends=(dmd meson gobject-introspection gir-to-d)
source=($pkgname-$pkgver.tar.gz::"https://github.com/gtkd-developers/GlibD/archive/v$pkgver.tar.gz")
sha256sums=('0935b9c4cb33289d0739923af3cd048300cc36e44ef72f2e8c1679944d6a4c4d')

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson ../GlibD-$pkgver --prefix=/usr
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
