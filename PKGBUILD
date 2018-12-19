# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.17.0
pkgrel=2
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL3')
depends=('gcc-libs' 'liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3820338318475c393df0396819875a5c82a6532c4a4ddff57492b4bd5f95014fb9a56a07e96a167df73f4d9c9f404d374b1c9eefe650d45f025b09c8ea3fb9b2')

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  export DC=ldc

  arch-meson ..

  ninja
}

package() {
  cd $pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}
