pkgname=libgmp-static
pkgver=6.1.2
pkgrel=2
arch=('any')
source=("https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz")
md5sums=('f58fa8001d60c4c77595fbbb62b63c1d')
depends=('gmp>=6.1.2-2')
url=https://gmplib.org
license=('LGPL3' 'GPL')
pkgdesc='A free library for arbitrary precision arithmetic, but only includes libgmp.a'
package() {
    cd gmp-$pkgver

    ./configure --prefix=$pkgdir/usr --enable-static --disable-shared
    make
    make install

    rm -rf $pkgdir/usr/include
    rm -rf $pkgdir/usr/share
}
