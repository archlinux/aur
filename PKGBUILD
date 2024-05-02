# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bgx
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=1.70.0
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
sha256sums=('29e8cdb0135ecae39115db359a2d47eb87cca5a263a764aa99783b11309af469')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
