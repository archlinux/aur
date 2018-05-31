# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=digest
_cranver=0.6.15
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-digest
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Create Compact Hash Digests of R Objects"
arch=('x86_64')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL')
depends=('r' )

optdepends=('r-knitr' 'r-rmarkdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('94fe9e133a7fb19a89e05daac7b5e9da')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

