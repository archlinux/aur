# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=philr
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Phylogenetic partitioning based ILR transform for metagenomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-ggplot2
  r-ggtree
  r-phangorn
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-ecodist
  r-glmnet
  r-knitr
  r-mia
  r-phyloseq
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-treesummarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fcd93f8ac68849cb8b99cfcb6dc52a64ad2b0ee772113d67eb25ec031592a7cd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
