# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bgx
_pkgver=1.68.3
pkgname=r-${_pkgname,,}
pkgver=1.68.3
pkgrel=1
pkgdesc='Bayesian Gene eXpression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-gcrma
  r-rcpp
  boost
)
optdepends=(
  r-affydata
  r-hgu95av2cdf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('570e86f5a75ab472dda41777d62e5e92b98211f2660934e76dc6f51aa2c070a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
