# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=commonmark
_cranver=1.5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-commonmark
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="High Performance CommonMark and Github Markdown Rendering in R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('BSD_2_clause + file LICENSE')
depends=('r' )

optdepends=('r-curl')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('61cd4dabb77e59c7994fd73407936013')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

