# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPlots
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="analysis plots and data class for gated flow cytometry data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-vcd
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2570398126ab0fc914a985d9a8234a79')
b2sums=('431f1f1cff76094cbff886981b42a26aea89c4d3fe985b20b8fa552b87d5380035d042eb461b3c5ef0139008b86d03e362161b70ed70c4dda2e3013ebbe91a2d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
