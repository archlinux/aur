# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=formatR
_cranver=1.7
pkgname=r-formatr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Format R Code Automatically"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2' 'GPL3')
depends=('r>=3.0.2')
optdepends=('r-codetools' 'r-shiny' 'r-testit' 'r-rmarkdown' 'r-knitr')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('1b223bdb396ef14597e8a449c53af2fb')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

