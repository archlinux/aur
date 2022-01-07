# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>

pkgname=kwin-effects-sliding-notifications
pkgver=1.1.0
pkgrel=1
pkgdesc="Sliding animation for notification windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-sliding-notifications"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('254d4a9875ae250b8f9cc509872162a38f006b5320465163cd7c8bf86674d0bf')

prepare() {
    mkdir -p build
    cd $srcdir/$pkgname-$pkgver
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
