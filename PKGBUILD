# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggstance
_pkgver=0.3.6
pkgname=r-${_pkgname,,}
pkgver=0.3.6
pkgrel=3
pkgdesc="Horizontal 'ggplot2' Components"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cli
  r-ggplot2
  r-plyr
  r-rlang
  r-withr
)
optdepends=(
  r-covr
  r-hmisc
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cd9ad4fb83c583009ee45371c7d02d32b33d06238d3f0162b3ba9851e27a6372')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
