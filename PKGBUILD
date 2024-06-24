# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=locfit
_pkgver=1.5-9.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Local Regression, Likelihood and Density Estimation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-gam
  r-interp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('47205bb4bf32dc99304f231fe5b3181e')
b2sums=('fa8c7af6fef68539753f22bf29de596a120f8bb825d3c479618c5f53291fdca4cd04ab395bb02b9bfe16b60fe25fe35f13300bf0d5f30ea6636d6806dd55e2ce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
