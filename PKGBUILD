# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRmine
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Data package with miRNA-seq datasets from miRmine database as RangedSummarizedExperiment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-deseq2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f2bfc5c74548b15515c808c2994a5f9')
b2sums=('329ec39e901e026dcd62dc7e231350fde75c6718fe7b4bdd4407e1a7ab7836558364fdbecbaeb9ea90d7588da086219217f70f5f843c75a0799cbe7384b52c2d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
