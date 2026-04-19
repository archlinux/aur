# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yaImpute
_pkgver=1.0-36
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Nearest Neighbor Observation Imputation and Evaluation Tools"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-ccapp
  r-fastica
  r-gam
  r-gower
  r-randomforest
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('618f4efb6ef8e8e43b62dbe0c51aeb65')
b2sums=('59379d423e3e6b75d1f7f82a58bd4ea0e744a7cf8090faa4cebe5c6f06ad0143f11abe35c8481d81b86ba3735620818b7578cd15b285302081429623d3e5665b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
