# Maintainer: Arnav <me@arnv.dev>
pkgname=nicol
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal web browser based on Qt"
arch=("x86_64")
url="https://github.com/arnav-kr/nicol"
license=("AGPL-3.0-only")
depends=("qt6-base" "qt6-declarative" "qt6-webengine" "hicolor-icon-theme")
makedepends=("cmake" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/arnav-kr/nicol/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ac42b4b435eec1258df3dd432ee25d3977b3b19911a7616ba667c4d78614698')

build() {
    cd "nicol-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "nicol-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
