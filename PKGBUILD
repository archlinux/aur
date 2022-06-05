# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clue
_pkgver=0.3-61
pkgname=r-${_pkgname,,}
pkgver=0.3.61
pkgrel=1
pkgdesc='Cluster Ensembles'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-ape
  r-cba
  r-cclust
  r-e1071
  r-flexclust
  r-flexmix
  r-kernlab
  r-lpsolve
  r-mclust
  r-modeltools
  r-movmf
  r-quadprog
  r-relations
  r-rweka
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('71311b16ce380fd9a8834be95b55b3d1b47e4ee2b8acb35b8d481138c314dc31')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
