# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ape
_pkgver=5.7-1
pkgname=r-${_pkgname,,}
pkgver=5.7.1
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
sha256sums=('8b09c71218d8aa629e43bc807b433a4e30a61847d91b2810e31c366f0fe5057a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
