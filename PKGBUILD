# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=caret
_cranver=6.0-89
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Classification and Regression Training"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.2.0' r-ggplot2 r-e1071 r-foreach 'r-modelmetrics>=1.2.2.2' r-plyr r-proc 'r-recipes>=0.1.10' r-reshape2 'r-withr>=2.0.0')
optdepends=(r-bradleyterry2 r-covr r-cubist r-dplyr r-earth r-ellipse r-fastica r-gam r-ipred r-kernlab r-klar r-knitr r-mda r-mlbench r-mlmetrics r-pamr r-party r-pls r-proxy r-randomforest r-rann r-rmarkdown r-rpart r-spls r-subselect r-superpc r-testthat r-themis)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('043b602360a6434f6e61e13ea8483f894f818d9f6e52d4a721e2ed5007612221')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
