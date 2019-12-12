# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=data.table
_cranver=1.12.8
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Extension of data.frame"
url="https://cran.r-project.org/package=${_cranname}"
arch=('x86_64' 'i686')
depends=('r>=3.1.0' 'zlib')
makedepends=('gcc')
optdepends=('r-bit64' 'r-curl' 'r-r.utils' 'r-knitr' 'r-xts' 'r-nanotime' 'r-zoo' 'r-yaml')
license=('MPL2')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('60720bb81e1b04bb23103ec1e3be15b3')

build(){
    cd "${srcdir}"
    
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
