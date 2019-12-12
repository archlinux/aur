# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=curl
_cranver=4.3
pkgname=r-curl
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Modern and Flexible Web Client for R"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r>=3.0.0' 'curl')
optdepends=('r-spelling' 'r-testthat' 'r-knitr' 'r-jsonlite' 'r-rmarkdown' 'r-magrittr' 'r-httpuv' 'r-webutils')
makedepends=('gcc')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('7e3ba9a151543a10ae209b0877b1d605')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
