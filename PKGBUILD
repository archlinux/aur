# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=linkcomm
_pkgver=1.0-14
pkgname=r-${_pkgname,,}
pkgver=1.0.14
pkgrel=4
pkgdesc='Tools for Generating, Visualizing, and Analysing Link Communities in Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dynamictreecut
  r-igraph
  r-rcolorbrewer
)
optdepends=(
  r-fastcluster
  r-r.rsp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36f1557c65d862fc87635eedfad77f18a5deb66da00895e50e2d5eac0f23b597')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
