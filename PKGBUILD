# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=car
_cranver=3.0-12
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Companion to Applied Regression"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.5.0' 'r-cardata>=3.0.0' r-abind 'r-pbkrtest>=0.4.4' r-quantreg r-maptools 'r-lme4>=1.1.27.1')
optdepends=(r-alr4 r-coxme r-effects r-knitr r-leaps r-lmtest r-matrixmodels r-rgl r-rio r-sandwich r-sparsem r-survey)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b899a6efae3842a90a2349d381dbcf4b4ed36bd03108ebe7380e81120e457302')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
