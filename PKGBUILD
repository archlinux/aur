# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=treekoR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=3
pkgdesc='Cytometry Cluster Hierarchy and Cellular-to-phenotype Associations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-data.table
  r-diffcyt
  r-dplyr
  r-edger
  r-ggiraph
  r-ggplot2
  r-ggtree
  r-hopach
  r-lme4
  r-multcomp
  r-patchwork
  r-singlecellexperiment
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-catalyst
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('365617084a30e77b99ab8e852515c8d9950721a75372814ed49c7d305a2e26c6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
