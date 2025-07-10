# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clv
_pkgver=0.3-2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster Validation Techniques"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e4422fb222407c0422aa39740d407930')
b2sums=('22bf0d08ce8acf20ff38ac37229bf3a46936e4218cc90aff57342f8cfba7099ccc02aa270e698fc9565ecc69be7eb2e3c697ed323875be4bdad001cd8c9186b5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
