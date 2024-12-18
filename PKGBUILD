# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ProteoMM
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Multi-Dataset Model-based Differential Expression Proteomics Analysis Platform'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biomart
  r-gdata
  r-ggplot2
  r-ggrepel
  r-gtools
  r-matrixstats
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('116e3668fbab264babb48d5d54be125abfdb9ffac2cff14b4281b66a91baa17c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
