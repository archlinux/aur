# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCASPAR
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A package for survival time prediction based on a piecewise baseline hazard Cox regression model"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('54a7734c80b26a4b0080fbdeb583af02')
b2sums=('0297d6983f03173b29cca424f6c4fa7ed67ddc904eb43b2f7c91dff2dc93fbd076fee93158cd054126c39c8e69883220e5781076d095d74cb2b290a58b941f12')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
