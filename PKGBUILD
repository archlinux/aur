# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot com>
pkgname=xfresco
pkgver=2.2
pkgrel=1
pkgdesc="Coupled reaction channels calculations"
arch=(i686 x86_64)
url=https://personal.us.es/moro/xfresco/download.html
license=(GPL3)
depends=(fresco lib32-gtk2 gcc5)
makedepends=(gcc-fortran)
source=("https://personal.us.es/moro/xfresco/xfresco-$pkgver.tar.gz")
sha256sums=('fd544fab64a7ffe08757df1adfca82484eb6c0033bb7d9e9ae342b3d92433aaa')

build() {
    cd "$srcdir"
    ./configure CXX=g++-5 CC=gcc-5 FC=gfortran-5 CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fexceptions\
    -Wp,-D_FORTIFY_SOURCE=2 -Wformat"
}

package() {
    make
    make DESTDIR=$pkgdir install
}
