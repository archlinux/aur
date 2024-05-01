# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scFeatureFilter
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='A correlation-based method for quality filtering of single-cell RNAseq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-magrittr
  r-rlang
  r-tibble
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-knitr
  r-rmarkdown
  r-scrnaseq
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b0f0ffd4813a2331fb8a0a5e0345db8aa8549eccd8d7519fc484a6385b9aafd3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
