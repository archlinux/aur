# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NBSplice
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Negative Binomial Models to detect Differential Splicing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-car
  r-edger
  r-ggplot2
  r-mppa
  r-reshape2
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cb190f38237a1d12d1fb2eb1f6de0d47f5aabb517eda37c2abd9301683956cc2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
