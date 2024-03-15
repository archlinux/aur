# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=catdata
_pkgver=1.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('f01789b27f0514e073d456f6875e23d7')
b2sums=('0e73203a60a56fceb4176f47966eec76cd78f4abba13d77a93fb44f353f7fda4d5e509065f7a321143c5c79fae3464ad559da34d0a76fe5df042dafa26cd926f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
