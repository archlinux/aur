# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=enyo-launcher
pkgver=2.0.7
pkgrel=1
pkgdesc="Frontend for Doom engines"
arch=(x86_64)
url="https://gitlab.com/sdcofer70/enyo-launcher"
license=(GPL-3.0-or-later)
depends=(gcc-libs glibc qt6-base)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/sdcofer70/enyo-launcher/-/archive/$pkgver/enyo-launcher-$pkgver.tar.gz")
sha512sums=('13ce3e16ea67d37bdcef2e6c60995a739dccff528a7dfc25b32f639cd0dcf4581a678b2d03a089954a8a94b567f421c0015fb5428bf37dcf15d946aab727ddf6')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
