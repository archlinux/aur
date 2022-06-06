# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fedup
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc="Fisher's Test for Enrichment and Depletion of User-Defined Pathways"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-data.table
  r-dplyr
  r-forcats
  r-ggplot2
  r-ggthemes
  r-openxlsx
  r-rcolorbrewer
  r-rcy3
  r-tibble
)
optdepends=(
  r-biomart
  r-covr
  r-devtools
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('383a9105aac3175e97027c3f0967b1fc1569d6ed9fea432aa221d2ff93abc9e1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
