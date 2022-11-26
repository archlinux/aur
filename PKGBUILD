# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=peakPantheR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=3
pkgdesc='Peak Picking and Annotation of High Resolution Experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bslib
  r-doparallel
  r-dt
  r-foreach
  r-ggplot2
  r-gridextra
  r-minpack.lm
  r-msnbase
  r-mzr
  r-pracma
  r-scales
  r-shiny
  r-shinycssloaders
  r-stringr
  r-xml
)
optdepends=(
  r-biocstyle
  r-devtools
  r-faahko
  r-knitr
  r-msdata
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e5c56d4193ef27c14e10ebef244a7fc165b901ac7da6f86153a179aba0690a45')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
