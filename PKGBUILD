# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=leidenbase
_pkgver=0.1.25
pkgname=r-${_pkgname,,}
pkgver=0.1.25
pkgrel=1
pkgdesc='R and C/C++ Wrappers to Run the Leiden find_partition() Function'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9eaeb33597fb2926b0ec1723dec44a17e1a08919eac873fa48a6cd697036d5d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
