# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SEtools
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='SEtools: tools for working with SummarizedExperiment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-circlize
  r-data.table
  r-deseq2
  r-edger
  r-openxlsx
  r-pheatmap
  r-s4vectors
  r-sechm
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d1edc2a22986536ea97104945220f2f4d1ff4926735d1364ad4c56fb8fa9f915')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
