# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>

pkgname=kwin-effects-sliding-notifications
pkgver=1.5.0
pkgrel=1
pkgdesc="Sliding animation for notification windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-sliding-notifications"
license=('GPL3')
depends=('kwin>=5.27.0')
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('b26cef0e6eed5b7859ca3aa351e40ee186c6d5b811f8b165ee9863f5c0166ee6')

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
