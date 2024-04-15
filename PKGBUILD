# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.base
_pkgver=0.0-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="A Lightweight Core of the 'assertive' Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2ee821abdf770469319622fc5508ce4')
b2sums=('49cd0644c1ddf25d9bd247574f2db7d0529adae92fdf78a79942cfafa5c22095a5ad39ace2b8712ff30e8c616f9b21271bf92810ad7226f06d177cb4255f7461')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
