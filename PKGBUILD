# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proDA
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Differential Abundance Analysis of Label-Free Mass Spectrometry Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-extradistr
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-dep
  r-dplyr
  r-knitr
  r-limma
  r-msnbase
  r-numderiv
  r-pheatmap
  r-readr
  r-rmarkdown
  r-stringr
  r-testthat
  r-tibble
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6add0b0a820c313b105a4562ebc71212fd1e033149143edd9d697bdb8cf93cd0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
