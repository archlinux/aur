# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=car
_cranver=3.0-13
_updatedate=2022-06-08
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Companion to Applied Regression"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.5.0' 'r-cardata>=3.0.0' r-abind 'r-pbkrtest>=0.4.4' r-quantreg r-maptools 'r-lme4>=1.1.27.1')
optdepends=(r-alr4 r-coxme r-effects r-knitr r-leaps r-lmtest r-matrixmodels r-rgl r-rio r-sandwich r-sparsem r-survey)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d35ae8da80284c9e4471ff13e7100c3cdc1809fd06f813cd223a3958e29e47eb')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
