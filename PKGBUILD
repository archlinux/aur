# Maintainer: Simone Balducci <simone.balducci00@gmail.com>
pkgname=cluestering
pkgver=2.14.0
pkgrel=1
pkgdesc="High-performance density-based weighted clustering library developed at CERN"
arch=(any)
url="https://github.com/cms-patatrack/CLUEstering"
license=('MPL-2.0')
depends=(boost)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(https://github.com/cms-patatrack/CLUEstering/archive/refs/tags/2.14.0.tar.gz)
sha256sums=('21e7b8b44a4c8e151573a7783497754f72e1a1b6f39b223b6060be4adbd60f30')

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
