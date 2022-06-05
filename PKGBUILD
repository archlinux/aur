# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biodbLipidmaps
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='biodbLipidmaps, a library for connecting to the Lipidmaps Structure database'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-biodb
  r-lifecycle
  r-r6
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-knitr
  r-lgr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('80519965006d734057b1905a27e2abca5b529dfed11b74ab70ea0f3cab3c7c7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
