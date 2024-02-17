# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=struct
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=1
pkgdesc='Statistics in R Using Class-based Templates'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-knitr
  r-ontologyindex
  r-rols
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-ggplot2
  r-magick
  r-openxlsx
  r-rmarkdown
  r-rstudioapi
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('602cb5c2b1c507958fc344ada92c24d5e6933da2a2f6331e519c346b5b70f77e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
