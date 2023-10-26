# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tRNA
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Analyzing tRNA sequences and structures'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-genomicranges
  r-ggplot2
  r-iranges
  r-modstrings
  r-s4vectors
  r-scales
  r-stringr
  r-structstrings
  r-xvector
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-trnascanimport
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('090466dd6ee1dddc86221be1042c532465fc0e6cf546a6577069bb01757aa2e8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
