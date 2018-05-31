# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=zip
_cranver=1.0.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-zip
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Cross-Platform zip Compression"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('CC0')
depends=('r' )

optdepends=('r-covr' 'r-testthat' 'r-withr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0e019bf0f5d9a7c182f9aebf51a7e883')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

