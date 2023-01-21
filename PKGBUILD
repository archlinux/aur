# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BANDITS
_pkgver=1.14.2
pkgname=r-${_pkgname,,}
pkgver=1.14.2
pkgrel=1
pkgdesc='BANDITS: Bayesian ANalysis of DIfferenTial Splicing'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-data.table
  r-doparallel
  r-dorng
  r-drimseq
  r-foreach
  r-ggplot2
  r-r.utils
  r-rcpp
  r-rcpparmadillo
  gcc
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-genomicfeatures
  r-knitr
  r-rmarkdown
  r-testthat
  r-tximport
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14616fdef4e0fec08e61ec9813f41bae4bcdc0b2945e5c6318c38327e0578087')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
