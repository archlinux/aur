# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=car
_cranver=3.1-0
_updatedate=2022-06-25
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
sha256sums=('bd52b4eaea46ce828fccd93445301d06ebd265e2ffff796064875a8c0f0aea21')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
