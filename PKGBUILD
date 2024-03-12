# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clValid
_pkgver=0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Validation of Clustering Results"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-annotate
  r-biobase
  r-go.db
  r-kohonen
  r-mclust
  r-moe430a.db
  r-rankaggreg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9e7b76ee97d9027dbcaeb5931d583bc9')
b2sums=('53fc62181c0adf5adc9f72652aa43ed08ea4dae47fb58e98718b9a465901d683816f104b1a11ee95989ed2e55add63526e399c9efc13fe9e6d08d495d7b5d622')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
