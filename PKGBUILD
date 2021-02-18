# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=4.1.3.r1c9fc49b
pkgrel=1
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=('kwin>=5.21.0')
makedepends=(extra-cmake-modules)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/1c9fc49b53fedc95b1e4d0cd651b844c552974d3.tar.gz
)
sha256sums=('8a7e5212b5f3bfff7724a74114da8f6581fe8967c0250d3d3c1828b23dba3d5e')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-1c9fc49b53fedc95b1e4d0cd651b844c552974d3 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
