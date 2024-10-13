# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R2jags
_pkgver=0.8-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Using R to Run 'JAGS'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-abind
  r-coda
  r-r2winbugs
  r-rjags
  r-stringr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('58acbde539ecc0f4668862b17fac60f8')
b2sums=('688ef12712195add8fea264b96454490ff295b3a31b2730ba4f933a779198923f0835bf2b0cf9c7c0ed872506b380b5513a85e893cd349190148593f99196825')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
