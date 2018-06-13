# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=ddalpha
_cranver=1.3.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-ddalpha
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Depth-Based Classification and Calculation of Data Depth"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-robustbase' 'r-sfsmisc' 'r-geometry' 'r-rcpp>=0.11.0' 'r-bh')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('1daa14e9b630d0f4a7f36d18d1cd3ce6')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

