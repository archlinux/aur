# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stageR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='stageR: stage-wise analysis of high throughput gene expression data in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-summarizedexperiment
)
optdepends=(
  r-biobase
  r-biocstyle
  r-dexseq
  r-edger
  r-knitr
  r-limma
  r-methods
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3e7141d1b02c44b124a3b6d981b1cdf0389c1af1b1b00c758e4659420d8c435b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
