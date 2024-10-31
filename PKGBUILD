# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Clomial
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infers clonal composition of a tumor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-matrixstats
  r-permute
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('02d9267198f2e0518f8e4d3209176cdd')
b2sums=('33e51ee983d1e7338adc5e6afa58d9eb2ec25f5a5465a3cf77d203bf162c20190995885cc65c8742e4ff6b48efcfb6f01476ac228bd9b0676f2172f02f263fc5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
