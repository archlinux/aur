# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=kwin-effects-yet-another-magic-lamp
pkgver=5.24.0
pkgrel=1
pkgdesc="Just Yet Another Magic Lamp effect"
arch=('x86_64')
url="https://github.com/zzag/$pkgname"
license=('GPL3')
depends=('kwin>=5.24.0')
makedepends=(extra-cmake-modules)
    source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzag/${pkgname}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('e9434eb10a9f9fc978da6e398ecba896c20e7bc611115997c3b5418742662452')

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
