# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SISPA
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Method for Sample Integrated Set Profile Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-changepoint
  r-data.table
  r-genefilter
  r-ggplot2
  r-gsva
  r-plyr
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('390f6b86b0a21440799868d3a554c834')
b2sums=('b4fe530cba88ee907b3052d6390b49e0c1619878f9da832c79bde0ac30ea5cfa07b20ba9ae6c4291f6c19f030c075b572cfb534314e3efbcd88ac00113997df5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
