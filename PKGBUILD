# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplot
_pkgver=0.1.7
pkgname=r-${_pkgname,,}
pkgver=0.1.7
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
  r-yulab.utils
)
optdepends=(
  r-ggtree
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f6250f5f6d1addc8d5717be80a92c569bfd83d35bce2e3dbeb251c9ae1be8616')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
