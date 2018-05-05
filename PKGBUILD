# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
pkgname=kwin-effects-appear3
pkgver=1.2
pkgrel=1
pkgdesc="KWin effect that animates the appearing of windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-appear3"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('49c8a9793f828a15c2bbcaa9fb4db002790beaf8c15c0381c66b3194c7807832')

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
