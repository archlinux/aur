# Maintainer: Cooper Pierce <cppierce@andrew.cmu.edu>
pkgname=cmlex
_reponame=cmtool
pkgver=2.1
pkgrel=2
pkgdesc="A lexer generator for Standard ML, OCaml, and Haskell"
url="https://www.cs.cmu.edu/~crary/cmtool/"
arch=('x86_64')
license=('MIT')
depends=('gmp')
makedepends=('make' 'mlton')
source=("${_reponame}-$pkgver.tgz::${url}/${_reponame}-${pkgver}.tgz")
md5sums=('9c7f1c384b9ba5008ce2d5b0e769c669')

build() { 
    cd "${_reponame}"
    cd lex
    make mlton
}

package() {
    cd "${_reponame}"
    install -Dm755 lex/bin/cmlex "${pkgdir}/usr/bin/cmlex"
}
