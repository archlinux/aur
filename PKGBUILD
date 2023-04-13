# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=leidenbase
_pkgver=0.1.17
pkgname=r-${_pkgname,,}
pkgver=0.1.17
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
sha256sums=('9adda0c6d7210f8c9ca8348e5c27ed18e6daef24305b57b032be78de65af4cb1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
