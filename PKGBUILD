# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=venn
_pkgver=1.11
pkgname=r-${_pkgname,,}
pkgver=1.11
pkgrel=1
pkgdesc='Draw Venn Diagrams'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-admisc
)
optdepends=(
  r-ggplot2
  r-ggpolypath
  r-qca
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('33d915c7c90078f1e76e803fa3f02ab5b74dd04de7a9700477e51e0235f19314')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
