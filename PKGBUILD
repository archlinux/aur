# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>

pkgname=kwin-effects-sliding-notifications
pkgver=1.0.3
pkgrel=2
pkgdesc="Sliding animation for notification windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-sliding-notifications"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('9b52f8db1f8d2b1f3200b7208fa35555b5322ff819b03f7bca97830788888167')

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
