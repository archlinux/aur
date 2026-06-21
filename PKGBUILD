# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eva
_pkgver=0.2.7
pkgname=r-${_pkgname,,}
pkgver=0.2.7
pkgrel=1
pkgdesc='Extreme Value Analysis with Goodness-of-Fit Testing'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-envstats
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-spatialextremes
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c379893f6fdac1b36bd50e930001eed02e153db89afb9c053d984d0d0f3556e9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
