# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: sifyfy <sifyfy@sifyfy.dev>

pkgname=libgmp-static
pkgver=6.2.0
pkgrel=2
pkgdesc='A free library for arbitrary precision arithmetic, but only includes libgmp.a and libgmpxx.a'
arch=('x86_64')
depends=("gmp>=$pkgver")
url=https://gmplib.org
license=('LGPL3' 'GPL2')
source=("https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz")
sha512sums=('9975e8766e62a1d48c0b6d7bbdd2fccb5b22243819102ca6c8d91f0edd2d3a1cef21c526d647c2159bb29dd2a7dcbd0d621391b2e4b48662cf63a8e6749561cd')

package() {
    cd gmp-$pkgver

    ./configure --prefix=$pkgdir/usr --enable-static --disable-shared --enable-cxx
    make
    make check
    make install

    rm -rf $pkgdir/usr/include
    rm -rf $pkgdir/usr/share
    rm -rf $pkgdir/usr/lib/pkgconfig
}
