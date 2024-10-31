# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDNAinRNAseqData
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA-seq data with different levels of gDNA contamination"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-experimenthub
  r-rcurl
  r-rsamtools
  r-xml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6eb5c3023097b68c183066f1219c2b35')
b2sums=('1735a17ad4b58afefd3dfc79516f8a637893aed32b29c8ada48e2b49cbde7365853c8534e55a1ae53b3387e447768ae80bfa9f2a4cd86aa0723f03554571bcdc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
