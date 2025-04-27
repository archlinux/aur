# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=segmenter
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('b278040e5a10a89299e0f3fb39f14652a1e84b4ce52822fed11318faee9ba930')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
