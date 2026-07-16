# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vidger
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('668d36a4542e60530d8fa3cc3977fa03b3de4e46499c90ac592cf840565ad030')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
