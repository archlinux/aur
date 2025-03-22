# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=mediation
_pkgver=4.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc='Causal Mediation Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-hmisc
  r-lme4
  r-lpsolve
  r-mvtnorm
  r-sandwich
)
optdepends=(
  r-quantreg
  r-speedglm
  r-suppdists
  r-testthat
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d41765c66464d7f13babf7b2761f48b9')
b2sums=('6dd455dcdb77b8c22e01caf70c78c94a4de30348b78cd7d3db6710c065537e6d8caeeebae7608322c13ff799cb41ca6dff4474a17f78f3b36f0d124f3dc1b847')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
