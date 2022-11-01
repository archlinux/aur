# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANCOMBC
_pkgver=1.6.4
pkgname=r-${_pkgname,,}
pkgver=1.6.4
pkgrel=1
pkgdesc='Microbiome differential abudance and correlation analyses with bias correction'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-cvxr
  r-desctools
  r-doparallel
  r-dorng
  r-dplyr
  r-emmeans
  r-energy
  r-foreach
  r-hmisc
  r-lmertest
  r-magrittr
  r-mia
  r-nloptr
  r-rdpack
  r-rlang
  r-rngtools
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-caret
  r-dt
  r-knitr
  r-microbiome
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ff5e80929cdbf6beb1073a6f5e008e2d2d8bdaccf5f65635b7fccf6d96b9710b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
