# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=leidenbase
_pkgver=0.1.30
pkgname=r-${_pkgname,,}
pkgver=0.1.30
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
sha256sums=('5415a5a87665fe03dc439c29abb8fd5aed0a536b806e8e12b04fafcdc511e2cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
