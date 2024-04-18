# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PSEA
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Population-Specific Expression Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8f9f8210c265d722d76668e19a6fd7c')
b2sums=('388de01f9286438d7fc5c35d1855768a6f90ce59734de754e5be3b6877c830e61a5cdf73d3f5167db30e9111f09bccb564fca4643aa51393f93cb75d55f3462b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
