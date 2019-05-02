# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=jsonlite
_cranver=1.6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-jsonlite
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Robust, High Performance JSON Parser and Generator for R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-httr' 'r-curl' 'r-plyr' 'r-testthat' 'r-knitr' 'r-rmarkdown' 'r-r.rsp' 'r-sp')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('a9cd554c212dd8db93b157932fcb4f8d')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

