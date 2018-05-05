# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-appear1
pkgver=1.2
pkgrel=1
pkgdesc="KWin effect that animates the appearing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-appear1"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e8629c1b3725d9ed79b079defe3e9045f36dc81954141deef699d71e9122f4e2')

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
