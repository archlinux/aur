# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPlots
_pkgver=1.62.0
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
md5sums=('8628e10336b70423970d1713e0486ccc')
b2sums=('7dac496edceee226db4f0a87fe045f20487769276b85195b594a45e86f18e4e08af7d111ff61b6ede30a0565ca2344ede3caf209d2dd4670db1fdfb1dd36d35a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
