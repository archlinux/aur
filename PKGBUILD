# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEM
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='GEM: fast association study for the interplay of Gene, Environment and Methylation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggplot2
  tk
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('053e85ef09070e6432d8b9ebd20850ea9502fc9b8b44b39bca9c7f5d2021b7c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
