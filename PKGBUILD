# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MODA
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=3
pkgdesc='MODA: MOdule Differential Analysis for weighted gene co-expression network'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-amountain
  r-dynamictreecut
  r-igraph
  r-rcolorbrewer
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('45c49918a81260d921adbfeb4538b0c5be97ed202e3b64738b68754efc576e9d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
