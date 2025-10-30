# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ssize
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=1.84.0
pkgrel=1
pkgdesc='Estimate Microarray Sample Size'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-gdata
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b2ec77aa07bd28c4251c404fae8eb9dbc9fd32aa2db9e78d5648927715e1fefc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
