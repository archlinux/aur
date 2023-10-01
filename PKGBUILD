# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=moderncli
pkgver=0.6.1
pkgrel=1
epoch=
pkgdesc="Reusable C++ header library"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('MIT')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
makedepends=(cmake pkgconf gcc)
depends=(openssl fmt)
sha256sums=('3daad7bc2d893e47413f2e8f75fb390e3759ca794f98d3ddae2a058a3f3f79f5')

build() {
    cd "$srcdir/$pkgname"
    cmake \
        -DCMAKE_INSTALL_FULL_SYSCONFDIR:PATH=/etc \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" make install
}

