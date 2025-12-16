# Maintainer: Simone Balducci <simone.balducci00@gmail.com>
pkgname=cluestering
pkgver=2.9.0
pkgrel=1
pkgdesc="High-performance density-based weighted clustering library developed at CERN"
arch=(any)
url="https://github.com/cms-patatrack/CLUEstering"
license=('MPL-2.0')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(https://github.com/cms-patatrack/CLUEstering/archive/refs/tags/2.9.0.tar.gz)
sha256sums=('00e0c228f75f9d140896fcc91a0741f958985769dd09618e7effef339f2e2f6a')

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
