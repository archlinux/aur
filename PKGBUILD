# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcpi
_pkgver=1.40.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Molecular Informatics Toolkit for Compound-Protein Interaction in Drug Discovery"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-curl
  r-doparallel
  r-foreach
  r-gosemsim
  r-httr2
  r-rjson
  r-rlang
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('48c49b19548e2a9d112e844dd233593f')
b2sums=('c462528f782f46f382616f24b28d3011a183f85b618201139e64749b7750f50481fec0fe5389f16b4bbff1a7e3d32da2f6036b9f38914283bd2a86d41252ebd7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
