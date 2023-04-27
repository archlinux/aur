# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MultiBaC
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Multiomic Batch effect Correction'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-multiassayexperiment
  r-plotrix
  r-ropls
  r-pcamethods
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b108f989260105ded8e790fa495357161f0742eaa5dbdb93480b06c4770d8ee3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
