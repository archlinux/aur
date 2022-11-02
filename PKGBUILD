# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=twoddpcr
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Classify 2-d Droplet Digital PCR (ddPCR) data and quantify the number of starting molecules'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-hexbin
  r-rcolorbrewer
  r-s4vectors
  r-scales
  r-shiny
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0702b4acc368e89eeea720efe62c910b89b870bb253971649915455818bc6e05')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
