# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplot
_pkgver=0.1.9
pkgname=r-${_pkgname,,}
pkgver=0.1.9
pkgrel=3
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
sha256sums=('af0763620a757571caac769bad5398c22a4890af6cb5646ac5fa9039a114bb12')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
