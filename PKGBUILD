# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>

pkgname=kwin-effects-sliding-notifications
pkgver=1.2.0
pkgrel=1
pkgdesc="Sliding animation for notification windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-sliding-notifications"
license=('GPL3')
depends=('kwin>=5.24.0')
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('23b5fc294d5f3796d9ff09898a4b12fc7f38f4c81f3cf01d13685dc0651ea051')

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
