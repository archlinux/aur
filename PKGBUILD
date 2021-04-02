# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=maliit-framework
pkgver=2.0.0
pkgrel=1
pkgdesc="Core libraries of Maliit and server"
arch=(x86_64)
url="https://maliit.github.io/"
license=(LGPL)
depends=(qt5-declarative)
makedepends=(cmake qt5-wayland wayland-protocols gtk3 python)
optdepends=('qt5-wayland: wayland-shell integration')
source=(https://github.com/maliit/framework/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('81f337c43a140ec3977b7d91abdf4a630bf73c98942f96e0ff4f57323c42a2ba')

build() {
  cmake -B build -S framework-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Denable-tests=OFF \
    -Denable-docs=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
