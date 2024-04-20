# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSA
_pkgver=1.03.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Set Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-impute
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('54162cce1f159a815e2f542498d17f37')
b2sums=('cbeb925f101ab97ef59b36977d905fcc8dd69208c3f07e294871319e6c85d09b217ef0b0b4ce737d2b44639b48d10cb372ca71ec06d06a44a035fc78867192b5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
