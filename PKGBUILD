#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=wmake-parse
pkgname=${_pkgname}

pkgver=0.2.2
pkgrel=0
pkgdesc="Utility and library to parse wmake config files"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/nnSemenov/wmakeParse"
license=('GPL3')
makedepends=('cmake' 'ninja' 'git' 'gcc' 'cli11')
depends=('gcc-libs')
optdepends=()
source=(https://github.com/nnSemenov/wmakeParse/archive/refs/tags/v0.2.2.zip)
sha512sums=('645ad86d1d04276496652d2d7863d867ba26b509fd456d627c8637d73afd36f7b0a806ea2881bc8b00e414a622e39ffc194a75dc179d3d0606bc84b579a6865a')
options=(!strip !debug)

build() {
    cmake -S wmakeParse-$pkgver -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
