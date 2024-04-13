# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRBaseConverter
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A comprehensive and high-efficiency tool for converting and retrieving the information of miRNAs in different miRBase versions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c823ce909e1ae3a584fb5790fecf6b54')
b2sums=('d2daa90dd62648bbb4a4f9e37cf6038aac0c313ddaa46ac07b317fbedbcc1e4a207dc2cd491888f30c8218bd7a8911c7052fb839b9e5acbcbd5108f3789963d4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
