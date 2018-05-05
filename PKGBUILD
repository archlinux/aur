# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-disappear3
pkgver=1.2
pkgrel=1
pkgdesc="KWin effect that animates the disappearing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-disappear3"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('3f945a85dbc30741d99f7a7b6c90f9c7051f30d084342c61c310adf179f62bec')

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
