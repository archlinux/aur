# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=5.27.0
pkgrel=1
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=('kwin>=5.27.0')
makedepends=(extra-cmake-modules)
    source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('99fbd79d8d6fc67f0ba94062805f02531be5ced03c8c7564b31ebc939c8f6499')

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
