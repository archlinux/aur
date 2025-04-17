# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NOISeq
_pkgver=2.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Exploratory analysis and differential expression for RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('702b1a09599ff2d8ece321c89548dcd1')
b2sums=('32409687d153394e53a31830219654858c67943fe2430c4dc524f609284d4d757135b7ad5f66e0822faca00ba9a4514fe648da99ae42223fd8540cdbe4cdda03')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
