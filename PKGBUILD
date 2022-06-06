# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=smatr
_pkgver=3.4-8
pkgname=r-${_pkgname,,}
pkgver=3.4.8
pkgrel=4
pkgdesc='(Standardised) Major Axis Estimation and Testing Routines'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3669388f4abc41fac7bf008680c2fa8eddf5dffe20f5c33522b05357cc5b1863')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
