# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CatEncoders
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Encoders for Categorical Variables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-data.table
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f506add6948594bcf6a83e4fc5881b2')
b2sums=('8d35939741cf2c9156c3bf9861aa0374221f56f16a8232a111a277ea50730ca99bb73afe1309499beee7cf064d73ae591acdb6bd9e88b2a889590a94499661e0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
