# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TPP2D
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
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
sha256sums=('11c864b78e7a2156b6ab931b5cedff3ad9bcbf4fc79c2b9116b6dc8431444340')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
