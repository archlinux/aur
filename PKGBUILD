# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=philr
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('185d1bf5f9db37795d74cbf253d62af901a7ea2957572452ece5d9643c1a56c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
