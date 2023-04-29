# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TPP2D
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=3
pkgdesc='Detection of ligand-protein interactions from 2D thermal profiles (DLPTP)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-doparallel
  r-dplyr
  r-foreach
  r-ggplot2
  r-limma
  r-openxlsx
  r-rcurl
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e58ddd949947629706449b66f425a304676f0ecc5efbb7eeee4b5fb771a9ec2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
