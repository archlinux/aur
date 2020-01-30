# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=futile.options
_cranver=1.0.1
pkgname=r-futile.options
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Futile Options Management"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL3')
depends=('r>=2.8.0')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('040daac5089839c104ffd0e0fbedb98d')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
    cd "${srcdir}"

    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

