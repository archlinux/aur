# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splitstackshape
_pkgver=1.4.8
pkgname=r-${_pkgname,,}
pkgver=1.4.8
pkgrel=4
pkgdesc='Stack and Reshape Datasets After Splitting Concatenated Values'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('656032c3f1e3dd5b8a3ee19ffcae617e07104c0e342fc3da4d863637a770fe56')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
