# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flashClust
_pkgver=1.01-2
pkgname=r-${_pkgname,,}
pkgver=1.01.2
pkgrel=4
pkgdesc='Implementation of optimal hierarchical clustering'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('48a7849bb86530465ff3fbfac1c273f0df4b846e67d5eee87187d250c8bf9450')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
