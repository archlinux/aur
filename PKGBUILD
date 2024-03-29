# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowPlots
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('523b0d79646813f56d711d3e0f38a5e9')
b2sums=('5b35b308070ff5bef1d1dd8ade1633843eb34202f32dcc311fe8519b28184e4d940446bec0f71d898d13acdc70a9899338f3d10753f62aeee544ede5ca309b92')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
