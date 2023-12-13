# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yaImpute
_pkgver=1.0-34
pkgname=r-${_pkgname,,}
pkgver=1.0.34
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
sha256sums=('b4c898c95fca784480bbbc239c78c85dc9f45a96c34c563ea7e81248ef8a8a73')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
