# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=yaml
_cranver=2.1.19
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-yaml
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Methods to Convert R Data to YAML and Back"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('BSD')
depends=('r' )

optdepends=('r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('26beaf10e565c934e0e20d81832cce6b')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

