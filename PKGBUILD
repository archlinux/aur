# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sm
_pkgver=2.2-6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Smoothing Methods for Nonparametric Regression and Density Estimation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-gam
  r-interp
  r-misc3d
  r-rgl
  r-rpanel
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c09c5d6260479b702349067c2bd3588c')
b2sums=('0b3ef4419541959c507c1141ef52adf23554d03c76259ceaeaed60b8646e8b1dd09ece22155a2b56239788c86dfaededf693d7470bb8e9d99c3a5f773d8e8df1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
