#Contributor: Lex Black <autumn-wind at web dot de>

pkgname=elettra
pkgver=1.0
pkgrel=3
pkgdesc="Encryption utility by Julia Identity"
arch=(i686 x86_64)
license=('custom')
url="http://www.winstonsmith.info/julia/elettra/"
depends=('libmcrypt' 'mhash' 'zlib')
makedepends=('cmake')
source=(http://www.winstonsmith.info/julia/elettra/elettra-src.tar.gz)
md5sums=('8ece5fdfccea33001ac8d4f61080b2fe')
sha1sums=('f198264d9fc66c9c97cfe70bbe1c592b710f9e73')

build() {
    cd $pkgname/src

    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd $pkgname

    install -D -m0755 $srcdir/elettra/src/build/elettra $pkgdir/usr/bin/elettra
    install -D -m0644 $srcdir/elettra/README $pkgdir/usr/share/doc/elettra/README
}
