#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=wmake-parse
pkgname=${_pkgname}

pkgver=0.2.1
pkgrel=1
pkgdesc="Utility and library to parse wmake config files"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/nnSemenov/wmakeParse"
license=('GPL3')
makedepends=('cmake' 'ninja' 'git' 'gcc' 'cli11')
depends=('gcc-libs')
optdepends=()
source=(https://github.com/nnSemenov/wmakeParse/archive/refs/tags/v0.2.1.tar.gz)
sha512sums=('fbca668c8c9e8a6f05c1ac36c54fcafc68b3fa99405b1e5cfc38bdff57213261975ad630a58a2fd6a4f204d3a33f33dd2cf7da5a58e145a56786f5d6480c4bd7')


build() {
    cmake -S wmakeParse-$pkgver -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
