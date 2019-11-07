# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=gir-to-d
pkgver=0.20.0
pkgrel=2
pkgdesc='Create D bindings from GObject introspection files'
arch=('x86_64')
url='https://github.com/gtkd-developers/gir-to-d'
license=('LGPL3')
depends=('gcc-libs' 'liblphobos')
makedepends=('meson' 'ldc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('27a8c7cf0ec1556e7361a2a704e150eae59b360eb5717b203f5604a5636eadeebd7b8af7701d2c96d20f503e27465281ae1734db1ad1f2d34d0514c2fc0ebc4e')

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
