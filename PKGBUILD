# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BridgeDbR
_pkgver=2.10.2
pkgname=r-${_pkgname,,}
pkgver=2.10.2
pkgrel=1
pkgdesc='Code for using BridgeDb identifier mapping framework from within R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-curl
  r-rjava
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ed3446db3c982659cc3e13fe4c2b7eb1d7885c0528fab406c15afa495bd93287')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
