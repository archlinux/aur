# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=spatstat.model
_pkgver=3.3-3
pkgname=r-${_pkgname,,}
pkgver=3.3.3
pkgrel=1
pkgdesc="Parametric Statistical Modelling for the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-goftest
  r-spatstat.data
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.random
  r-spatstat.sparse
  r-spatstat.utils
  r-tensor
)
optdepends=(
  r-fftwtools
  r-glmnet
  r-gsl
  r-locfit
  r-nleqslv
  r-sm
  r-spatial
  r-spatstat
  r-spatstat.linnet
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2b1247feddd849d11ab80204676697d8cbd6d69f07dddb8158a3d76200d202b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
