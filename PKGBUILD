# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lsa
_pkgver=0.73.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Latent Semantic Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-snowballc
)
optdepends=(
  r-tm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('800050d8d24b24ab3f89a551974cb5c7')
b2sums=('4d6f37422f553e66bdc2b3acf7cfade4ecd973529f3c2c4b412e79bbd04a2461e8727e08a90026471928642340dd26fa271e4251c6591290ce685746de143857')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
