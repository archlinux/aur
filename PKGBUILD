# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=enyo-launcher
pkgver=2.0.7
pkgrel=1
pkgdesc="Frontend for Doom engines"
arch=(x86_64)
url="https://github.com/stephendcofer/enyo-launcher"
license=(GPL3)
depends=(gcc-libs glibc qt6-base)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephendcofer/enyo-launcher/archive/$pkgver.tar.gz")
sha512sums=('6150955173a75b682bef5e1f8c0f5ae75b26cc3fc7031b5e294896f8b3316b286c47ad735600cf6817e7a6a5d0d08cdb43ac6e6e660e44150fc57d54680af878')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
