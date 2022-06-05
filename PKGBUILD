# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALS
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=0.0.6
pkgrel=3
pkgdesc='Multivariate Curve Resolution Alternating Least Squares (MCR-ALS)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-iso
  r-nnls
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca90d27115ae9e476967f521bf6935723e410a3bf92477e7570e14bfd3b099eb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
