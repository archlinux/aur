# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OMICsPCAdata
_pkgver=1.17.0
pkgname=r-${_pkgname,,}
pkgver=1.17.0
pkgrel=1
pkgdesc='Supporting data for package OMICsPCA'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-multiassayexperiment
)
optdepends=(
  r-kableextra
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('18867ce475dee1681caa41c328500335bb2ccb360bc1a7cc86e67ae2f53a0b0c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
