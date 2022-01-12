pkgname='term-sudoku'
pkgver='1.1'
pkgrel=1
pkgdesc='Play sudoku in your terminal.'
arch=('any')
url='https://github.com/theeyeofcthulhu/term-sudoku'
license=('GPL')
makedepends=('git' 'make' 'cmake')
depends=('ncurses')
source=("https://github.com/theeyeofcthulhu/term-sudoku/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('SKIP')

build() {
    cd $srcdir/$pkgname-$pkgver
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver/build
    make DESTDIR="${pkgdir}" install
    install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
