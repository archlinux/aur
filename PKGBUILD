# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phantasus
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visual and interactive gene expression analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-apeglm
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
md5sums=('58fab5a3c5c66eebcbfc771417cc687a')
b2sums=('174327e5aaef64c27bc45c7e29971dcb676268206f0663e5f514e201caa78d7669be38fe24a5ce98da2ec73c1c75b35a35fec0aec552afd267da3e737de543a6')

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
