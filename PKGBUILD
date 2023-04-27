# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ewceData
_pkgver=1.7.1
pkgname=r-${_pkgname,,}
pkgver=1.7.1
pkgrel=1
pkgdesc='The ewceData package provides reference data required for ewce'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-experimenthub
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-ggplot2
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85e601cf464b957a24f97c739fa2cf9a6e19b64f85fa1f576418ab0d016ce2bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
