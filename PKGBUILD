# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=calm
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Covariate Assisted Large-scale Multiple testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('47ce0e38756cb87bfb7380e6d15c0755')
b2sums=('b9e857c95a94d7eb6921791a2c9f538661c8ae7cd439b42c23b715ed771d63597fa3b60a08818cd137b84552795b7ddaf7fe40db2070af9934bc615f84b69f48')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
