# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=zCompositions
_pkgver=1.5.0-2
pkgname=r-${_pkgname,,}
pkgver=1.5.0.2
pkgrel=1
pkgdesc='Treatment of Zeros, Left-Censored and Missing Values in Compositional Data Sets'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-nada
  r-truncnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c0f40827bf8722602f5ff07599c7312e2fe81623f561d8fe896a9e0e0ea26c22')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
