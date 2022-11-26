# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genlasso
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=1.6.1
pkgrel=1
pkgdesc='Path Algorithm for Generalized Lasso Problems'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dd2d6b7b17ceef4ef058ef559d658bddb52c2949d9c8401370d56e86c9d7172e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
