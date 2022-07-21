# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spam
_pkgver=2.9-0
pkgname=r-${_pkgname,,}
pkgver=2.9.0
pkgrel=1
pkgdesc='SPArse Matrix'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-dotcall64
)
optdepends=(
  r-fields
  r-knitr
  r-matrix
  r-r.rsp
  r-rmarkdown
  r-spam64
  r-testthat
  r-truncdist
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0ab69af44e48f7db0fecfd8d79cc9baba96872d6d5ae1b17c75b6cc0a8106d1c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
