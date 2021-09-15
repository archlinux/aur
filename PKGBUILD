pkgname='term-sudoku'
pkgver='1.0'
pkgrel=1
pkgdesc='Play sudoku in your terminal.'
arch=('any')
url='https://github.com/theeyeofcthulhu/term-sudoku'
license=('GPL')
makedepends=('git')
depends=('ncurses' 'dialog')
source=('git://github.com/theeyeofcthulhu/term-sudoku')
sha1sums=('SKIP')

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
