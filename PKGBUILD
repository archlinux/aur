# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PAST
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Pathway Association Study Tool (PAST)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-doparallel
  r-dplyr
  r-foreach
  r-genomicranges
  r-ggplot2
  r-iterators
  r-qvalue
  r-rlang
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6717c9fb245565558d2c8069a7beb8243d1398d802a7643768dfd4891ed1bc62')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
