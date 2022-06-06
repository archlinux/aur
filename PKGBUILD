# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Omixer
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Omixer: multivariate and reproducible sample randomization to proactively counter batch effects in omics studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-forcats
  r-ggplot2
  r-gridextra
  r-magrittr
  r-readr
  r-stringr
  r-tibble
  r-tidyselect
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3d39e14ee529dc579b98e7a4853ad5df281da5cf8fcc8ea08e921eb132e65b89')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
