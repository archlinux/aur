# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MetaCyto
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='MetaCyto: A package for meta-analysis of cytometry data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-fastcluster
  r-flowcore
  r-flowsom
  r-ggplot2
  r-metafor
  r-tidyr
)
optdepends=(
  r-dplyr
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('29226121ea0b8b655e28024b00feced15f9cb0f4135a57a67b6cbef24bb4dc0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
