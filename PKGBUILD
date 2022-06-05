# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BridgeDbR
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
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
sha256sums=('1fb0db744637dff07f3536c23fed8161af922cf49fefabd1ad98870159f5098d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
