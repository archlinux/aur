# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=xmlparsedata
_cranver=1.0.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-xmlparsedata
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Parse Data of R Code as an XML Tree"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-covr' 'r-testthat' 'r-xml2')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0b3c62ea33d4dac5ce28aa98e05effb2')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

