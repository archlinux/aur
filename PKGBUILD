# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetDecoy
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Diagnostic Plots to Evaluate the Target Decoy Approach'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  r-ggpubr
  r-mzid
  r-mzr
  r-shiny
  r-miniui
)
optdepends=(
  r-biocstyle
  r-covr
  r-gridextra
  r-knitr
  r-msdata
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1dcc933cd046e6150a9c632ed96d2a752b3feaa8df45eecf7197542058538596')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
