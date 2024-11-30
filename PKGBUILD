# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_cranname=dtwclust
_cranver=6.0.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Time series clustering along with optimized techniques related to the Dynamic Time Warping distance and its corresponding lower bounds."
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=(
    r
    r-clue
    r-cluster
    r-dplyr
    r-dtw
    r-flexclust
    r-foreach
    r-ggplot2
    r-ggrepel
    r-parallel
    r-proxy
    r-rcpp
    r-rcppthread
    r-reshape2
    r-rspectra
    r-shiny
    r-shinyjs
    r-stats
    r-utils
)
makedepends=(gcc)
optdepends=(
    r-doparallel
    r-iterators
    r-knitr
    r-rmarkdown
    r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('104fc7eb154752593158dccea4ada556d70580a99507438b8d37b88b490fc02f')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
