# Maintainer: James Triantafylos <JTriantafylos at gmail dot com>
pkgname=sstatus
pkgver=1.1
pkgrel=1
pkgdesc="A lightweight, multi-threaded status line generator to be used with i3bar."
arch=('x86_64')
url="https://github.com/JTriantafylos/${pkgname}"
license=('GPL3')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JTriantafylos/sstatus/archive/v${pkgver}.tar.gz")
sha256sums=('7de30dad0c6a9bcc4edb95aa95650dec81118eba20312acb12c744ddf17a7944')

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
