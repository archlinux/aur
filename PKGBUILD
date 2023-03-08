# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplot
_pkgver=0.1.10
pkgname=r-${_pkgname,,}
pkgver=0.1.10
pkgrel=1
pkgdesc="Decorate a 'ggplot' with Associated Information"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ggfun
  r-ggplot2
  r-ggplotify
  r-magrittr
  r-patchwork
)
optdepends=(
  r-ggtree
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d937768241f887628b88bb3b49dd6cbe9b7dae39ae7054e7380a9836721a67d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
