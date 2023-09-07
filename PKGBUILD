# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=spatstat.model
_pkgver=3.2-6
pkgname=r-${_pkgname,,}
pkgver=3.2.6
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
  r-maptools
  r-nleqslv
  r-randomfields
  r-randomfieldsutils
  r-sm
  r-spatial
  r-spatstat
  r-spatstat.linnet
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('981f4785a290ccebe86fbd4a54dbad2a25c3b3e8fa6f0b96e1475948b4357ad3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
