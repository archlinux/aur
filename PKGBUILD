# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cobs
_pkgver=1.3-8
pkgname=r-${_pkgname,,}
pkgver=1.3.8
pkgrel=1
pkgdesc='Constrained B-Splines (Sparse Matrix Based)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-quantreg
  r-sparsem
)
optdepends=(
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2c2049c7cb868a2e4e1a530fe7218fac56e6157ef64ad57b91c5bb457dbc9821')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
