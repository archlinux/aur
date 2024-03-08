# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LowMACAAnnotation
_pkgver=0.99.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="LowMACAAnnotation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9e0d3fe7f30fe48aef9c4387eb5bacfa')
b2sums=('2f3e56055c6edce4de6c6a8aa7815ccf5990164a8295edee7581ca8167d4d7498e39a2ce0a94994747b75b8702dcef9778d15f306d1be1452af0af886b7178f4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
