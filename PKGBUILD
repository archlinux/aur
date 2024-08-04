# Maintainer: Windel Bouwman <windel@windel.nl>

pkgname=fastdds
pkgver=2.14.3
pkgrel=1
pkgdesc="A C++ implementation of the DDS (Data Distribution Service) standard."
arch=(x86_64)
url="https://fast-dds.docs.eprosima.com"
license=('Apache-2.0')
depends=(fastcdr foonathan_memory tinyxml2 openssl)
makedepends=(cmake asio)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eProsima/Fast-DDS/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("002eb4d5e85341f08092bdcd9930db1a")

build() {
    cmake -B build -S "Fast-DDS-$pkgver" \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCOMPILE_TOOLS=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

