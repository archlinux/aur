# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yaImpute
_pkgver=1.0-33
pkgname=r-${_pkgname,,}
pkgver=1.0.33
pkgrel=1
pkgdesc='Nearest Neighbor Observation Imputation and Evaluation Tools'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-ccapp
  r-fastica
  r-gam
  r-gower
  r-parallel
  r-randomforest
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('58595262eb1bc9ffeeadca78664c418ea24b4e894744890c00252c5ebd02512c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
