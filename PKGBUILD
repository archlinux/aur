# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=segmenter
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Perform Chromatin Segmentation Analysis in R by Calling ChromHMM'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bamsignals
  r-chipseeker
  r-chromhmmdata
  r-complexheatmap
  r-genomicranges
  r-iranges
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-gviz
  r-knitr
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg18.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e07c7bccae7934436c6ce0edce1cf3b6120f43822bf701ed42037fe30bc9168')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
