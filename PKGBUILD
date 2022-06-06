# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SEtools
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='SEtools: tools for working with SummarizedExperiment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-circlize
  r-complexheatmap
  r-data.table
  r-deseq2
  r-edger
  r-openxlsx
  r-randomcolor
  r-s4vectors
  r-seriation
  r-summarizedexperiment
  r-sva
  r-sechm
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-pheatmap
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f94dd63f12f31a851bec0d676aa3907c1d4a381fa679064e9d68f3de0156868')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
