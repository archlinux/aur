# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rmdformats
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=1.0.4
pkgrel=3
pkgdesc="HTML Output Formats and Templates for 'rmarkdown' Documents"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bookdown
  r-htmltools
  r-knitr
  r-rmarkdown
)
optdepends=(
  r-dt
  r-ggplot2
  r-palmerpenguins
  r-questionr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f29c4a8214849d551f2efbff8d463645e06c19a7fa951cd263ee8493b672c02')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
