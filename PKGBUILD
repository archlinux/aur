# Maintainer: favonia <favonia@gmail.com>

pkgname=lhs2tex
pkgver=1.19
pkgrel=2
pkgdesc="Preprocessor for typesetting Haskell sources with LaTeX"
url="https://www.andres-loeh.de/lhs2tex/"
license=("GPL")
source=("http://hackage.haskell.org/package/$pkgname/$pkgname-$pkgver.tar.gz")
makedepends=('ghc' 'haskell-directory' 'haskell-filepath' 'haskell-mtl' 'haskell-process' 'haskell-regex-compat')
depends=('gmp' 'libffi' 'texlive-latexextra')
arch=('i686' 'x86_64')
md5sums=('4414be7f90d7a805bb3fec843b547cfa')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
