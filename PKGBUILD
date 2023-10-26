# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RVS
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Computes estimates of the probability of related individuals sharing a rare variant'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-genlib
  r-grain
  r-kinship2
  r-snpstats
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a538323370013882ccdc88e79009a08569de8fb37ce1337caf52bfb80100fd5d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
