# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GWASExactHW
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Exact Hardy-Weinburg Testing for Genome Wide Association Studies"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('717c13915dbf0c689722e43f98d25f96')
b2sums=('e0fcd91d6915541fae4440c668292f4fedf1bfc4c4fe2951eb3db56c4ec794ad528019394e83a59c94eba3488380615dcbb84ae0fee11f9cff82a19e3ab6c823')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
