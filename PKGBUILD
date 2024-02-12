# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PERFect
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Permutation filtration for microbiome data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-fitdistrplus
  r-ggplot2
  r-phyloseq
  r-psych
  r-sn
  r-zoo
)
optdepends=(
  r-ggpubr
  r-kableextra
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('04293e236ab353679d23cf30fa18b49f')
b2sums=('980c886b4904b002190ba78a61c2b11152aa4e0ebfe7d4fadd0b8b8230b10e8b1eda5b33d6089ff6e09fea4ec5aa6a141e6551d726253e8f0fc903b88e39f528')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
