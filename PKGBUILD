# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=5.23.0
pkgrel=2
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=('kwin>=5.23.0')
makedepends=(extra-cmake-modules)
    source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('ae97a1f4cab9d3b7cf4e9238dd66dbe963ea06efae03da63e261e84eb8abaa7d')

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
