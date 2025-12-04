# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=catdata
_pkgver=1.2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Categorical Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-e1071
  r-ecdat
  r-flexmix
  r-gee
  r-geepack
  r-glmmml
  r-glmnet
  r-knitr
  r-lme4
  r-lpsolve
  r-mboost
  r-mlogit
  r-ordinal
  r-party
  r-penalized
  r-pscl
  r-qvcalc
  r-rms
  r-vcdextra
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('337ed4887c9d8e628802de1f612ff899')
b2sums=('c67cc9b5c5696a773c912cf249a80f8f37a3b4bbc9a39cec874653f3945ac41a3affef4474755788f07268f2a0a9e3540a0c7692d656082c48ad809fd4141244')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
