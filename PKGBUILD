# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=5.25.0
pkgrel=1
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=('kwin>=5.25.0')
makedepends=(extra-cmake-modules)
    source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('45e25463583244cd1b5deb4f1deb0d800a11bd65d6e0ac5577b5055bd65757b7')

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
