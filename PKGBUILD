# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pepXMLTab
_pkgver=1.48.0
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
md5sums=('61d6820e09d91a7c5715aace89d053b9')
b2sums=('44dfefd31538316293154301f8675763b4933fd914a42462fedb89cd726f1d5e8713f24a834149013030cb3f3edd0c806e1ab8182b27985bf786f6d0336c4516')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
