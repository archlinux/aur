# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=intervals
_pkgver=0.15.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Working with Points and Intervals"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('95313aa861d2cd7a172f0ef373680cf6')
b2sums=('be2a28e9e2263808e604174fbe3ac5a211f0a9351d6f16da92541a543f11b9f798da1ad521c257bc3833bd963255ec28ed373882f230c030c24a12ef84b73919')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
