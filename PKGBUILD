# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stageR
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
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
sha256sums=('ba962d48b8972010fbd4e50e8b09dac419a3d0872c0897fa42bc3cf1008cbb29')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
