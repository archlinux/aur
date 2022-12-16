# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affyPLM
_pkgver=1.74.1
pkgname=r-${_pkgname,,}
pkgver=1.74.1
pkgrel=1
pkgdesc='Methods for fitting probe-level models'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
  r-biocgenerics
  r-gcrma
  r-preprocesscore
  r-zlibbioc
)
optdepends=(
  r-affydata
  r-mass
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('566b275aebf1018e851201cb5b244f4a7bfb4d02952c8cda50c8ae05c6ce2861')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
