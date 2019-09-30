# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=formula.tools
_cranver=1.7.1
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Programmatic Utilities for Manipulating Formulas, Expressions, Calls, Assignments and Other R Objects"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-operator.tools>=1.4.0')
optdepends=('r-magrittr' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('ab6ac9a593b99ef94148b2c908abc07d')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
