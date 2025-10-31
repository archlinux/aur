# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NOISeq
_pkgver=2.54.0
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
md5sums=('e65bb7d1826a31623729b4e9576fdba9')
b2sums=('a68b71f6c175eddc2e32157af887880bf90c6e193d0442515089e98c48f9478138034c00f5a013eefbd34c178bd57ffec22e85166233962ea9514b7ce5f64193')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
