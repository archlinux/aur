# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qcmetrics
_pkgver=1.40.1
pkgname=r-${_pkgname,,}
pkgver=1.40.1
pkgrel=1
pkgdesc='A Framework for Quality Control'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-knitr
  r-pander
  r-s4vectors
  r-xtable
)
optdepends=(
  r-affy
  r-biocstyle
  r-ggplot2
  r-lattice
  r-msnbase
  r-mzr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('93bef8a9ec601a0e9169dbc1defec443736f7eec2e9356393dd60f5a7b90e327')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
