# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-minimize1
pkgver=1.2
pkgrel=1
pkgdesc="KWin effect that animates the minimizing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-minimize1"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('c3c71aa6ab10a2e6084e54e3f8be18feee55e493aa8dedf5bc2afb6ee20d5d9c')

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
