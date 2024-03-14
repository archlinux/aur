# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CpGassoc
_pkgver=2.60
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Association Between Methylation and a Phenotype of Interest"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-qvalue
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('668c3a5a22fb7e632319a4059f7fd5b2')
b2sums=('239ceeaa81dcafa4c1c5959edc9e47f869e24bce8178e2c96fc6074c760ec0d5cf2fb571a9a6da67a9c47ce884a3ff2a749de38d63b5afc0bfb9603571f58650')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
