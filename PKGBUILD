# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=mediation
_pkgver=4.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
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
md5sums=('769ce1efccdde1bfaf31ca4a07a606cc')
b2sums=('20790f853716d8c7bbea378c4782260e573d50b4b4cca1318f969606bfb60bfd9f807a1a374cf1be40a6264d63e6f1f20ff3328ff5e5506cf08e452ffb283c2b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
