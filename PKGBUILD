# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genlasso
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=1.5
pkgrel=5
pkgdesc='Path Algorithm for Generalized Lasso Problems'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('de1cfe83a5e851f41a0de55ebf58980c849ffbf978751c401fcdc767377ec01d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
