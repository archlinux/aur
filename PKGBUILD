# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROC
_pkgver=1.90.0
pkgname=r-${_pkgname,,}
pkgver=1.90.0
pkgrel=1
pkgdesc='utilities for ROC, with microarray focus'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-knitr
)
optdepends=(
  r-biobase
  r-biocstyle
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8edcecd4afc17c97d5e043d8492e7cf50b52fa0c04437988e7d0474338b77770')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
