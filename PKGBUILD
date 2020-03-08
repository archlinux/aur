# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=caret
_cranver=6.0-85
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Classification and Regression Training"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.2.0' r-ggplot2 r-foreach r-plyr 'r-modelmetrics>=1.1.0' r-reshape2 'r-recipes>=0.1.4' 'r-withr>=2.0.0' r-proc)
makedepends=(gcc)
optdepends=(r-bradleyterry2 r-e1071 r-earth r-fastica r-gam r-ipred r-kernlab r-knitr r-klaR r-ellipse r-mda r-mlbench r-mlmetrics r-nnet r-party r-pls r-proxy r-randomforest r-rann r-spls r-pamr r-superpc r-cubist r-testthat r-rpart r-dplyr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('2326a6bcc90ce1b43528cc414f3becb6')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
