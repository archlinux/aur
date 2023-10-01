# Maintainer: James Beddek <telans@posteo.de>
pkgname=knetstats
_pkgname=KNetStats
pkgver=2.0.0.alpha
pkgrel=1
pkgdesc="Network interface and statistics viewer"
arch=('x86_64')
url="https://github.com/telans/KNetStats"
license=('GPL-2')
depends=(
    'kwidgetsaddons<6'
    'qt5-base'
)
makedepends=(
    'cmake'
    'qt5-base'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/telans/KNetStats/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
