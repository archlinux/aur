# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=detectseparation
_pkgver=0.3
pkgname=r-${_pkgname,,}
pkgver=0.3
pkgrel=3
pkgdesc='Detect and Check for Separation and Infinite Maximum Likelihood Estimates'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lpsolveapi
  r-pkgload
  r-roi
  r-roi.plugin.lpsolve
)
optdepends=(
  r-aer
  r-brglm2
  r-covr
  r-knitr
  r-rmarkdown
  r-roi.plugin.alabama
  r-roi.plugin.ecos
  r-roi.plugin.glpk
  r-roi.plugin.neos
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e8d7b7d7e58ea5b2d3d917213ad9876f71671c5ae1dbd97091adc25a7eb8e317')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
