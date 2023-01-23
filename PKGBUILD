# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phyclust
_pkgver=0.1-33
pkgname=r-${_pkgname,,}
pkgver=0.1.33
pkgrel=1
pkgdesc='Phylogenetic Clustering (Phyloclustering)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('38786608193bcad6aeb5517f2d5f836c9773bdd09fc484b4bd40b06a71f5a413')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
