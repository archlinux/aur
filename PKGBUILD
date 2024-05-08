# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phantasus
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visual and interactive gene expression analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-assertthat
  r-biobase
  r-ccapp
  r-config
  r-curl
  r-data.table
  r-deseq2
  r-edger
  r-fgsea
  r-fs
  r-geoquery
  r-ggplot2
  r-gtable
  r-htmltools
  r-httpuv
  r-httr
  r-jsonlite
  r-limma
  r-opencpu
  r-phantasuslite
  r-pheatmap
  r-protolite
  r-rhdf5
  r-rhdf5client
  r-rook
  r-scales
  r-stringr
  r-svglite
  r-xml
  r-yaml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2f928065c75c3581ae26e7129339f1bc')
b2sums=('66b0cd827bc5b3b77654daa61898521ca97090d94843f0552614302edaac7599283fcf6442dcdd638526c58380fbe888c171a8f79b7b7de67fe94b1f94d75c11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
