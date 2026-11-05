# Maintainer: Simone Balducci <simone.balducci00@gmail.com>
pkgname=alpaka-cpp
_pkgname=alpaka
pkgver=2.2.0
pkgrel=1
pkgdesc="Abstraction Library for Parallel Kernel Acceleration"
arch=(any)
url="https://github.com/alpaka-group/alpaka"
license=('MPL-2.0')
depends=(boost)
makedepends=(cmake)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b38dc3f461da261a746956bd84ae85c62a9b3ef13c078c94bceb9783ae94d1f2')

build() {
    # Header-only library: this only configures the install step
    cmake -B build -S "$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
