# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vidger
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Create rapid visualizations of RNAseq data in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-deseq2
  r-edger
  r-ggally
  r-ggplot2
  r-ggrepel
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-scales
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b81d1424e0db5de4642c363f198d40893df2ec66177a321773ab1d9d8ad3e06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
