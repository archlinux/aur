# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-unminimize1
pkgver=1.2
pkgrel=1
pkgdesc="KWin effect that animates the unminimizing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-unminimize1"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('6f4c76626d72c32586d35be58a46945fe3803cdf2e2e82cf96a14b310b76684a')

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
