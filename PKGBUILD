# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msgps
_pkgver=1.3.4
pkgname=r-${_pkgname,,}
pkgver=1.3.4
pkgrel=1
pkgdesc='Degrees of Freedom of Elastic Net, Adaptive Lasso and Generalized Elastic Net'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74775a6b9e8c8787d91a34af1aa486bc7638d0ab855860824a4d023c41e0c800')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
