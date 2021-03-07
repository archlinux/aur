#Contributor: Lex Black <autumn-wind at web dot de>

pkgname=elettra
pkgver=1.0
pkgrel=4
pkgdesc="Encryption utility by Julia Identity"
arch=(i686 x86_64)
license=('custom')
url="https://www.winstonsmith.info/julia/elettra/"
depends=('libmcrypt' 'mhash' 'zlib')
makedepends=('cmake')
source=(https://www.winstonsmith.info/julia/elettra/elettra-src.tar.gz)
sha256sums=('fb0c4e3f624c02a613e34abbf7bc03d8fc0d43b4967c2b51b202d7201d95e05b')

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
