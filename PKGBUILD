# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANCOMBC
_pkgver=1.6.2
pkgname=r-${_pkgname,,}
pkgver=1.6.2
pkgrel=1
pkgdesc='Analysis of compositions of microbiomes with bias correction'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-desctools
  r-doparallel
  r-dorng
  r-dplyr
  r-energy
  r-foreach
  r-hmisc
  r-magrittr
  r-microbiome
  r-nloptr
  r-phyloseq
  r-rdpack
  r-rlang
  r-tibble
  r-tidyr
)
optdepends=(
  r-corrplot
  r-dt
  r-ggforce
  r-knitr
  r-limma
  r-qwraps2
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5bb1cfb8b6828cd18c85d51cd2ef9d63d1a7e74eb0917aff73a6ebf94f2311b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
