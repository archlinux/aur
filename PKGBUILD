# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=messina
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
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
sha256sums=('2443f46bf8901d1e943a9ef33857644542195c0f32d1a6833bb186de7a926eab')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
