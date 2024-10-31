# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OPWeight
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Optimal p-value weighting with independent information'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-qvalue
  r-tibble
)
optdepends=(
  r-airway
  r-biocstyle
  r-cowplot
  r-deseq2
  r-devtools
  r-ggplot2
  r-gridextra
  r-knitr
  r-matrix
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d89f2213fd4b3d6be1981e9194e50346601fa0384f6d82871421424e92b32fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
