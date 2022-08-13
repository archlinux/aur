# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=receptLoss
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Unsupervised Identification of Genes with Expression Loss in Subsets of Tumors'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-magrittr
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-here
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('42b7b3f074bfd930eb9770fce1c8b25aff423c02eaa9e0c2c6681e54e3c0d553')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
