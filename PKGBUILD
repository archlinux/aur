# Maintainer: James Triantafylos <JTriantafylos at gmail dot com>
pkgname=sstatus
pkgver=1.1.1
pkgrel=1
pkgdesc="A lightweight, multi-threaded status line generator to be used with i3bar."
arch=('x86_64')
url="https://github.com/JTriantafylos/${pkgname}"
license=('GPL3')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JTriantafylos/sstatus/archive/v${pkgver}.tar.gz")
sha256sums=('6ddd996a8fd7bbc0f3e25851e4f238480723077000a91a5e5197a57fb2696d59')

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
