# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=enyo-launcher
pkgver=2.0.4
pkgrel=1
pkgdesc="Frontend for Doom engines"
arch=(x86_64)
url="https://github.com/stephendcofer/enyo-launcher"
license=(GPL3)
depends=(qt5-base)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/stephendcofer/enyo-launcher/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('85f812c4de37a2964fe1561db7822ef22958b4b231d612539f5c25654231baca3904b4de94f3c8a6843060356cf98e4602d7344b6f09a084a0a2610d41197aca')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
