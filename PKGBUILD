# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfittext
_pkgver=0.10.1
pkgname=r-${_pkgname,,}
pkgver=0.10.1
pkgrel=1
pkgdesc="Fit Text Inside a Box in 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gridtext
  r-shades
  r-stringi
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ea50ca8f74560c744c8a0b3becc77315a07bd948944271d88ad6ec174bc106fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
