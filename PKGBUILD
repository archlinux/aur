# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcatest
_pkgver=1.28.2
pkgname=r-${_pkgname,,}
pkgver=1.28.2
pkgrel=1
pkgdesc='Genotype Conditional Association TEST'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-lfa
)
optdepends=(
  r-ggplot2
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('743c6b3790c334cbd1969376b0b28e795dfc4ee1a084390bd429cad34db84bb8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
