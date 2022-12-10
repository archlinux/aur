# Maintainer: David Sugar <tychosoft@gmail.com>
pkgname=moderncli
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="Reusable C++ header library"
url="https://codeberg.org/gnutelephony/$pkgname"
arch=(x86_64 i686 aarch64 armv7h)
license=('GPL')
source=($pkgname-v$pkgver.tar.gz::https://codeberg.org/gnutelephony/$pkgname/archive/v$pkgver.tar.gz)
makedepends=(cmake pkgconf gcc)
depends=(openssl fmt)
sha256sums=('b189c1adb0825f3d9d330b7c9995e10f24b93ab934a8a73dad6010f7a585b5f7') 

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

