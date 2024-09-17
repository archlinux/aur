# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=stinepack
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Stineman, a Consistently Well Behaved Method of Interpolation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57208bd2bc0f0784efa3a296c116b1d7')
b2sums=('768f7e97cfc75ecb381a2995c7405904ac294c6909b190680d3039b937839e2efd70c2733813f909ebf2e017df6a23e6c122834cff51726ae57b0a9d38eb9ed8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
