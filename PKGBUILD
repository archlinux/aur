# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=futile.logger
_cranver=1.4.3
pkgname=r-futile.logger
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Logging Utility for R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL3')
depends=('r>=3.0.0' 'r-lambda.r>=1.1.0' 'r-futile.options')
optdepends=('r-testthat' 'r-jsonlite')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('ba0e8d2dfb5a970b51c21907bbf8bfc2')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

