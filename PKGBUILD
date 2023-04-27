# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BANDITS
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
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
sha256sums=('67121eac7b323d91db6365ddffc1f7d5536f4991ba84d2248331828390125464')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
