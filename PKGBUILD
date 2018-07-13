# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=serialdv
pkgver=1.0.5
pkgrel=1
pkgdesc="C++ Minimal interface to encode and decode audio with AMBE3000 based devices in packet mode over a serial link"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/f4exb/serialDV"
license=('GPL3')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f5964605476fe400f559e7d1700fee96ce16f1ee2e0eefdc61d3c6e70bef0bd')

build() {
  mkdir -p "$srcdir"/serialDV-$pkgver/build
  cd "$srcdir"/serialDV-$pkgver/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir"/serialDV-$pkgver/build

  make DESTDIR="$pkgdir" install
}
