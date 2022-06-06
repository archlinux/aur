# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=satuRn
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Scalable Analysis of Differential Transcript Usage for Bulk and Single-Cell RNA-sequencing Applications'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-ggplot2
  r-limma
  r-locfdr
  r-pbapply
  r-summarizedexperiment
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-covr
  r-delayedarray
  r-dexseq
  r-edger
  r-ensembldb
  r-knitr
  r-rmarkdown
  r-stager
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a29d343cbf6e225ee6a0048a800d0634e37ba95b4402dd32c394a369142c0f53')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
