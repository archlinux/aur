# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iPAC
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of Protein Amino acid Clustering"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biostrings
  r-gdata
  r-multtest
  r-pwalign
  r-scatterplot3d
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3bd8d311ea1b43a50b0a60358afaeb87')
b2sums=('ba5f5d3f3ef97c208ab13f4b98841a865d5b4f4ee6fe8318bbf34e3f42100d24abf6e0331b7337bfbc93d68bffcb693777d3ee8e676e48fd4d959c57b70ff248')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
