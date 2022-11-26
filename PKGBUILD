# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigstatsr
_pkgver=1.5.12
pkgname=r-${_pkgname,,}
pkgver=1.5.12
pkgrel=3
pkgdesc='Statistical Tools for Filebacked Big Matrices'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bigassertr
  r-bigparallelr
  r-cowplot
  r-foreach
  r-ggplot2
  r-ps
  r-rcpp
  r-rcpparmadillo
  r-rmio
  r-rspectra
  r-tibble
)
optdepends=(
  r-bigmemory
  r-bigreadr
  r-covr
  r-data.table
  r-dplyr
  r-glmnet
  r-hexbin
  r-memuse
  r-modelmetrics
  r-plotly
  r-ppcor
  r-rhpcblasctl
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a8a77e0717d8c59e4762db7d0adda10284b8f3c100f9df445854fa90643241f2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
