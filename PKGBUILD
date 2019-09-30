# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=operator.tools
_cranver=1.6.3
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Working with R's Operators"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r')
optdepends=('r-operators>=0.1.8' 'r-magrittr>=1.5' 'r-testthat>=1.0.2')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('16c236522901759bd83488e736e406aa')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
