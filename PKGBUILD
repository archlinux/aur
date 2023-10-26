# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=idpr
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Profiling and Analyzing Intrinsically Disordered Proteins in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biostrings
  r-dplyr
  r-ggplot2
  r-jsonlite
  r-magrittr
  r-plyr
  r-rlang
)
optdepends=(
  r-ape
  r-knitr
  r-msa
  r-rmarkdown
  r-seqinr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aa0e92b2c321f2fc33c94fc3149d6f2198cbbd018fc13ca651e5e0a4cf99fb60')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
