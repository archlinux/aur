# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PRROC
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Precision-Recall and ROC Curves for Weighted and Unweighted Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-rocr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a69d2bae6c1c3295b4d87a121b6a9ff4')
b2sums=('41b04744f886d2fb5c7ff70e700eae2ff184942cfb182827584f6e94a4db3ab96b1b1e9339b855923a690e2064d338a0c109701f974198f7768b22c05203275b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
