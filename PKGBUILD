# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=lme4
_cranver=1.1-27
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Linear Mixed-Effects Models using 'Eigen' and S4"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.2.0' 'r-minqa>=1.2.1' 'r-nloptr>=1.0.4' 'r-rcpp>=0.10.5' r-rcppeigen)
optdepends=(r-knitr r-rmarkdown r-pkpdmodels r-memss r-testthat r-ggplot2 r-mlmrev r-optimx r-gamm4 r-pbkrtest r-hsaur3 r-numderiv r-car r-dfoptim)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('fe0391c76c78188ac1eefb18014d0607212c909b55474d985a919b55efe5a15f')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
