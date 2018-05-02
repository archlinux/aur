# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-appear3
pkgver=1.0
pkgrel=1
pkgdesc="KWin effect that animates the appearing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-appear3"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules kdelibs)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e2b420fa78879f80b7e5fdeeeaaf200658fbebd81e3e7f4bd3702cbdda6ee90a')

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
