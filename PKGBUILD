# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STATegRa
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Classes and methods for multi-omics data integration'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-calibrate
  r-edger
  r-foreach
  r-ggplot2
  r-gplots
  r-gridextra
  r-limma
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-dosnow
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3051c59994ed4fbeb47d030adcc56124c892d49c12c3d74164b7d67f032505c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
