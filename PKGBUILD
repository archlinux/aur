# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=mustache-d
pkgver=0.1.3
pkgrel=16
pkgdesc='Moustache template engine for D'
arch=('x86_64')
url='https://github.com/repeatedly/mustache-d'
license=('Boost')
makedepends=('meson' 'ldc' 'liblphobos')
source=("$pkgname-$pkgver::https://github.com/repeatedly/mustache-d/archive/v$pkgver.tar.gz")
sha512sums=('ae70cc0ad0e94729ae2a2a8a8598a7489e457406fb61534641b25d7413749d3ba977591453fab438ce752a4b51d0f91777b5c470f53d7e3884a9f70aad736ded')

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
