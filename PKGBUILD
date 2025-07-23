# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R2WinBUGS
_pkgver=2.1-23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Running 'WinBUGS' and 'OpenBUGS' from 'R' / 'S-PLUS'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-coda
)
optdepends=(
  r-brugs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e546492a4760bd75403bda75bd92225d')
b2sums=('311af5eb090819ef622a813b0c14cf6d56d8476d80a1b68d7e6ea5ae4adac515780ad249df48c2ba5d6b3698267950813426c4abc1b9f3e06d0f71e9b8c56bf6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
