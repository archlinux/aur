# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mygene
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Access MyGene.Info_ services"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-genomicfeatures
  r-hmisc
  r-httr
  r-jsonlite
  r-plyr
  r-s4vectors
  r-sqldf
  r-txdbmaker
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f53f04381d0b954109c518d4d4876f96')
b2sums=('6ebb210477852b0fae0764144fe9716e059a0a719824c77fb2ebe596d2f5258e164360eee85b633f923b8618f4ca18c849e28fe103472f04cb3ed957ab321063')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
