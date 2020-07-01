# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=mustache-d
pkgver=0.1.4
pkgrel=5
pkgdesc='Moustache template engine for D'
arch=('x86_64')
url='https://github.com/repeatedly/mustache-d'
license=('Boost')
makedepends=('meson' 'ldc' 'liblphobos')
source=("$pkgname-$pkgver::https://github.com/repeatedly/mustache-d/archive/v$pkgver.tar.gz")
sha512sums=('764da71092f0def69c168597eb720d3b122a0addf516739c35fc79910b7709a220d7c901cd3afaa66164472df1178e395696b36c9b3d4e84472da7220add7b2c')

prepare() {
  mkdir -p build
}

build() {
  cd build

  # Build with LDC
  export DC=ldc

  arch-meson ../$pkgname-$pkgver

  ninja
}

package() {
  cd build

  DESTDIR="$pkgdir" ninja install
}
