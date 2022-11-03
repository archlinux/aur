# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPARdata
_pkgver=1.27.3
pkgname=r-${_pkgname,,}
pkgver=1.27.3
pkgrel=1
pkgdesc='Data accompanying the DAPAR and Prostar packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-knitr
  r-msnbase
)
optdepends=(
  r-dapar
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a5f17fbfee4a903adfabbfc38a2aff62a5db33c15423bcd5ffacd95ac25c0760')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
