# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=additivityTests
_pkgver=1.1-4.1
pkgname=r-${_pkgname,,}
pkgver=1.1.4.1
pkgrel=1
pkgdesc='Additivity Tests in the Two Way Anova with Single Sub-class Numbers'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0421d0aa00edb67c42a61a66722c43cb95d8cd1dafa6bff603739a6fd0767f02')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
