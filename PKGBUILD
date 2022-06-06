# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XCIR
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=1.7.0
pkgrel=2
pkgdesc='XCI-inference'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-data.table
  r-ggplot2
  r-iranges
  r-readxl
  r-s4vectors
  r-seqminer
  r-variantannotation
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9cd249f510c3cd3c29074a5f9a29e18a7fd365e433f9050d983a6c1e00bf8258')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
