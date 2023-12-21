# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=invgamma
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="The Inverse Gamma Distribution"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d47d0e0a48879a43e135e8e98f10ecee')
b2sums=('0c20e9976c5d7aad339d6fd8162345e4f598421e6d991f728f80eedbcd1fc43d4a985d52e4a89ac6391694418959eeff9f16154b47ec1267ecbf7ebd139ff469')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
