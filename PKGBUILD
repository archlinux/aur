# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-disappear2
pkgver=1.1
pkgrel=1
pkgdesc="KWin effect that animates the disappearing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-disappear2"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('4f668ba7c94a0c8f5643b1596afbc2969a67321f7f18ff2d58fcb4058f16d7a6')

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
