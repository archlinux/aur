# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=moderncli
pkgver=0.3.1
pkgrel=1
epoch=
pkgdesc="Reusable C++ header library"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
makedepends=(cmake pkgconf gcc)
depends=(openssl fmt)
sha256sums=('4629ac43d715be9306c133df8959425624832150e9ab5fd72973d22a2f9e9ef8') 

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

