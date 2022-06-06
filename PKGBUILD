# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeuratObject
_pkgver=4.1.0
pkgname=r-${_pkgname,,}
pkgver=4.1.0
pkgrel=1
pkgdesc='Data Structures for Single Cell Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-rcpp
  r-rcppeigen
  r-rlang
  r-future
  r-future.apply
  r-progressr
  r-sp
  r-rgeos
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9ca406cb3bd95c588e1a81c5383e3173a446cc0667142b139ca32685b4b20a05')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
