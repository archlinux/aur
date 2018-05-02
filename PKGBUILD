# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-appear2
pkgver=1.0
pkgrel=1
pkgdesc="KWin effect that animates the appearing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-appear2"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules kdelibs)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('8e41cfccfaaf5b9ad9c57e2fa2dd89d9615bba43de0a958f93499d40e36a5e40')

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
