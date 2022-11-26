# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALS
_pkgver=0.0.7
pkgname=r-${_pkgname,,}
pkgver=0.0.7
pkgrel=1
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
sha256sums=('57a195e8c5a3d856cd543c99ae532cc25c83b3b444f513b74447bf4a72378da0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
