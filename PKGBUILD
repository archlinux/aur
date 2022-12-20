# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANCOMBC
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=2.0.2
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
  r-lme4
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
  r-treesummarizedexperiment
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
sha256sums=('e577ffe62a86090de9ea3743c84a4f3b34c3d645dcedff3c8af675b8c9b69136')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
