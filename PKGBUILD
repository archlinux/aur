# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mratios
_pkgver=1.4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ratios of Coefficients in the General Linear Model"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-multcomp
  r-mvtnorm
  r-survpresmooth
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('61f63772d72066769091964b063d31ea')
b2sums=('5a095726ea179a73db4d535bd4b9335efc284b13ac127f13423b6cb288951ebe299cb84251e934a82780b70cb0c3f12b72c3d389b0eec4dc6f1aa4897863e664')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
