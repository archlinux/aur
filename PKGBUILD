# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=detectseparation
_pkgver=0.2
pkgname=r-${_pkgname,,}
pkgver=0.2
pkgrel=4
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
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('09184f7b56de8c9dde61cc6da07ea725f5f8cb8e400d7490b62b07abddd5d79d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
