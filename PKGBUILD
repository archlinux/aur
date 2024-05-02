# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pepXMLTab
_pkgver=1.38.0
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
md5sums=('7d5e301ae5caa6fe0da0b93d208fbe76')
b2sums=('d61004fa578c823474cf4a250deb099be5f96e9038065d9743d8d4fa40220797761a12cd75665b65cedfb913136938626a265649a57a2c868a944579f060293e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
