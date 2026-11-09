# Maintainer: Simone Balducci <simone.balducci00@gmail.com>
pkgname=cluestering
pkgver=2.14.2
pkgrel=1
pkgdesc="High-performance density-based weighted clustering library developed at CERN"
arch=(any)
url="https://github.com/cms-patatrack/CLUEstering"
license=('MPL-2.0')
depends=(alpaka-cpp boost)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(https://github.com/cms-patatrack/CLUEstering/archive/refs/tags/2.14.2.tar.gz)
sha256sums=('ff95fac879eac511170f07f289b96bbfea447f5592ad9f0f418e709022f535ae')

build() {
    cd "$srcdir/CLUEstering-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    # No compilation needed; CMake will configure installation
}

package() {
    cd "$srcdir/CLUEstering-$pkgver/build"
    cmake --install . --prefix "$pkgdir/usr"
}
