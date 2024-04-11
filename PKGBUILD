# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RWekajars
_pkgver=3.9.3-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="R/Weka Interface Jars"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rjava
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dfdbabfb09ff87cbc2570b35ed2534c0')
b2sums=('280a62c7a106188f47bec827163420fd6d53108f540005ff9871031ebc38a63bf5d338330bdb0df22bca40b94aeee01a1c7d696216788a22c902f09a7dbec2b2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
