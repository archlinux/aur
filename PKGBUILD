# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pepXMLTab
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parsing pepXML files and filter based on peptide FDR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-xml
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('79c519a5ba5c9e98a19b081a82dac5c7')
b2sums=('686214684b0e8e566ef3b109023ca1cd3c887dfcbc0fa88ebf75c87e120166f9c3eb888aa123c43a6609fd891ddc86bb4e6d7dbe2d37cff54e4ec975eff45611')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
