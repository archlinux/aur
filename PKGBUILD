# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NPARC
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Non-parametric analysis of response curves for thermal proteome profiling experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-broom
  r-dplyr
  r-magrittr
  r-rlang
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-devtools
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-rprojroot
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ac166444ad18872c9edde6d16d9151e65c63ef8e302f983cfeea93a47f41a5b7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
