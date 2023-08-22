# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FSelector
_pkgver=0.34
pkgname=r-${_pkgname,,}
pkgver=0.34
pkgrel=1
pkgdesc='Selecting Attributes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-entropy
  r-randomforest
  r-rweka
)
optdepends=(
  r-mlbench
  r-rpart
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('29d16e4acb266d91c4648dfa36d416ca522b0c18327d5b6e3c9a7e93a777db1e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
