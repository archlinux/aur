# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=messina
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Single-gene classifiers and outlier-resistant detection of differential expression for two-group and survival problems'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('EPL')
depends=(
  r
  r-foreach
  r-ggplot2
  r-plyr
  r-rcpp
)
optdepends=(
  r-antiprofilesdata
  r-biobase
  r-biocstyle
  r-domc
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4e3826cb5c1575afb615a5fd6de8a69278be092673d47369513f261d7b968525')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
