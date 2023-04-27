# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=immunoClust
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='immunoClust - Automated Pipeline for Population Detection in Flow Cytometry'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-flowcore
  gsl
)
optdepends=(
  r-biocstyle
  r-testthat
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd494cb1fff33c1fd078ba7aaccee548d4bf6f2eff5ebe232e40ae122936a2dd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
