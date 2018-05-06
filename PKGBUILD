# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-minimize1
pkgver=1.4
pkgrel=1
pkgdesc="KWin effect that animates the minimizing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-minimize1"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('4c695059fd5bac1ca5d4917b906f71d985856eeeb8655629f0238315c1624a11')

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
