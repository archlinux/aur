# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=caret
_cranver=6.0-91
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Classification and Regression Training"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
    r-ggplot2
    r-e1071
    r-foreach
    r-modelmetrics
    r-plyr
    r-proc
    r-recipes
    r-reshape2
    r-withr
)
optdepends=(
    r-bradleyterry2
    r-covr
    r-cubist
    r-dplyr
    r-earth
    r-ellipse
    r-fastica
    r-gam
    r-ipred
    r-kernlab
    r-klar
    r-knitr
    r-mda
    r-mlbench
    r-mlmetrics
    r-pamr
    r-party
    r-pls
    r-proxy
    r-randomforest
    r-rann
    r-rmarkdown
    r-spls
    r-subselect
    r-superpc
    r-testthat
    r-themis
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('bfd52ddb8f8563dadb9f038884d3e4a9c9d2a1e5d449a052e8e287e358287dcd')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
