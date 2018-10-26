# Maintainer: favonia <favonia@gmail.com>

pkgname=lhs2tex
pkgver=1.22
pkgrel=1
pkgdesc="Preprocessor for typesetting Haskell sources with LaTeX"
url="https://www.andres-loeh.de/lhs2tex/"
license=("GPL")
source=("https://hackage.haskell.org/package/$pkgname/$pkgname-$pkgver.tar.gz"
        "force-dynamic.diff")
depends=('ghc' 'haskell-directory' 'haskell-filepath' 'haskell-mtl'
         'haskell-process' 'haskell-regex-compat' 'texlive-latexextra')
arch=('i686' 'x86_64')
md5sums=('0a678d37c983b1614777957054c15f55'
         '7b3687d3b7143e3b18abdf2926696189')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    patch < "../../force-dynamic.diff"
    ./configure --prefix=/usr
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
