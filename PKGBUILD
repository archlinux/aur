# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=5.26.0
pkgrel=1
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=('kwin>=5.26.0')
makedepends=(extra-cmake-modules)
    source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('eb32ccaeca3a50a63ad6c0f108fd2f4652366986585db3e2862805c649525638')

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
