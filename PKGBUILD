# system requirements: gsl
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AMOUNTAIN
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Active modules for multilayer weighted gene co-expression networks: a continuous optimization approach'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  gsl
)
optdepends=(
  r-biocstyle
  r-knitr
  r-qgraph
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9209dd4d6f33856ed463a54fa3d4e40d91969e03a8926b0bd84c5381d031b48a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
