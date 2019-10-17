# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=4.0
pkgrel=2
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('15594280ec7fd272886f957bdbf3ce94634ddd42578604e4e8c39aeed5afc285')

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
