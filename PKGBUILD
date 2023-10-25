# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tkWidgets
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=1.80.0
pkgrel=1
pkgdesc='R based tk widgets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dyndoc
  r-widgettools
)
optdepends=(
  r-biobase
  r-hgu95av2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3267fca54e0f0e1232365e8bf71b104e7febfc5cb47d5be8304da857a9cb4885')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
