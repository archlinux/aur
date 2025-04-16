# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cqn
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
pkgrel=1
pkgdesc='Conditional quantile normalization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-mclust
  r-nor1mix
  r-preprocesscore
  r-quantreg
)
optdepends=(
  r-edger
  r-scales
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('25fe5a0753f00f2f09f8665b33aa97fdcb47a20c790ceb55b0bbb2d498d03017')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
