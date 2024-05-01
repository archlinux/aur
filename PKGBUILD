# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mistyR
_pkgver=1.11.0
pkgname=r-${_pkgname,,}
pkgver=1.11.0
pkgrel=1
pkgdesc='Multiview Intercellular SpaTial modeling framework'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-caret
  r-deldir
  r-digest
  r-distances
  r-dplyr
  r-filelock
  r-furrr
  r-ggplot2
  r-purrr
  r-r.utils
  r-ranger
  r-readr
  r-ridge
  r-rlang
  r-rlist
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-withr
)
optdepends=(
  r-biocstyle
  r-covr
  r-earth
  r-future
  r-igraph
  r-iml
  r-kernlab
  r-knitr
  r-mass
  r-rmarkdown
  r-rsnns
  r-testthat
  r-xgboost
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0a107bdf7d4f6c39dc3b8bb9c65b5742a64a107f9f75111a077411d3d125ba1e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
