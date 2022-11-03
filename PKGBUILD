# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BEARscc
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='BEARscc (Bayesian ERCC Assesstment of Robustness of Single Cell Clusters)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-ggplot2
  r-singlecellexperiment
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-knitr
  r-nmf
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('190353615ac4499246ae3a042c28cb18f05b84f2db1ce1432f522ce1650483c8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
