# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RiboDiPA
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differential pattern analysis for Ribo-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  r-biocfilecache
  r-biocgenerics
  r-data.table
  r-deseq2
  r-doparallel
  r-elitism
  r-foreach
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-matrixstats
  r-qvalue
  r-rcpp
  r-reldist
  r-rsamtools
  r-s4vectors
  r-txdbmaker
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8d4f447cb5646697ebefa102a1815bbe')
b2sums=('9064448e27e7889e1ad2cbd7f24358b8b695229490983850e7b72ef2df075156f9571de330b683204d16c4f0bacb10efe1ebd308cd919c57e87b1e1d14889823')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
