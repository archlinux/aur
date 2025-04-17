# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rbsurv
_pkgver=2.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust likelihood-based survival modeling with microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55cbb212de4d56902052ce6c5b5fce25')
b2sums=('d555cc2e3048c0f3d9b5f4a94d918d7258f952714c7ac0fd3225508b6ee7019675aca75b2c9bfdaea9798e45bbd99620bcf65f044b73e73c937d1e0429482796')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
