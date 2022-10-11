# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>

pkgname=kwin-effects-sliding-notifications
pkgver=1.4.0
pkgrel=1
pkgdesc="Sliding animation for notification windows"
arch=('x86_64')
url="https://github.com/zzag/kwin-effects-sliding-notifications"
license=('GPL3')
depends=('kwin>=5.26.0')
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d98fa917a1c404dc3bdba4d4ac57606eba3a0ddaeb21a91ddfcd188db6da456e')

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
