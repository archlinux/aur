# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-disappear3
pkgver=1.3
pkgrel=1
pkgdesc="KWin effect that animates the disappearing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-disappear3"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('2cc87baad80e0f7ebcbe7e5f07c5cb935c4980c8f575028ea07d116fd872361d')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
