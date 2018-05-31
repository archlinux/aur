# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=withr
_cranver=2.1.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-withr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Run Code With Temporarily Modified Global State"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-testthat' 'r-covr' 'r-dbi' 'r-knitr' 'r-rmarkdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('85e8574fb0a6832c4f275531be6371d6')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

