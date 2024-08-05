# Maintainer: Windel Bouwman <windel@windel.nl>

pkgname=python-fastdds
pkgver=1.4.2
pkgrel=1
pkgdesc="Python bindings for Fast DDS"
arch=(x86_64)
url="https://github.com/eProsima/Fast-DDS-python"
license=('Apache-2.0')
depends=(fastdds python)
makedepends=(cmake swig)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eProsima/Fast-DDS-python/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("39163fc7412476a739aabd9245ffd253")

build() {
    cmake -B build -S "Fast-DDS-python-$pkgver/fastdds_python" \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

