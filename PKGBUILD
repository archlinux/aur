# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPlots
_pkgver=1.56.0
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
md5sums=('d5e201f91b402cef9909bf89b3c52735')
b2sums=('cfc6ed315bcb58a3d5f2b0f1758ec552861fd6f532193be543fa0e74f729141b21f6dd7ecddd0fb864ac7627d11bc0606d743e4a468f552b022b7ee33a32b70c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
