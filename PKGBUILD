# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eva
_pkgver=0.2.6
pkgname=r-${_pkgname,,}
pkgver=0.2.6
pkgrel=3
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
sha256sums=('c2b8d972a6229bfdcd529576bd5f056c10343eed7b42ee876129f0d51ecfb0ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
