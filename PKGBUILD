# Maintainer: James Triantafylos <JTriantafylos at protonmail dot com>
pkgname=sstatus
pkgver=2.0.0
pkgrel=1
pkgdesc="A lightweight, multi-threaded status line generator to be used with i3bar."
arch=('x86_64')
url="https://github.com/JTriantafylos/${pkgname}"
license=('GPL3')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JTriantafylos/sstatus/archive/v${pkgver}.tar.gz")
sha256sums=('0d465bcd28e2ef6ca5cdfc6035d37acf82ad78b7b7273e3da67d433d3fa401d5')

build () {
  cmake -B build \
        -S ${pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev
  make -C build
}

package () {
  make DESTDIR="${pkgdir}" -C build install
}
