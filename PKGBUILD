# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PERFect
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8a2ff000c30fa0bb5bcc2263b936e77')
b2sums=('9d9b5c75b5295626636548ebeba862d87553c4b9def46d5706f37d31e2b8c83055e849a169fb0c5848dea46e1daabd4dab58c9044e026f18f2be25f18af9cabf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
