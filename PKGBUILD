# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=lambda.r
_cranver=1.2.4
pkgname=r-lambda.r
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Modeling Data with Functional Programming"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL3')
depends=('r>=3.0.0' 'r-formatr')
optdepends=('r-testit')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('861157dc2fe66ce8ed1e755578a57e47')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

