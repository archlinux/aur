# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R2WinBUGS
_pkgver=2.1-24
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
md5sums=('5071d688bed14c0f5dc4d844b02aae23')
b2sums=('8702c71739e4235cc6ad47fcc3dc5ac61b55f2ad3243744195ab905831a97e3b20b4059c47305b0a4cf56987397e5da53566457fa6ef06527b6bb5b68bab96b1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
