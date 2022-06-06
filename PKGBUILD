# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nsprcomp
_pkgver=0.5.1-2
pkgname=r-${_pkgname,,}
pkgver=0.5.1.2
pkgrel=4
pkgdesc='Non-Negative and Sparse PCA'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-mass
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e95c877b7d45aa89cee7c90e496bd33dcb58d761851c0ca10cea45e630f8cfe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
