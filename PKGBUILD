# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-unminimize1
pkgver=1.4
pkgrel=1
pkgdesc="KWin effect that animates the unminimizing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-unminimize1"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('117e3e2a6ba31088d847c7edab782d16c7ccfc07880daac411cf646ce86f6318')

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
