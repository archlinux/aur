# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ape
_pkgver=5.7
pkgname=r-${_pkgname,,}
pkgver=5.7
pkgrel=1
pkgdesc='Analyses of Phylogenetics and Evolution'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
  r-rcpp
)
optdepends=(
  r-expm
  r-gee
  r-igraph
  r-phangorn
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('09b4aee7e8bf013c00dd66f5fbe954830e439d97416b278bfbd918bb3da1f569')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
