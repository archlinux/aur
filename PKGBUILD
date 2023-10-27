# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SplicingFactory
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Splicing Diversity Analysis for Transcriptome Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-summarizedexperiment
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('914bc2ad73f279a36828ed836420faedc8fe4e2cbe2034b5a9d7df048f67626e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
