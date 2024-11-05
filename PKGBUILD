# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poilog
_pkgver=0.4.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Poisson Lognormal and Bivariate Poisson Lognormal Distribution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('856acda96547132a5c253b37bed1f7d9')
b2sums=('518dcea7c7bb458879f9f0beebd0ceec9ef41195061171ff8e26e7f54a07a506409d6227a08129ae6c56c1bcfda23ce55b696074f938224f9b55ce4ef933cbd9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
