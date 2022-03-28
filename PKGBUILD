# Maintainer: Devin Lin <devin@kde.org>
# Contributor: Dan Johansen <strit@manjaro.org>
pkgname=plasma-mobile-sounds
pkgver=0.1
pkgrel=1
pkgdesc="Sounds for Plasma Mobile"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-mobile-sounds"
license=('CC-BY-4.0')
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('612003ae4b4269361d80ef248de1d630')
makedepends=(cmake extra-cmake-modules)

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
