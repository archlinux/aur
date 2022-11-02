# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IsoCorrectoR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Correction for natural isotope abundance and tracer purity in MS and MS/MS data from stable isotope labeling experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-magrittr
  r-pracma
  r-quadprog
  r-readr
  r-readxl
  r-stringr
  r-tibble
  r-writexls
)
optdepends=(
  r-isocorrectorgui
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f77be5e615af7d8da7606ae551fe3e25c6631af11da2bd12e82c66e4544749a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
